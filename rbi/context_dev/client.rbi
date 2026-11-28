# typed: strong

module ContextDev
  class Client < ContextDev::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(String) }
    attr_reader :api_key

    # Convert uploaded files, such as PDFs and Office documents, into Markdown.
    sig { returns(ContextDev::Resources::Parse) }
    attr_reader :parse

    sig { returns(ContextDev::Resources::Web) }
    attr_reader :web

    # Retrieve a brand's logos, colors, company details, and social links, or find
    # brands by name or domain.
    sig { returns(ContextDev::Resources::Brand) }
    attr_reader :brand

    # Extract structured data, competitors, styleguides, and fonts from any website.
    sig { returns(ContextDev::Resources::Industry) }
    attr_reader :industry

    # Prefetch brand and styleguide data so later lookups return sooner.
    sig { returns(ContextDev::Resources::Utility) }
    attr_reader :utility

    # Watch websites on a schedule for exact or meaningful changes.
    sig { returns(ContextDev::Resources::Monitors) }
    attr_reader :monitors

    # Scrape up to 100,000 URLs or crawl a site asynchronously.
    sig { returns(ContextDev::Resources::Batch) }
    attr_reader :batch

    sig { returns(ContextDev::Resources::Webhooks) }
    attr_reader :webhooks

    # Enrich a person from identity clues, or find people with a natural-language
    # query.
    sig { returns(ContextDev::Resources::People) }
    attr_reader :people

    # Search live and historical news by company or with a natural-language query.
    sig { returns(ContextDev::Resources::News) }
    attr_reader :news

    # Search full-text academic papers from arXiv and Europe PMC.
    sig { returns(ContextDev::Resources::Scholar) }
    attr_reader :scholar

    # Inspect your organization's API requests, including retained inputs and
    # responses.
    sig { returns(ContextDev::Resources::Logs) }
    attr_reader :logs

    sig { returns(ContextDev::Resources::Browser) }
    attr_reader :browser

    # Report bugs, wrong results, and docs mismatches to the Context.dev team.
    sig { returns(ContextDev::Resources::Feedback) }
    attr_reader :feedback

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["CONTEXT_DEV_API_KEY"]`
      api_key: ENV["CONTEXT_DEV_API_KEY"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["CONTEXT_DEV_BASE_URL"]`
      base_url: ENV["CONTEXT_DEV_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: ContextDev::Client::DEFAULT_MAX_RETRIES,
      timeout: ContextDev::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: ContextDev::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: ContextDev::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
