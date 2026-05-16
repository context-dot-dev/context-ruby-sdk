# typed: strong

module ContextDev
  module Models
    class WebSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebSearchParams, ContextDev::Internal::AnyHash)
        end

      # Natural-language search query.
      sig { returns(String) }
      attr_accessor :query

      # Blocklist — drop results from these domains. Example: ["pinterest.com",
      # "reddit.com"].
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :exclude_domains

      sig { params(exclude_domains: T::Array[String]).void }
      attr_writer :exclude_domains

      # Restrict results to content published within this window.
      sig do
        returns(T.nilable(ContextDev::WebSearchParams::Freshness::OrSymbol))
      end
      attr_reader :freshness

      sig do
        params(freshness: ContextDev::WebSearchParams::Freshness::OrSymbol).void
      end
      attr_writer :freshness

      # Allowlist — only return results from these domains. Example: ["arxiv.org",
      # "github.com"].
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :include_domains

      sig { params(include_domains: T::Array[String]).void }
      attr_writer :include_domains

      # Inline Markdown scraping for each result. Set `enabled: true` to activate.
      sig { returns(T.nilable(ContextDev::WebSearchParams::MarkdownOptions)) }
      attr_reader :markdown_options

      sig do
        params(
          markdown_options: ContextDev::WebSearchParams::MarkdownOptions::OrHash
        ).void
      end
      attr_writer :markdown_options

      # Expand the query into multiple parallel variants for broader recall.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :query_fanout

      sig { params(query_fanout: T::Boolean).void }
      attr_writer :query_fanout

      # Optional timeout in milliseconds for the request. If the request takes longer
      # than this value, it will be aborted with a 408 status code. Maximum allowed
      # value is 300000ms (5 minutes).
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_ms

      sig { params(timeout_ms: Integer).void }
      attr_writer :timeout_ms

      sig do
        params(
          query: String,
          exclude_domains: T::Array[String],
          freshness: ContextDev::WebSearchParams::Freshness::OrSymbol,
          include_domains: T::Array[String],
          markdown_options:
            ContextDev::WebSearchParams::MarkdownOptions::OrHash,
          query_fanout: T::Boolean,
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Natural-language search query.
        query:,
        # Blocklist — drop results from these domains. Example: ["pinterest.com",
        # "reddit.com"].
        exclude_domains: nil,
        # Restrict results to content published within this window.
        freshness: nil,
        # Allowlist — only return results from these domains. Example: ["arxiv.org",
        # "github.com"].
        include_domains: nil,
        # Inline Markdown scraping for each result. Set `enabled: true` to activate.
        markdown_options: nil,
        # Expand the query into multiple parallel variants for broader recall.
        query_fanout: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            query: String,
            exclude_domains: T::Array[String],
            freshness: ContextDev::WebSearchParams::Freshness::OrSymbol,
            include_domains: T::Array[String],
            markdown_options: ContextDev::WebSearchParams::MarkdownOptions,
            query_fanout: T::Boolean,
            timeout_ms: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Restrict results to content published within this window.
      module Freshness
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebSearchParams::Freshness) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LAST_24_HOURS =
          T.let(
            :last_24_hours,
            ContextDev::WebSearchParams::Freshness::TaggedSymbol
          )
        LAST_WEEK =
          T.let(
            :last_week,
            ContextDev::WebSearchParams::Freshness::TaggedSymbol
          )
        LAST_MONTH =
          T.let(
            :last_month,
            ContextDev::WebSearchParams::Freshness::TaggedSymbol
          )
        LAST_YEAR =
          T.let(
            :last_year,
            ContextDev::WebSearchParams::Freshness::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::WebSearchParams::Freshness::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class MarkdownOptions < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebSearchParams::MarkdownOptions,
              ContextDev::Internal::AnyHash
            )
          end

        # Scrape each result to Markdown. Off by default to keep search cheap and fast.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :enabled

        sig { params(enabled: T::Boolean).void }
        attr_writer :enabled

        # Render iframe contents into the Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_frames

        sig { params(include_frames: T::Boolean).void }
        attr_writer :include_frames

        # Emit image references in the Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_images

        sig { params(include_images: T::Boolean).void }
        attr_writer :include_images

        # Keep hyperlinks in the Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_links

        sig { params(include_links: T::Boolean).void }
        attr_writer :include_links

        # Cache TTL in ms for scraped Markdown keyed by URL + options. Default 1 day, max
        # 30 days. Set to 0 to force a fresh scrape.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_age_ms

        sig { params(max_age_ms: Integer).void }
        attr_writer :max_age_ms

        # PDF handling. Use start/end to bound text extraction and OCR to a page range.
        sig do
          returns(T.nilable(ContextDev::WebSearchParams::MarkdownOptions::Pdf))
        end
        attr_reader :pdf

        sig do
          params(
            pdf: ContextDev::WebSearchParams::MarkdownOptions::Pdf::OrHash
          ).void
        end
        attr_writer :pdf

        # Truncate inline base64 image payloads to keep responses small.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :shorten_base64_images

        sig { params(shorten_base64_images: T::Boolean).void }
        attr_writer :shorten_base64_images

        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        sig { returns(T.nilable(Integer)) }
        attr_reader :timeout_ms

        sig { params(timeout_ms: Integer).void }
        attr_writer :timeout_ms

        # Strip nav, header, footer, and sidebar — keep only the primary article content.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :use_main_content_only

        sig { params(use_main_content_only: T::Boolean).void }
        attr_writer :use_main_content_only

        # Extra wait after page load before rendering, in ms (0–30000). Useful for
        # JS-heavy pages.
        sig { returns(T.nilable(Integer)) }
        attr_reader :wait_for_ms

        sig { params(wait_for_ms: Integer).void }
        attr_writer :wait_for_ms

        # Inline Markdown scraping for each result. Set `enabled: true` to activate.
        sig do
          params(
            enabled: T::Boolean,
            include_frames: T::Boolean,
            include_images: T::Boolean,
            include_links: T::Boolean,
            max_age_ms: Integer,
            pdf: ContextDev::WebSearchParams::MarkdownOptions::Pdf::OrHash,
            shorten_base64_images: T::Boolean,
            timeout_ms: Integer,
            use_main_content_only: T::Boolean,
            wait_for_ms: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Scrape each result to Markdown. Off by default to keep search cheap and fast.
          enabled: nil,
          # Render iframe contents into the Markdown.
          include_frames: nil,
          # Emit image references in the Markdown.
          include_images: nil,
          # Keep hyperlinks in the Markdown.
          include_links: nil,
          # Cache TTL in ms for scraped Markdown keyed by URL + options. Default 1 day, max
          # 30 days. Set to 0 to force a fresh scrape.
          max_age_ms: nil,
          # PDF handling. Use start/end to bound text extraction and OCR to a page range.
          pdf: nil,
          # Truncate inline base64 image payloads to keep responses small.
          shorten_base64_images: nil,
          # Optional timeout in milliseconds for the request. If the request takes longer
          # than this value, it will be aborted with a 408 status code. Maximum allowed
          # value is 300000ms (5 minutes).
          timeout_ms: nil,
          # Strip nav, header, footer, and sidebar — keep only the primary article content.
          use_main_content_only: nil,
          # Extra wait after page load before rendering, in ms (0–30000). Useful for
          # JS-heavy pages.
          wait_for_ms: nil
        )
        end

        sig do
          override.returns(
            {
              enabled: T::Boolean,
              include_frames: T::Boolean,
              include_images: T::Boolean,
              include_links: T::Boolean,
              max_age_ms: Integer,
              pdf: ContextDev::WebSearchParams::MarkdownOptions::Pdf,
              shorten_base64_images: T::Boolean,
              timeout_ms: Integer,
              use_main_content_only: T::Boolean,
              wait_for_ms: Integer
            }
          )
        end
        def to_hash
        end

        class Pdf < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::WebSearchParams::MarkdownOptions::Pdf,
                ContextDev::Internal::AnyHash
              )
            end

          # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
          # be >= start.
          sig { returns(T.nilable(Integer)) }
          attr_reader :end_

          sig { params(end_: Integer).void }
          attr_writer :end_

          # Parse PDF URLs. When false, PDF results are skipped with WEBSITE_ACCESS_ERROR.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :should_parse

          sig { params(should_parse: T::Boolean).void }
          attr_writer :should_parse

          # First PDF page to parse (1-based, inclusive). Defaults to page 1.
          sig { returns(T.nilable(Integer)) }
          attr_reader :start

          sig { params(start: Integer).void }
          attr_writer :start

          # PDF handling. Use start/end to bound text extraction and OCR to a page range.
          sig do
            params(
              end_: Integer,
              should_parse: T::Boolean,
              start: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
            # be >= start.
            end_: nil,
            # Parse PDF URLs. When false, PDF results are skipped with WEBSITE_ACCESS_ERROR.
            should_parse: nil,
            # First PDF page to parse (1-based, inclusive). Defaults to page 1.
            start: nil
          )
          end

          sig do
            override.returns(
              { end_: Integer, should_parse: T::Boolean, start: Integer }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
