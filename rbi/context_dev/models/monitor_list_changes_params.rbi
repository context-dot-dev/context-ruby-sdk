# typed: strong

module ContextDev
  module Models
    class MonitorListChangesParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::MonitorListChangesParams,
            ContextDev::Internal::AnyHash
          )
        end

      # ID of the monitor.
      sig { returns(String) }
      attr_accessor :monitor_id

      # Opaque pagination cursor from a previous response.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of items to return per page (1-100). Defaults to 25.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Only include items at or after this ISO 8601 timestamp.
      sig { returns(T.nilable(Time)) }
      attr_reader :since

      sig { params(since: Time).void }
      attr_writer :since

      # Filter to items that have this tag.
      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      # Only include items before this ISO 8601 timestamp.
      sig { returns(T.nilable(Time)) }
      attr_reader :until_

      sig { params(until_: Time).void }
      attr_writer :until_

      sig do
        params(
          monitor_id: String,
          cursor: String,
          limit: Integer,
          since: Time,
          tag: String,
          until_: Time,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # ID of the monitor.
        monitor_id:,
        # Opaque pagination cursor from a previous response.
        cursor: nil,
        # Maximum number of items to return per page (1-100). Defaults to 25.
        limit: nil,
        # Only include items at or after this ISO 8601 timestamp.
        since: nil,
        # Filter to items that have this tag.
        tag: nil,
        # Only include items before this ISO 8601 timestamp.
        until_: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            monitor_id: String,
            cursor: String,
            limit: Integer,
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
