# typed: strong

module ContextDev
  module Models
    class WebMapURLsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebMapURLsParams, ContextDev::Internal::AnyHash)
        end

      # Domain to map, e.g. `stripe.com`.
      sig { returns(String) }
      attr_accessor :domain

      # HTTP headers for the target origin. Non-empty headers bypass caching.
      sig { returns(T.nilable(T::Hash[Symbol, String])) }
      attr_reader :headers

      sig { params(headers: T::Hash[Symbol, String]).void }
      attr_writer :headers

      # Include URLs on subdomains.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_subdomains

      sig { params(include_subdomains: T::Boolean).void }
      attr_writer :include_subdomains

      # Maximum number of URLs to return.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_links

      sig { params(max_links: Integer).void }
      attr_writer :max_links

      # Filter URLs by a topic or phrase, most relevant first.
      sig { returns(T.nilable(String)) }
      attr_reader :search

      sig { params(search: String).void }
      attr_writer :search

      # Fetch this sitemap instead of discovering sitemaps. Must belong to the domain or
      # a subdomain.
      sig { returns(T.nilable(String)) }
      attr_reader :sitemap_url

      sig { params(sitemap_url: String).void }
      attr_writer :sitemap_url

      # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Request deadline and what to return when it passes.
      sig { returns(T.nilable(ContextDev::WebMapURLsParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::WebMapURLsParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # Optional RE2-compatible regex pattern. Only URLs matching this pattern are
      # returned and counted against maxLinks.
      sig { returns(T.nilable(String)) }
      attr_reader :url_regex

      sig { params(url_regex: String).void }
      attr_writer :url_regex

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      sig { returns(T.nilable(ContextDev::WebMapURLsParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::WebMapURLsParams::Zdr::OrSymbol).void }
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
          timeout_opts: ContextDev::WebMapURLsParams::TimeoutOpts::OrHash,
          url_regex: String,
          zdr: ContextDev::WebMapURLsParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Domain to map, e.g. `stripe.com`.
        domain:,
        # HTTP headers for the target origin. Non-empty headers bypass caching.
        headers: nil,
        # Include URLs on subdomains.
        include_subdomains: nil,
        # Maximum number of URLs to return.
        max_links: nil,
        # Filter URLs by a topic or phrase, most relevant first.
        search: nil,
        # Fetch this sitemap instead of discovering sitemaps. Must belong to the domain or
        # a subdomain.
        sitemap_url: nil,
        # Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # Optional RE2-compatible regex pattern. Only URLs matching this pattern are
        # returned and counted against maxLinks.
        url_regex: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
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
            timeout_opts: ContextDev::WebMapURLsParams::TimeoutOpts,
            url_regex: String,
            zdr: ContextDev::WebMapURLsParams::Zdr::OrSymbol,
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
              ContextDev::WebMapURLsParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Deadline in milliseconds.
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
        sig do
          returns(
            T.nilable(
              ContextDev::WebMapURLsParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::WebMapURLsParams::TimeoutOpts::Behavior::OrSymbol
          ).void
        end
        attr_writer :behavior

        # Request deadline and what to return when it passes.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::WebMapURLsParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Deadline in milliseconds.
          milliseconds:,
          # "fail" returns 408 at the deadline. "return-partial" returns available results;
          # inspect the response’s partial flag.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::WebMapURLsParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::WebMapURLsParams::TimeoutOpts::Behavior)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::WebMapURLsParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::WebMapURLsParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::WebMapURLsParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebMapURLsParams::Zdr) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::WebMapURLsParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(:disabled, ContextDev::WebMapURLsParams::Zdr::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::WebMapURLsParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
