# typed: strong

module ContextDev
  module Models
    class MonitorListChangesResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorListChangesResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig do
        returns(T::Array[ContextDev::Models::MonitorListChangesResponse::Data])
      end
      attr_accessor :data

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      sig do
        params(
          data:
            T::Array[
              ContextDev::Models::MonitorListChangesResponse::Data::OrHash
            ],
          has_more: T::Boolean,
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(data:, has_more:, next_cursor:)
      end

      sig do
        override.returns(
          {
            data:
              T::Array[ContextDev::Models::MonitorListChangesResponse::Data],
            has_more: T::Boolean,
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListChangesResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            ContextDev::Models::MonitorListChangesResponse::Data::ChangeDetectionType::TaggedSymbol
          )
        end
        attr_accessor :change_detection_type

        sig { returns(Time) }
        attr_accessor :detected_at

        # Top-level monitor category. Always `web` today; the concrete behavior is
        # described by `target` and `change_detection`.
        sig do
          returns(
            ContextDev::Models::MonitorListChangesResponse::Data::Mode::TaggedSymbol
          )
        end
        attr_accessor :mode

        sig { returns(String) }
        attr_accessor :monitor_id

        sig { returns(String) }
        attr_accessor :summary

        sig do
          returns(
            ContextDev::Models::MonitorListChangesResponse::Data::TargetType::TaggedSymbol
          )
        end
        attr_accessor :target_type

        sig { returns(String) }
        attr_accessor :title

        sig { returns(String) }
        attr_accessor :url

        sig { returns(T.nilable(Integer)) }
        attr_reader :added_url_count

        sig { params(added_url_count: Integer).void }
        attr_writer :added_url_count

        sig { returns(T.nilable(Float)) }
        attr_reader :confidence

        sig { params(confidence: Float).void }
        attr_writer :confidence

        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorListChangesResponse::Data::Importance::TaggedSymbol
            )
          )
        end
        attr_reader :importance

        sig do
          params(
            importance:
              ContextDev::Models::MonitorListChangesResponse::Data::Importance::OrSymbol
          ).void
        end
        attr_writer :importance

        sig { returns(T.nilable(Integer)) }
        attr_reader :matched_url_count

        sig { params(matched_url_count: Integer).void }
        attr_writer :matched_url_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :removed_url_count

        sig { params(removed_url_count: Integer).void }
        attr_writer :removed_url_count

        # User-defined tags for grouping and filtering monitors and their changes.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        # A lightweight change summary. `mode` is the constant `web`; `target_type` and
        # `change_detection_type` describe the change, and which optional fields are
        # present depends on them (e.g. sitemap changes include
        # `added_url_count`/`removed_url_count`; semantic changes include
        # `confidence`/`importance`).
        sig do
          params(
            id: String,
            change_detection_type:
              ContextDev::Models::MonitorListChangesResponse::Data::ChangeDetectionType::OrSymbol,
            detected_at: Time,
            mode:
              ContextDev::Models::MonitorListChangesResponse::Data::Mode::OrSymbol,
            monitor_id: String,
            summary: String,
            target_type:
              ContextDev::Models::MonitorListChangesResponse::Data::TargetType::OrSymbol,
            title: String,
            url: String,
            added_url_count: Integer,
            confidence: Float,
            importance:
              ContextDev::Models::MonitorListChangesResponse::Data::Importance::OrSymbol,
            matched_url_count: Integer,
            removed_url_count: Integer,
            tags: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          change_detection_type:,
          detected_at:,
          # Top-level monitor category. Always `web` today; the concrete behavior is
          # described by `target` and `change_detection`.
          mode:,
          monitor_id:,
          summary:,
          target_type:,
          title:,
          url:,
          added_url_count: nil,
          confidence: nil,
          importance: nil,
          matched_url_count: nil,
          removed_url_count: nil,
          # User-defined tags for grouping and filtering monitors and their changes.
          tags: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              change_detection_type:
                ContextDev::Models::MonitorListChangesResponse::Data::ChangeDetectionType::TaggedSymbol,
              detected_at: Time,
              mode:
                ContextDev::Models::MonitorListChangesResponse::Data::Mode::TaggedSymbol,
              monitor_id: String,
              summary: String,
              target_type:
                ContextDev::Models::MonitorListChangesResponse::Data::TargetType::TaggedSymbol,
              title: String,
              url: String,
              added_url_count: Integer,
              confidence: Float,
              importance:
                ContextDev::Models::MonitorListChangesResponse::Data::Importance::TaggedSymbol,
              matched_url_count: Integer,
              removed_url_count: Integer,
              tags: T::Array[String]
            }
          )
        end
        def to_hash
        end

        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListChangesResponse::Data::ChangeDetectionType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXACT =
            T.let(
              :exact,
              ContextDev::Models::MonitorListChangesResponse::Data::ChangeDetectionType::TaggedSymbol
            )
          SEMANTIC =
            T.let(
              :semantic,
              ContextDev::Models::MonitorListChangesResponse::Data::ChangeDetectionType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListChangesResponse::Data::ChangeDetectionType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Top-level monitor category. Always `web` today; the concrete behavior is
        # described by `target` and `change_detection`.
        module Mode
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListChangesResponse::Data::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB =
            T.let(
              :web,
              ContextDev::Models::MonitorListChangesResponse::Data::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListChangesResponse::Data::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module TargetType
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListChangesResponse::Data::TargetType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PAGE =
            T.let(
              :page,
              ContextDev::Models::MonitorListChangesResponse::Data::TargetType::TaggedSymbol
            )
          SITEMAP =
            T.let(
              :sitemap,
              ContextDev::Models::MonitorListChangesResponse::Data::TargetType::TaggedSymbol
            )
          EXTRACT =
            T.let(
              :extract,
              ContextDev::Models::MonitorListChangesResponse::Data::TargetType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListChangesResponse::Data::TargetType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Importance
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListChangesResponse::Data::Importance
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOW =
            T.let(
              :low,
              ContextDev::Models::MonitorListChangesResponse::Data::Importance::TaggedSymbol
            )
          MEDIUM =
            T.let(
              :medium,
              ContextDev::Models::MonitorListChangesResponse::Data::Importance::TaggedSymbol
            )
          HIGH =
            T.let(
              :high,
              ContextDev::Models::MonitorListChangesResponse::Data::Importance::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListChangesResponse::Data::Importance::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
