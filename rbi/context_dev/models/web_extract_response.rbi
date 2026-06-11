# typed: strong

module ContextDev
  module Models
    class WebExtractResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebExtractResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Extracted data matching the request schema
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :data

      sig { returns(ContextDev::Models::WebExtractResponse::Metadata) }
      attr_reader :metadata

      sig do
        params(
          metadata: ContextDev::Models::WebExtractResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      # Status of the response, e.g., 'ok'
      sig { returns(String) }
      attr_accessor :status

      # The starting URL that was analyzed
      sig { returns(String) }
      attr_accessor :url

      # List of URLs whose Markdown was used for extraction
      sig { returns(T::Array[String]) }
      attr_accessor :urls_analyzed

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
      sig do
        returns(T.nilable(ContextDev::Models::WebExtractResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebExtractResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data: T::Hash[Symbol, T.anything],
          metadata: ContextDev::Models::WebExtractResponse::Metadata::OrHash,
          status: String,
          url: String,
          urls_analyzed: T::Array[String],
          key_metadata:
            ContextDev::Models::WebExtractResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Extracted data matching the request schema
        data:,
        metadata:,
        # Status of the response, e.g., 'ok'
        status:,
        # The starting URL that was analyzed
        url:,
        # List of URLs whose Markdown was used for extraction
        urls_analyzed:,
        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            data: T::Hash[Symbol, T.anything],
            metadata: ContextDev::Models::WebExtractResponse::Metadata,
            status: String,
            url: String,
            urls_analyzed: T::Array[String],
            key_metadata: ContextDev::Models::WebExtractResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Metadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractResponse::Metadata,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :max_crawl_depth

        sig { returns(Integer) }
        attr_accessor :num_failed

        sig { returns(Integer) }
        attr_accessor :num_skipped

        sig { returns(Integer) }
        attr_accessor :num_succeeded

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
          max_crawl_depth:,
          num_failed:,
          num_skipped:,
          num_succeeded:,
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

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractResponse::KeyMetadata,
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
