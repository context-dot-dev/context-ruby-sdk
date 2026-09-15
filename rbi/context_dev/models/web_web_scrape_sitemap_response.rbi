# typed: strong

module ContextDev
  module Models
    class WebWebScrapeSitemapResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebWebScrapeSitemapResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # The normalized domain that was crawled
      sig { returns(String) }
      attr_accessor :domain

      # Metadata about the sitemap crawl operation
      sig { returns(ContextDev::Models::WebWebScrapeSitemapResponse::Meta) }
      attr_reader :meta

      sig do
        params(
          meta: ContextDev::Models::WebWebScrapeSitemapResponse::Meta::OrHash
        ).void
      end
      attr_writer :meta

      # Unique id of this API call, also sent in the X-Request-Id response header. Quote
      # it when contacting support about a failed request.
      sig { returns(String) }
      attr_accessor :request_id

      # Indicates success
      sig do
        returns(
          ContextDev::Models::WebWebScrapeSitemapResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      # Discovered page URLs from the sitemap, up to `maxLinks`. When `search` is set
      # these are only the matching pages, most relevant first.
      sig { returns(T::Array[String]) }
      attr_accessor :urls

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebWebScrapeSitemapResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebWebScrapeSitemapResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # True when timeoutOpts.behavior=return-partial returned the usable results
      # collected before the deadline. Partial collections are not cached as complete
      # results.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :partial

      sig { params(partial: T::Boolean).void }
      attr_writer :partial

      sig do
        params(
          domain: String,
          meta: ContextDev::Models::WebWebScrapeSitemapResponse::Meta::OrHash,
          request_id: String,
          success:
            ContextDev::Models::WebWebScrapeSitemapResponse::Success::OrBoolean,
          urls: T::Array[String],
          key_metadata:
            ContextDev::Models::WebWebScrapeSitemapResponse::KeyMetadata::OrHash,
          partial: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The normalized domain that was crawled
        domain:,
        # Metadata about the sitemap crawl operation
        meta:,
        # Unique id of this API call, also sent in the X-Request-Id response header. Quote
        # it when contacting support about a failed request.
        request_id:,
        # Indicates success
        success:,
        # Discovered page URLs from the sitemap, up to `maxLinks`. When `search` is set
        # these are only the matching pages, most relevant first.
        urls:,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil,
        # True when timeoutOpts.behavior=return-partial returned the usable results
        # collected before the deadline. Partial collections are not cached as complete
        # results.
        partial: nil
      )
      end

      sig do
        override.returns(
          {
            domain: String,
            meta: ContextDev::Models::WebWebScrapeSitemapResponse::Meta,
            request_id: String,
            success:
              ContextDev::Models::WebWebScrapeSitemapResponse::Success::TaggedBoolean,
            urls: T::Array[String],
            key_metadata:
              ContextDev::Models::WebWebScrapeSitemapResponse::KeyMetadata,
            partial: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Meta < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebScrapeSitemapResponse::Meta,
              ContextDev::Internal::AnyHash
            )
          end

        # Number of errors encountered during crawling
        sig { returns(Integer) }
        attr_accessor :errors

        # Total number of sitemap files discovered
        sig { returns(Integer) }
        attr_accessor :sitemaps_discovered

        # Number of sitemap files successfully fetched and parsed
        sig { returns(Integer) }
        attr_accessor :sitemaps_fetched

        # Number of sitemap files skipped (due to errors, timeouts, or limits)
        sig { returns(Integer) }
        attr_accessor :sitemaps_skipped

        # Metadata about the sitemap crawl operation
        sig do
          params(
            errors: Integer,
            sitemaps_discovered: Integer,
            sitemaps_fetched: Integer,
            sitemaps_skipped: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Number of errors encountered during crawling
          errors:,
          # Total number of sitemap files discovered
          sitemaps_discovered:,
          # Number of sitemap files successfully fetched and parsed
          sitemaps_fetched:,
          # Number of sitemap files skipped (due to errors, timeouts, or limits)
          sitemaps_skipped:
        )
        end

        sig do
          override.returns(
            {
              errors: Integer,
              sitemaps_discovered: Integer,
              sitemaps_fetched: Integer,
              sitemaps_skipped: Integer
            }
          )
        end
        def to_hash
        end
      end

      # Indicates success
      module Success
        extend ContextDev::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              ContextDev::Models::WebWebScrapeSitemapResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            ContextDev::Models::WebWebScrapeSitemapResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeSitemapResponse::Success::TaggedBoolean
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
              ContextDev::Models::WebWebScrapeSitemapResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits used by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credit usage, included whenever a valid API key is provided.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits used by this request.
          credits_consumed:,
          # Credits remaining for your organization.
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
