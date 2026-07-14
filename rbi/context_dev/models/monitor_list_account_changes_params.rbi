# typed: strong

module ContextDev
  module Models
    class MonitorListAccountChangesParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::MonitorListAccountChangesParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Filter by change detection type.
      sig do
        returns(
          T.nilable(
            ContextDev::MonitorListAccountChangesParams::ChangeDetectionType::OrSymbol
          )
        )
      end
      attr_reader :change_detection_type

      sig do
        params(
          change_detection_type:
            ContextDev::MonitorListAccountChangesParams::ChangeDetectionType::OrSymbol
        ).void
      end
      attr_writer :change_detection_type

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

      # Filter changes to a single monitor.
      sig { returns(T.nilable(String)) }
      attr_reader :monitor_id

      sig { params(monitor_id: String).void }
      attr_writer :monitor_id

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

      # Filter by target type.
      sig do
        returns(
          T.nilable(
            ContextDev::MonitorListAccountChangesParams::TargetType::OrSymbol
          )
        )
      end
      attr_reader :target_type

      sig do
        params(
          target_type:
            ContextDev::MonitorListAccountChangesParams::TargetType::OrSymbol
        ).void
      end
      attr_writer :target_type

      # Only include items before this ISO 8601 timestamp.
      sig { returns(T.nilable(Time)) }
      attr_reader :until_

      sig { params(until_: Time).void }
      attr_writer :until_

      sig do
        params(
          change_detection_type:
            ContextDev::MonitorListAccountChangesParams::ChangeDetectionType::OrSymbol,
          cursor: String,
          limit: Integer,
          monitor_id: String,
          since: Time,
          tag: String,
          target_type:
            ContextDev::MonitorListAccountChangesParams::TargetType::OrSymbol,
          until_: Time,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter by change detection type.
        change_detection_type: nil,
        # Opaque pagination cursor from a previous response.
        cursor: nil,
        # Maximum number of items to return per page (1-100). Defaults to 25.
        limit: nil,
        # Filter changes to a single monitor.
        monitor_id: nil,
        # Only include items at or after this ISO 8601 timestamp.
        since: nil,
        # Filter to items that have this tag.
        tag: nil,
        # Filter by target type.
        target_type: nil,
        # Only include items before this ISO 8601 timestamp.
        until_: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            change_detection_type:
              ContextDev::MonitorListAccountChangesParams::ChangeDetectionType::OrSymbol,
            cursor: String,
            limit: Integer,
            monitor_id: String,
            since: Time,
            tag: String,
            target_type:
              ContextDev::MonitorListAccountChangesParams::TargetType::OrSymbol,
            until_: Time,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by change detection type.
      module ChangeDetectionType
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::MonitorListAccountChangesParams::ChangeDetectionType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXACT =
          T.let(
            :exact,
            ContextDev::MonitorListAccountChangesParams::ChangeDetectionType::TaggedSymbol
          )
        SEMANTIC =
          T.let(
            :semantic,
            ContextDev::MonitorListAccountChangesParams::ChangeDetectionType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::MonitorListAccountChangesParams::ChangeDetectionType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Filter by target type.
      module TargetType
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::MonitorListAccountChangesParams::TargetType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PAGE =
          T.let(
            :page,
            ContextDev::MonitorListAccountChangesParams::TargetType::TaggedSymbol
          )
        SITEMAP =
          T.let(
            :sitemap,
            ContextDev::MonitorListAccountChangesParams::TargetType::TaggedSymbol
          )
        EXTRACT =
          T.let(
            :extract,
            ContextDev::MonitorListAccountChangesParams::TargetType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::MonitorListAccountChangesParams::TargetType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
