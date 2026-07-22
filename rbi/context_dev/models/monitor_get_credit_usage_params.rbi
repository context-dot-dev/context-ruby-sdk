# typed: strong

module ContextDev
  module Models
    class MonitorGetCreditUsageParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::MonitorGetCreditUsageParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Only include items at or after this ISO 8601 timestamp.
      sig { returns(T.nilable(Time)) }
      attr_reader :since

      sig { params(since: Time).void }
      attr_writer :since

      # Only include items before this ISO 8601 timestamp.
      sig { returns(T.nilable(Time)) }
      attr_reader :until_

      sig { params(until_: Time).void }
      attr_writer :until_

      sig do
        params(
          since: Time,
          until_: Time,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Only include items at or after this ISO 8601 timestamp.
        since: nil,
        # Only include items before this ISO 8601 timestamp.
        until_: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            since: Time,
            until_: Time,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
