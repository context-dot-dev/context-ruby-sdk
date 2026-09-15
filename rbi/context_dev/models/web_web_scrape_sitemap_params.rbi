# typed: strong

module ContextDev
  module Models
    class WebWebScrapeSitemapParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::WebWebScrapeSitemapParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Domain to build a sitemap for
      sig { returns(String) }
      attr_accessor :domain

      # Optional outbound HTTP headers forwarded only to the target URL, sent as
      # deep-object query params such as headers[X-Custom]=value. When provided, caching
      # is bypassed: the result is neither read from nor written to cache.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # When true, discover and include public pages and sitemaps on subdomains of the
      # requested domain. Defaults to false.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_subdomains

      sig { params(include_subdomains: T::Boolean).void }
      attr_writer :include_subdomains

      # Maximum number of links to return from the sitemap crawl. Defaults to 10,000.
      # Minimum is 1, maximum is 100,000.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_links

      sig { params(max_links: Integer).void }
      attr_writer :max_links

      # Optional search phrase. When provided, the crawled sitemap is filtered to the
      # pages whose URLs are about that phrase, most relevant first, and the request
      # costs 2 credits instead of 1.
      sig { returns(T.nilable(String)) }
      attr_reader :search

      sig { params(search: String).void }
      attr_writer :search

      # Optional explicit sitemap URL. When provided, exactly this sitemap is crawled
      # instead of discovering the domain's sitemaps.
      sig { returns(T.nilable(String)) }
      attr_reader :sitemap_url

      sig { params(sitemap_url: String).void }
      attr_writer :sitemap_url

      # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
      # characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Optional request deadline and behavior on timeout. For GET requests, use
      # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      # timeoutOpts object.
      sig do
        returns(T.nilable(ContextDev::WebWebScrapeSitemapParams::TimeoutOpts))
      end
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts:
            ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # Optional RE2-compatible regex pattern. Only URLs matching this pattern are
      # returned and counted against maxLinks.
      sig { returns(T.nilable(String)) }
      attr_reader :url_regex

      sig { params(url_regex: String).void }
      attr_writer :url_regex

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Requires zero data retention to be enabled for your
      # organization (contact support@context.dev), otherwise the request fails with
      # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      sig do
        returns(T.nilable(ContextDev::WebWebScrapeSitemapParams::Zdr::OrSymbol))
      end
      attr_reader :zdr

      sig do
        params(zdr: ContextDev::WebWebScrapeSitemapParams::Zdr::OrSymbol).void
      end
      attr_writer :zdr

      sig do
        params(
          domain: String,
          headers: T::Hash[Symbol, String],
          include_subdomains: T::Boolean,
          max_links: Integer,
          search: String,
          sitemap_url: String,
          tags: T::Array[String],
          timeout_opts:
            ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::OrHash,
          url_regex: String,
          zdr: ContextDev::WebWebScrapeSitemapParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Domain to build a sitemap for
        domain:,
        # Optional outbound HTTP headers forwarded only to the target URL, sent as
        # deep-object query params such as headers[X-Custom]=value. When provided, caching
        # is bypassed: the result is neither read from nor written to cache.
        headers: nil,
        # When true, discover and include public pages and sitemaps on subdomains of the
        # requested domain. Defaults to false.
        include_subdomains: nil,
        # Maximum number of links to return from the sitemap crawl. Defaults to 10,000.
        # Minimum is 1, maximum is 100,000.
        max_links: nil,
        # Optional search phrase. When provided, the crawled sitemap is filtered to the
        # pages whose URLs are about that phrase, most relevant first, and the request
        # costs 2 credits instead of 1.
        search: nil,
        # Optional explicit sitemap URL. When provided, exactly this sitemap is crawled
        # instead of discovering the domain's sitemaps.
        sitemap_url: nil,
        # Comma-separated tags for tracking request usage. Up to 20 tags, each 1-50
        # characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        # Optional RE2-compatible regex pattern. Only URLs matching this pattern are
        # returned and counted against maxLinks.
        url_regex: nil,
        # Set to enabled to bypass shared caches and omit request and response content
        # from retained usage logs. Requires zero data retention to be enabled for your
        # organization (contact support@context.dev), otherwise the request fails with
        # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
        zdr: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            domain: String,
            headers: T::Hash[Symbol, String],
            include_subdomains: T::Boolean,
            max_links: Integer,
            search: String,
            sitemap_url: String,
            tags: T::Array[String],
            timeout_opts: ContextDev::WebWebScrapeSitemapParams::TimeoutOpts,
            url_regex: String,
            zdr: ContextDev::WebWebScrapeSitemapParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebWebScrapeSitemapParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
        sig do
          returns(
            T.nilable(
              ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::Behavior::OrSymbol
          ).void
        end
        attr_writer :behavior

        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
          milliseconds:,
          # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
          # credits. "return-partial" returns usable results collected so far; if none are
          # available, the request still fails without charging credits. Partial results are
          # not cached as complete results.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebWebScrapeSitemapParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Requires zero data retention to be enabled for your
      # organization (contact support@context.dev), otherwise the request fails with
      # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::WebWebScrapeSitemapParams::Zdr)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(
            :enabled,
            ContextDev::WebWebScrapeSitemapParams::Zdr::TaggedSymbol
          )
        DISABLED =
          T.let(
            :disabled,
            ContextDev::WebWebScrapeSitemapParams::Zdr::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::WebWebScrapeSitemapParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
