# typed: strong

module ContextDev
  module Models
    class WebWebScrapeHTMLResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebWebScrapeHTMLResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # The scraped content of the page. For normal pages this is the raw HTML. When the
      # page is a sitemap or feed served behind an XSL stylesheet (which browsers render
      # into HTML), this is the underlying XML instead — see the `type` field.
      sig { returns(String) }
      attr_accessor :html

      # Indicates success
      sig do
        returns(
          ContextDev::Models::WebWebScrapeHTMLResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      # Detected content type of the returned `html` field. Sitemaps and feeds are
      # surfaced as `xml`; ordinary pages are `html`.
      sig do
        returns(
          ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      # The URL that was scraped
      sig { returns(String) }
      attr_accessor :url

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
      sig do
        returns(
          T.nilable(ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          html: String,
          success:
            ContextDev::Models::WebWebScrapeHTMLResponse::Success::OrBoolean,
          type: ContextDev::Models::WebWebScrapeHTMLResponse::Type::OrSymbol,
          url: String,
          key_metadata:
            ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The scraped content of the page. For normal pages this is the raw HTML. When the
        # page is a sitemap or feed served behind an XSL stylesheet (which browsers render
        # into HTML), this is the underlying XML instead — see the `type` field.
        html:,
        # Indicates success
        success:,
        # Detected content type of the returned `html` field. Sitemaps and feeds are
        # surfaced as `xml`; ordinary pages are `html`.
        type:,
        # The URL that was scraped
        url:,
        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            html: String,
            success:
              ContextDev::Models::WebWebScrapeHTMLResponse::Success::TaggedBoolean,
            type:
              ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol,
            url: String,
            key_metadata:
              ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      # Indicates success
      module Success
        extend ContextDev::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              ContextDev::Models::WebWebScrapeHTMLResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            ContextDev::Models::WebWebScrapeHTMLResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeHTMLResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end

      # Detected content type of the returned `html` field. Sitemaps and feeds are
      # surfaced as `xml`; ordinary pages are `html`.
      module Type
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HTML =
          T.let(
            :html,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        XML =
          T.let(
            :xml,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        JSON =
          T.let(
            :json,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        TEXT =
          T.let(
            :text,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        CSV =
          T.let(
            :csv,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        MARKDOWN =
          T.let(
            :markdown,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        SVG =
          T.let(
            :svg,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        PDF =
          T.let(
            :pdf,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # The number of credits consumed by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # The number of credits remaining for your organization after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The number of credits consumed by this request.
          credits_consumed:,
          # The number of credits remaining for your organization after this request.
          credits_remaining:
        )
        end

        sig do
          override.returns(
            { credits_consumed: Integer, credits_remaining: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
