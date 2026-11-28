# typed: strong

module ContextDev
  module Models
    class WebMapURLsResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebMapURLsResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Normalized domain that was mapped.
      sig { returns(String) }
      attr_accessor :domain

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Always `true` on success.
      sig do
        returns(ContextDev::Models::WebMapURLsResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      # URLs found on the domain, with page metadata when available.
      sig { returns(T::Array[ContextDev::Models::WebMapURLsResponse::URL]) }
      attr_accessor :urls

      # Credits this request used and your remaining balance.
      sig do
        returns(T.nilable(ContextDev::Models::WebMapURLsResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebMapURLsResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # `true` when the deadline passed with `timeoutOpts.behavior` set to
      # `return-partial`. Only results finished in time are included.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :partial

      sig { params(partial: T::Boolean).void }
      attr_writer :partial

      sig do
        params(
          domain: String,
          request_id: String,
          success: ContextDev::Models::WebMapURLsResponse::Success::OrBoolean,
          urls: T::Array[ContextDev::Models::WebMapURLsResponse::URL::OrHash],
          key_metadata:
            ContextDev::Models::WebMapURLsResponse::KeyMetadata::OrHash,
          partial: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Normalized domain that was mapped.
        domain:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Always `true` on success.
        success:,
        # URLs found on the domain, with page metadata when available.
        urls:,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # `true` when the deadline passed with `timeoutOpts.behavior` set to
        # `return-partial`. Only results finished in time are included.
        partial: nil
      )
      end

      sig do
        override.returns(
          {
            domain: String,
            request_id: String,
            success:
              ContextDev::Models::WebMapURLsResponse::Success::TaggedBoolean,
            urls: T::Array[ContextDev::Models::WebMapURLsResponse::URL],
            key_metadata: ContextDev::Models::WebMapURLsResponse::KeyMetadata,
            partial: T::Boolean
          }
        )
      end
      def to_hash
      end

      # Always `true` on success.
      module Success
        extend ContextDev::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, ContextDev::Models::WebMapURLsResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            ContextDev::Models::WebMapURLsResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebMapURLsResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end

      class URL < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebMapURLsResponse::URL,
              ContextDev::Internal::AnyHash
            )
          end

        # Page URL.
        sig { returns(String) }
        attr_accessor :url

        # Page description, when available.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        # Keywords from the page's `keywords` meta tag.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :keywords

        sig { params(keywords: T::Array[String]).void }
        attr_writer :keywords

        # Page language, when available.
        sig { returns(T.nilable(String)) }
        attr_reader :language

        sig { params(language: String).void }
        attr_writer :language

        # Page title, when available.
        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        sig do
          params(
            url: String,
            description: String,
            keywords: T::Array[String],
            language: String,
            title: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Page URL.
          url:,
          # Page description, when available.
          description: nil,
          # Keywords from the page's `keywords` meta tag.
          keywords: nil,
          # Page language, when available.
          language: nil,
          # Page title, when available.
          title: nil
        )
        end

        sig do
          override.returns(
            {
              url: String,
              description: String,
              keywords: T::Array[String],
              language: String,
              title: String
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
              ContextDev::Models::WebMapURLsResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits your organization has left after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credits this request used and your remaining balance.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits charged for this request.
          credits_consumed:,
          # Credits your organization has left after this request.
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
