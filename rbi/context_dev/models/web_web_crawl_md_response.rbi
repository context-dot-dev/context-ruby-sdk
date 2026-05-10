# typed: strong

module ContextDev
  module Models
    class WebWebCrawlMdResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebWebCrawlMdResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(ContextDev::Models::WebWebCrawlMdResponse::Metadata) }
      attr_reader :metadata

      sig do
        params(
          metadata: ContextDev::Models::WebWebCrawlMdResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      sig do
        returns(T::Array[ContextDev::Models::WebWebCrawlMdResponse::Result])
      end
      attr_accessor :results

      sig do
        params(
          metadata: ContextDev::Models::WebWebCrawlMdResponse::Metadata::OrHash,
          results:
            T::Array[ContextDev::Models::WebWebCrawlMdResponse::Result::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(metadata:, results:)
      end

      sig do
        override.returns(
          {
            metadata: ContextDev::Models::WebWebCrawlMdResponse::Metadata,
            results: T::Array[ContextDev::Models::WebWebCrawlMdResponse::Result]
          }
        )
      end
      def to_hash
      end

      class Metadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebCrawlMdResponse::Metadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Maximum crawl depth reached during the crawl
        sig { returns(Integer) }
        attr_accessor :max_crawl_depth

        # Number of pages that failed to crawl
        sig { returns(Integer) }
        attr_accessor :num_failed

        # Number of URLs skipped (PDFs when pdf.shouldParse=false, or URLs not matching
        # urlRegex)
        sig { returns(Integer) }
        attr_accessor :num_skipped

        # Number of pages successfully crawled
        sig { returns(Integer) }
        attr_accessor :num_succeeded

        # Total number of URLs crawled
        sig { returns(Integer) }
        attr_accessor :num_urls

        sig do
          params(
            max_crawl_depth: Integer,
            num_failed: Integer,
            num_skipped: Integer,
            num_succeeded: Integer,
            num_urls: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Maximum crawl depth reached during the crawl
          max_crawl_depth:,
          # Number of pages that failed to crawl
          num_failed:,
          # Number of URLs skipped (PDFs when pdf.shouldParse=false, or URLs not matching
          # urlRegex)
          num_skipped:,
          # Number of pages successfully crawled
          num_succeeded:,
          # Total number of URLs crawled
          num_urls:
        )
        end

        sig do
          override.returns(
            {
              max_crawl_depth: Integer,
              num_failed: Integer,
              num_skipped: Integer,
              num_succeeded: Integer,
              num_urls: Integer
            }
          )
        end
        def to_hash
        end
      end

      class Result < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebCrawlMdResponse::Result,
              ContextDev::Internal::AnyHash
            )
          end

        # Extracted page content as Markdown (empty string on failure)
        sig { returns(String) }
        attr_accessor :markdown

        sig do
          returns(ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata)
        end
        attr_reader :metadata

        sig do
          params(
            metadata:
              ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OrHash
          ).void
        end
        attr_writer :metadata

        sig do
          params(
            markdown: String,
            metadata:
              ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Extracted page content as Markdown (empty string on failure)
          markdown:,
          metadata:
        )
        end

        sig do
          override.returns(
            {
              markdown: String,
              metadata:
                ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata
            }
          )
        end
        def to_hash
        end

        class Metadata < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata,
                ContextDev::Internal::AnyHash
              )
            end

          # Depth relative to the start URL. 0 = start URL, 1 = one link away.
          sig { returns(Integer) }
          attr_accessor :crawl_depth

          # HTTP status code of the response
          sig { returns(Integer) }
          attr_accessor :status_code

          # true if the page was fetched and parsed successfully
          sig { returns(T::Boolean) }
          attr_accessor :success

          # The page's <title> content (empty string if unavailable)
          sig { returns(String) }
          attr_accessor :title

          # The URL that was fetched
          sig { returns(String) }
          attr_accessor :url

          sig do
            params(
              crawl_depth: Integer,
              status_code: Integer,
              success: T::Boolean,
              title: String,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Depth relative to the start URL. 0 = start URL, 1 = one link away.
            crawl_depth:,
            # HTTP status code of the response
            status_code:,
            # true if the page was fetched and parsed successfully
            success:,
            # The page's <title> content (empty string if unavailable)
            title:,
            # The URL that was fetched
            url:
          )
          end

          sig do
            override.returns(
              {
                crawl_depth: Integer,
                status_code: Integer,
                success: T::Boolean,
                title: String,
                url: String
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
