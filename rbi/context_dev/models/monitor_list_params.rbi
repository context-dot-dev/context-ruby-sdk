# typed: strong

module ContextDev
  module Models
    class MonitorListParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::MonitorListParams, ContextDev::Internal::AnyHash)
        end

      sig do
        returns(
          T.nilable(
            ContextDev::MonitorListParams::ChangeDetectionType::OrSymbol
          )
        )
      end
      attr_reader :change_detection_type

      sig do
        params(
          change_detection_type:
            ContextDev::MonitorListParams::ChangeDetectionType::OrSymbol
        ).void
      end
      attr_writer :change_detection_type

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        returns(T.nilable(ContextDev::MonitorListParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: ContextDev::MonitorListParams::Status::OrSymbol).void
      end
      attr_writer :status

      # Filter to items that have this tag.
      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      sig do
        returns(T.nilable(ContextDev::MonitorListParams::TargetType::OrSymbol))
      end
      attr_reader :target_type

      sig do
        params(
          target_type: ContextDev::MonitorListParams::TargetType::OrSymbol
        ).void
      end
      attr_writer :target_type

      sig do
        params(
          change_detection_type:
            ContextDev::MonitorListParams::ChangeDetectionType::OrSymbol,
          cursor: String,
          limit: Integer,
          status: ContextDev::MonitorListParams::Status::OrSymbol,
          tag: String,
          target_type: ContextDev::MonitorListParams::TargetType::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        change_detection_type: nil,
        cursor: nil,
        limit: nil,
        status: nil,
        # Filter to items that have this tag.
        tag: nil,
        target_type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            change_detection_type:
              ContextDev::MonitorListParams::ChangeDetectionType::OrSymbol,
            cursor: String,
            limit: Integer,
            status: ContextDev::MonitorListParams::Status::OrSymbol,
            tag: String,
            target_type: ContextDev::MonitorListParams::TargetType::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      module ChangeDetectionType
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::MonitorListParams::ChangeDetectionType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXACT =
          T.let(
            :exact,
            ContextDev::MonitorListParams::ChangeDetectionType::TaggedSymbol
          )
        SEMANTIC =
          T.let(
            :semantic,
            ContextDev::MonitorListParams::ChangeDetectionType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::MonitorListParams::ChangeDetectionType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::MonitorListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, ContextDev::MonitorListParams::Status::TaggedSymbol)
        PAUSED =
          T.let(:paused, ContextDev::MonitorListParams::Status::TaggedSymbol)
        FAILED =
          T.let(:failed, ContextDev::MonitorListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::MonitorListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      module TargetType
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::MonitorListParams::TargetType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PAGE =
          T.let(:page, ContextDev::MonitorListParams::TargetType::TaggedSymbol)
        SITEMAP =
          T.let(
            :sitemap,
            ContextDev::MonitorListParams::TargetType::TaggedSymbol
          )
        EXTRACT =
          T.let(
            :extract,
            ContextDev::MonitorListParams::TargetType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::MonitorListParams::TargetType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
