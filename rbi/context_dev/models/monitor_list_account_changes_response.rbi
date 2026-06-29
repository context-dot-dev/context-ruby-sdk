# typed: strong

module ContextDev
  module Models
    class MonitorListAccountChangesResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorListAccountChangesResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig do
        returns(
          T::Array[
            ContextDev::Models::MonitorListAccountChangesResponse::Data::Variants
          ]
        )
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
              T.any(
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::OrHash,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::OrHash,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::OrHash,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::OrHash
              )
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
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Variants
              ],
            has_more: T::Boolean,
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Union of lightweight change summaries.
      module Data
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary
            )
          end

        class MonitorsPageExactChangeSummary < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig do
            returns(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::ChangeDetectionType::TaggedSymbol
            )
          end
          attr_accessor :change_detection_type

          sig { returns(Time) }
          attr_accessor :detected_at

          sig { returns(String) }
          attr_accessor :monitor_id

          sig { returns(String) }
          attr_accessor :summary

          sig do
            returns(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::TargetType::TaggedSymbol
            )
          end
          attr_accessor :target_type

          sig { returns(String) }
          attr_accessor :title

          sig { returns(String) }
          attr_accessor :url

          # User-defined tags for grouping and filtering monitors and their changes.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          sig do
            params(
              id: String,
              change_detection_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::ChangeDetectionType::OrSymbol,
              detected_at: Time,
              monitor_id: String,
              summary: String,
              target_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::TargetType::OrSymbol,
              title: String,
              url: String,
              tags: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            change_detection_type:,
            detected_at:,
            monitor_id:,
            summary:,
            target_type:,
            title:,
            url:,
            # User-defined tags for grouping and filtering monitors and their changes.
            tags: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                change_detection_type:
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::ChangeDetectionType::TaggedSymbol,
                detected_at: Time,
                monitor_id: String,
                summary: String,
                target_type:
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::TargetType::TaggedSymbol,
                title: String,
                url: String,
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
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::ChangeDetectionType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXACT =
              T.let(
                :exact,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::ChangeDetectionType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::ChangeDetectionType::TaggedSymbol
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
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::TargetType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PAGE =
              T.let(
                :page,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::TargetType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::TargetType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class MonitorsSitemapExactChangeSummary < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig { returns(Integer) }
          attr_accessor :added_url_count

          sig do
            returns(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::ChangeDetectionType::TaggedSymbol
            )
          end
          attr_accessor :change_detection_type

          sig { returns(Time) }
          attr_accessor :detected_at

          sig { returns(String) }
          attr_accessor :monitor_id

          sig { returns(Integer) }
          attr_accessor :removed_url_count

          sig { returns(String) }
          attr_accessor :summary

          sig do
            returns(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::TargetType::TaggedSymbol
            )
          end
          attr_accessor :target_type

          sig { returns(String) }
          attr_accessor :title

          sig { returns(String) }
          attr_accessor :url

          # User-defined tags for grouping and filtering monitors and their changes.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          sig do
            params(
              id: String,
              added_url_count: Integer,
              change_detection_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::ChangeDetectionType::OrSymbol,
              detected_at: Time,
              monitor_id: String,
              removed_url_count: Integer,
              summary: String,
              target_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::TargetType::OrSymbol,
              title: String,
              url: String,
              tags: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            added_url_count:,
            change_detection_type:,
            detected_at:,
            monitor_id:,
            removed_url_count:,
            summary:,
            target_type:,
            title:,
            url:,
            # User-defined tags for grouping and filtering monitors and their changes.
            tags: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                added_url_count: Integer,
                change_detection_type:
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::ChangeDetectionType::TaggedSymbol,
                detected_at: Time,
                monitor_id: String,
                removed_url_count: Integer,
                summary: String,
                target_type:
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::TargetType::TaggedSymbol,
                title: String,
                url: String,
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
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::ChangeDetectionType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXACT =
              T.let(
                :exact,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::ChangeDetectionType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::ChangeDetectionType::TaggedSymbol
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
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::TargetType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SITEMAP =
              T.let(
                :sitemap,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::TargetType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::TargetType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class MonitorsPageSemanticChangeSummary < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig do
            returns(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::ChangeDetectionType::TaggedSymbol
            )
          end
          attr_accessor :change_detection_type

          sig { returns(Float) }
          attr_accessor :confidence

          sig { returns(Time) }
          attr_accessor :detected_at

          sig do
            returns(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance::TaggedSymbol
            )
          end
          attr_accessor :importance

          sig { returns(String) }
          attr_accessor :monitor_id

          sig { returns(String) }
          attr_accessor :summary

          sig do
            returns(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::TargetType::TaggedSymbol
            )
          end
          attr_accessor :target_type

          sig { returns(String) }
          attr_accessor :title

          sig { returns(String) }
          attr_accessor :url

          # User-defined tags for grouping and filtering monitors and their changes.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          sig do
            params(
              id: String,
              change_detection_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::ChangeDetectionType::OrSymbol,
              confidence: Float,
              detected_at: Time,
              importance:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance::OrSymbol,
              monitor_id: String,
              summary: String,
              target_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::TargetType::OrSymbol,
              title: String,
              url: String,
              tags: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            change_detection_type:,
            confidence:,
            detected_at:,
            importance:,
            monitor_id:,
            summary:,
            target_type:,
            title:,
            url:,
            # User-defined tags for grouping and filtering monitors and their changes.
            tags: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                change_detection_type:
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::ChangeDetectionType::TaggedSymbol,
                confidence: Float,
                detected_at: Time,
                importance:
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance::TaggedSymbol,
                monitor_id: String,
                summary: String,
                target_type:
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::TargetType::TaggedSymbol,
                title: String,
                url: String,
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
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::ChangeDetectionType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SEMANTIC =
              T.let(
                :semantic,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::ChangeDetectionType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::ChangeDetectionType::TaggedSymbol
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
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LOW =
              T.let(
                :low,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance::TaggedSymbol
              )
            MEDIUM =
              T.let(
                :medium,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance::TaggedSymbol
              )
            HIGH =
              T.let(
                :high,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance::TaggedSymbol
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
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::TargetType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PAGE =
              T.let(
                :page,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::TargetType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::TargetType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class MonitorsExtractSemanticChangeSummary < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :id

          sig do
            returns(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::ChangeDetectionType::TaggedSymbol
            )
          end
          attr_accessor :change_detection_type

          sig { returns(Float) }
          attr_accessor :confidence

          sig { returns(Time) }
          attr_accessor :detected_at

          sig do
            returns(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance::TaggedSymbol
            )
          end
          attr_accessor :importance

          sig { returns(Integer) }
          attr_accessor :matched_url_count

          sig { returns(String) }
          attr_accessor :monitor_id

          sig { returns(String) }
          attr_accessor :summary

          sig do
            returns(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::TargetType::TaggedSymbol
            )
          end
          attr_accessor :target_type

          sig { returns(String) }
          attr_accessor :title

          sig { returns(String) }
          attr_accessor :url

          # User-defined tags for grouping and filtering monitors and their changes.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          sig do
            params(
              id: String,
              change_detection_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::ChangeDetectionType::OrSymbol,
              confidence: Float,
              detected_at: Time,
              importance:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance::OrSymbol,
              matched_url_count: Integer,
              monitor_id: String,
              summary: String,
              target_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::TargetType::OrSymbol,
              title: String,
              url: String,
              tags: T::Array[String]
            ).returns(T.attached_class)
          end
          def self.new(
            id:,
            change_detection_type:,
            confidence:,
            detected_at:,
            importance:,
            matched_url_count:,
            monitor_id:,
            summary:,
            target_type:,
            title:,
            url:,
            # User-defined tags for grouping and filtering monitors and their changes.
            tags: nil
          )
          end

          sig do
            override.returns(
              {
                id: String,
                change_detection_type:
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::ChangeDetectionType::TaggedSymbol,
                confidence: Float,
                detected_at: Time,
                importance:
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance::TaggedSymbol,
                matched_url_count: Integer,
                monitor_id: String,
                summary: String,
                target_type:
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::TargetType::TaggedSymbol,
                title: String,
                url: String,
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
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::ChangeDetectionType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SEMANTIC =
              T.let(
                :semantic,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::ChangeDetectionType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::ChangeDetectionType::TaggedSymbol
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
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LOW =
              T.let(
                :low,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance::TaggedSymbol
              )
            MEDIUM =
              T.let(
                :medium,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance::TaggedSymbol
              )
            HIGH =
              T.let(
                :high,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance::TaggedSymbol
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
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::TargetType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EXTRACT =
              T.let(
                :extract,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::TargetType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::TargetType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
