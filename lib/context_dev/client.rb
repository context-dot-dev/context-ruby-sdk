# frozen_string_literal: true

module ContextDev
  class Client < ContextDev::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # @return [String]
    attr_reader :api_key

    # @return [ContextDev::Resources::Parse]
    attr_reader :parse

    # @return [ContextDev::Resources::Web]
    attr_reader :web

    # @return [ContextDev::Resources::AI]
    attr_reader :ai

    # @return [ContextDev::Resources::Brand]
    attr_reader :brand

    # @return [ContextDev::Resources::Industry]
    attr_reader :industry

    # @return [ContextDev::Resources::Utility]
    attr_reader :utility

    # Monitor pages, sitemaps, and extracted website data for exact or semantic
    # changes. Webhook payloads are documented by the
    # MonitorsChangeDetectedWebhookPayload and MonitorsRunCompletedWebhookPayload
    # schemas.
    # @return [ContextDev::Resources::Monitors]
    attr_reader :monitors

    # Scrape many pages or crawl a site asynchronously.
    # @return [ContextDev::Resources::Batch]
    attr_reader :batch

    # @return [ContextDev::Resources::People]
    attr_reader :people

    # Search live first-party RSS and free historical news data by company identity.
    # @return [ContextDev::Resources::News]
    attr_reader :news

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["CONTEXT_DEV_API_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["CONTEXT_DEV_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["CONTEXT_DEV_API_KEY"],
      base_url: ENV["CONTEXT_DEV_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.context.dev/v1"

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"CONTEXT_DEV_API_KEY\"")
      end

      headers = {}
      custom_headers_env = ENV["CONTEXT_DEV_CUSTOM_HEADERS"]
      unless custom_headers_env.nil?
        parsed = {}
        custom_headers_env.split("\n").each do |line|
          colon = line.index(":")
          unless colon.nil?
            parsed[line[0...colon].strip] = line[(colon + 1)..].strip
          end
        end
        headers = parsed.merge(headers)
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers
      )

      @parse = ContextDev::Resources::Parse.new(client: self)
      @web = ContextDev::Resources::Web.new(client: self)
      @ai = ContextDev::Resources::AI.new(client: self)
      @brand = ContextDev::Resources::Brand.new(client: self)
      @industry = ContextDev::Resources::Industry.new(client: self)
      @utility = ContextDev::Resources::Utility.new(client: self)
      @monitors = ContextDev::Resources::Monitors.new(client: self)
      @batch = ContextDev::Resources::Batch.new(client: self)
      @people = ContextDev::Resources::People.new(client: self)
      @news = ContextDev::Resources::News.new(client: self)
    end
  end
end
