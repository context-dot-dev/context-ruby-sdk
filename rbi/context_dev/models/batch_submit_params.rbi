# typed: strong

module ContextDev
  module Models
    class BatchSubmitParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::BatchSubmitParams, ContextDev::Internal::AnyHash)
        end

      # Known identifiers for the person. At least one identifier is required.
      sig { returns(ContextDev::BatchSubmitParams::Identifiers) }
      attr_reader :identifiers

      sig do
        params(
          identifiers: ContextDev::BatchSubmitParams::Identifiers::OrHash
        ).void
      end
      attr_writer :identifiers

      # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Optional timeout in milliseconds for the request. If the request takes longer
      # than this value, it will be aborted with a 408 status code. Maximum allowed
      # value is 300000ms (5 minutes).
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_ms

      sig { params(timeout_ms: Integer).void }
      attr_writer :timeout_ms

      sig do
        params(
          identifiers: ContextDev::BatchSubmitParams::Identifiers::OrHash,
          tags: T::Array[String],
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Known identifiers for the person. At least one identifier is required.
        identifiers:,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
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
            identifiers: ContextDev::BatchSubmitParams::Identifiers,
            tags: T::Array[String],
            timeout_ms: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Identifiers < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::BatchSubmitParams::Identifiers,
              ContextDev::Internal::AnyHash
            )
          end

        # LinkedIn profile URL, e.g. https://www.linkedin.com/in/yahia-bakour/.
        sig { returns(T.nilable(String)) }
        attr_reader :linkedin_url

        sig { params(linkedin_url: String).void }
        attr_writer :linkedin_url

        # Known identifiers for the person. At least one identifier is required.
        sig { params(linkedin_url: String).returns(T.attached_class) }
        def self.new(
          # LinkedIn profile URL, e.g. https://www.linkedin.com/in/yahia-bakour/.
          linkedin_url: nil
        )
        end

        sig { override.returns({ linkedin_url: String }) }
        def to_hash
        end
      end
    end
  end
end
