# typed: strong

module ContextDev
  module Models
    class WebWebScrapeMdResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebWebScrapeMdResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Page content converted to GitHub Flavored Markdown
      sig { returns(String) }
      attr_accessor :markdown

      # Indicates success
      sig do
        returns(
          ContextDev::Models::WebWebScrapeMdResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      # The URL that was scraped
      sig { returns(String) }
      attr_accessor :url

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
      sig do
        returns(
          T.nilable(ContextDev::Models::WebWebScrapeMdResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebWebScrapeMdResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          markdown: String,
          success:
            ContextDev::Models::WebWebScrapeMdResponse::Success::OrBoolean,
          url: String,
          key_metadata:
            ContextDev::Models::WebWebScrapeMdResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Page content converted to GitHub Flavored Markdown
        markdown:,
        # Indicates success
        success:,
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
            markdown: String,
            success:
              ContextDev::Models::WebWebScrapeMdResponse::Success::TaggedBoolean,
            url: String,
            key_metadata:
              ContextDev::Models::WebWebScrapeMdResponse::KeyMetadata
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
              ContextDev::Models::WebWebScrapeMdResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            ContextDev::Models::WebWebScrapeMdResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeMdResponse::Success::TaggedBoolean
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
              ContextDev::Models::WebWebScrapeMdResponse::KeyMetadata,
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
