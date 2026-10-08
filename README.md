# Context Dev Ruby API library

Context.dev is a web scraping API for AI agents and LLMs. This SDK turns any URL into clean, LLM-ready markdown, crawls whole sites, searches the web, takes screenshots and extracts structured JSON against a schema you define, all with one API key. Proxies, JavaScript rendering and anti-bot handling run on Context.dev's side, so there is no headless browser to host.

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/context.dev).

The REST API documentation can be found on [docs.context.dev](https://docs.context.dev/).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "context.dev", "~> 2.24.0"
```

<!-- x-release-please-end -->

## Usage

Set `CONTEXT_DEV_API_KEY` to your API key; the client reads it automatically.

### Scrape markdown and HTML

```ruby
require "bundler/setup"
require "context_dev"

context_dev = ContextDev::Client.new

page = context_dev.web.scrape(
  url: "https://example.com",
  formats: {markdown: true, html: true}
)

puts(page.markdown.data)
puts(page.html.data)
```

### Extract structured JSON

```ruby
require "bundler/setup"
require "context_dev"

context_dev = ContextDev::Client.new

page = context_dev.web.scrape(
  url: "https://example.com",
  formats: {json: true},
  json_params: {
    schema: {
      type: "object",
      properties: {
        title: {type: ["string", "null"]},
        description: {type: ["string", "null"]}
      },
      required: ["title", "description"],
      additionalProperties: false
    }
  }
)

puts(page.json.data)
```

### Extract relevant highlights

Return the passages that answer a question about the page.

```ruby
require "bundler/setup"
require "context_dev"

context_dev = ContextDev::Client.new

page = context_dev.web.scrape(
  url: "https://example.com",
  formats: {highlights: true},
  highlights_params: {query: "What is this domain used for?"}
)

puts(page.highlights.data)
```

### Take a screenshot

The screenshot is returned as a base64 image data URL.

```ruby
require "bundler/setup"
require "context_dev"

context_dev = ContextDev::Client.new

page = context_dev.web.scrape(
  url: "https://example.com",
  formats: {screenshot: true}
)

puts(page.screenshot.data)
```

## What you can do

| Task | Method |
| --- | --- |
| Scrape a URL to markdown, HTML, JSON, highlights or a screenshot | `context_dev.web.scrape` |
| Crawl a site and get every page as markdown | `context_dev.web.web_crawl_md` |
| Map every URL on a domain | `context_dev.web.map_urls` |
| Search the web | `context_dev.web.search` |
| Take a screenshot of a page | `context_dev.web.screenshot` |
| Parse PDFs and documents | `context_dev.parse.handle` |
| Run thousands of URLs as a batch | `context_dev.batch.submit` |
| Watch a page for changes | `context_dev.monitors.create` |
| Look up a company's logo, colors and brand data | `context_dev.brand.retrieve` |

## Use it from an AI agent

Context.dev also ships as a plugin for [Claude](https://github.com/context-dot-dev/claude-plugin), [Cursor](https://github.com/context-dot-dev/cursor-plugin) and [Gemini CLI](https://github.com/context-dot-dev/gemini-cli-context), and as tools for [LangChain](https://github.com/context-dot-dev/langchain-context) and [Haystack](https://github.com/context-dot-dev/context-haystack).

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `ContextDev::Errors::APIError` will be thrown:

```ruby
begin
  page = context_dev.web.scrape(url: "https://example.com", formats: {markdown: true})
rescue ContextDev::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue ContextDev::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue ContextDev::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
context_dev = ContextDev::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
context_dev.web.scrape(
  url: "https://example.com", formats: {markdown: true},
  request_options: {max_retries: 5}
)
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
context_dev = ContextDev::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
context_dev.web.scrape(url: "https://example.com", formats: {markdown: true}, request_options: {timeout: 5})
```

On timeout, `ContextDev::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `ContextDev::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
page =
  context_dev.web.scrape(
    url: "https://example.com", formats: {markdown: true},
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(page[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `ContextDev::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `ContextDev::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
context_dev.web.scrape(
  url: "https://example.com",
  formats: ContextDev::WebScrapeParams::Formats.new(markdown: true)
)
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
context_dev.web.scrape(url: "https://example.com", formats: {markdown: true})

# You can also splat a full Params class:
params = ContextDev::WebScrapeParams.new(
  url: "https://example.com",
  formats: ContextDev::WebScrapeParams::Formats.new(markdown: true)
)
context_dev.web.scrape(**params)
```

### Enums

Since this library does not depend on `sorbet-runtime`, it cannot provide [`T::Enum`](https://sorbet.org/docs/tenum) instances. Instead, we provide "tagged symbols" instead, which is always a primitive at runtime:

```ruby
# :txt
puts(ContextDev::ParseHandleParams::Extension::TXT)

# Revealed type: `T.all(ContextDev::ParseHandleParams::Extension, Symbol)`
T.reveal_type(ContextDev::ParseHandleParams::Extension::TXT)
```

Enum parameters have a "relaxed" type, so you can either pass in enum constants or their literal value:

```ruby
# Using the enum constants preserves the tagged type information:
context_dev.parse.handle(
  extension: ContextDev::ParseHandleParams::Extension::TXT,
  # …
)

# Literal values are also permissible:
context_dev.parse.handle(
  extension: :txt,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/context-dot-dev/context-ruby-sdk/tree/main/CONTRIBUTING.md).
