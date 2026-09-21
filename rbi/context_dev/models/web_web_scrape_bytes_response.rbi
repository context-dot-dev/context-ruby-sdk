# typed: strong

module ContextDev
  module Models
    class WebWebScrapeBytesResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebWebScrapeBytesResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Base64-encoded resource bytes, without a data URI prefix. Decode this field to
      # recover the downloaded file.
      sig { returns(String) }
      attr_accessor :bytes

      # Cache outcome for this response. Composite responses are hits only when every
      # cache-controlled fetch contributing to the output was a hit; age_ms is the
      # oldest contributing hit.
      sig do
        returns(ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata)
      end
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # Number of decoded resource bytes, before base64 encoding.
      sig { returns(Integer) }
      attr_accessor :content_length

      # The Content-Type returned by the origin, including any charset. Defaults to
      # application/octet-stream when absent.
      sig { returns(String) }
      attr_accessor :content_type

      sig do
        returns(
          ContextDev::Models::WebWebScrapeBytesResponse::Encoding::TaggedSymbol
        )
      end
      attr_accessor :encoding

      # The resource URL after redirects.
      sig { returns(String) }
      attr_accessor :final_url

      # Unique id of this API call, also sent in the X-Request-Id response header. Quote
      # it when contacting support about a failed request.
      sig { returns(String) }
      attr_accessor :request_id

      # HTTP status returned by the origin.
      sig { returns(Integer) }
      attr_accessor :status_code

      sig do
        returns(
          ContextDev::Models::WebWebScrapeBytesResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      # The requested resource URL.
      sig { returns(String) }
      attr_accessor :url

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(
          T.nilable(ContextDev::Models::WebWebScrapeBytesResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebWebScrapeBytesResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          bytes: String,
          cache_metadata:
            ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata::OrHash,
          content_length: Integer,
          content_type: String,
          encoding:
            ContextDev::Models::WebWebScrapeBytesResponse::Encoding::OrSymbol,
          final_url: String,
          request_id: String,
          status_code: Integer,
          success:
            ContextDev::Models::WebWebScrapeBytesResponse::Success::OrBoolean,
          url: String,
          key_metadata:
            ContextDev::Models::WebWebScrapeBytesResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Base64-encoded resource bytes, without a data URI prefix. Decode this field to
        # recover the downloaded file.
        bytes:,
        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        cache_metadata:,
        # Number of decoded resource bytes, before base64 encoding.
        content_length:,
        # The Content-Type returned by the origin, including any charset. Defaults to
        # application/octet-stream when absent.
        content_type:,
        encoding:,
        # The resource URL after redirects.
        final_url:,
        # Unique id of this API call, also sent in the X-Request-Id response header. Quote
        # it when contacting support about a failed request.
        request_id:,
        # HTTP status returned by the origin.
        status_code:,
        success:,
        # The requested resource URL.
        url:,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            bytes: String,
            cache_metadata:
              ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata,
            content_length: Integer,
            content_type: String,
            encoding:
              ContextDev::Models::WebWebScrapeBytesResponse::Encoding::TaggedSymbol,
            final_url: String,
            request_id: String,
            status_code: Integer,
            success:
              ContextDev::Models::WebWebScrapeBytesResponse::Success::TaggedBoolean,
            url: String,
            key_metadata:
              ContextDev::Models::WebWebScrapeBytesResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Age of the cached data in milliseconds. Zero for miss and zdr responses.
        sig { returns(Integer) }
        attr_accessor :age_ms

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        sig do
          returns(
            ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Age of the cached data in milliseconds. Zero for miss and zdr responses.
          age_ms:,
          # Whether the response was served from cache, required fresh work, or honored
          # zero-data-retention cache bypass.
          status:
        )
        end

        sig do
          override.returns(
            {
              age_ms: Integer,
              status:
                ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      module Encoding
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::Models::WebWebScrapeBytesResponse::Encoding
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        BASE64 =
          T.let(
            :base64,
            ContextDev::Models::WebWebScrapeBytesResponse::Encoding::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeBytesResponse::Encoding::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module Success
        extend ContextDev::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              ContextDev::Models::WebWebScrapeBytesResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            ContextDev::Models::WebWebScrapeBytesResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeBytesResponse::Success::TaggedBoolean
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
              ContextDev::Models::WebWebScrapeBytesResponse::KeyMetadata,
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
