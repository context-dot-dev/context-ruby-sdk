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

      # Count only runs created at or after this time.
      sig { returns(T.nilable(Time)) }
      attr_reader :since

      sig { params(since: Time).void }
      attr_writer :since

      # Return usage only for monitors that currently have this tag. Deleted monitors
      # are excluded.
      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      # Count only runs created at or before this time.
      sig { returns(T.nilable(Time)) }
      attr_reader :until_

      sig { params(until_: Time).void }
      attr_writer :until_

      sig do
        params(
          since: Time,
          tag: String,
          until_: Time,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Count only runs created at or after this time.
        since: nil,
        # Return usage only for monitors that currently have this tag. Deleted monitors
        # are excluded.
        tag: nil,
        # Count only runs created at or before this time.
        until_: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            since: Time,
            tag: String,
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
