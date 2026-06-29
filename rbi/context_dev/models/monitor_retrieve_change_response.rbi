# typed: strong

module ContextDev
  module Models
    # Union of full change detail objects.
    module MonitorRetrieveChangeResponse
      extend ContextDev::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange,
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange,
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange,
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange
          )
        end

      class MonitorsPageExactChange < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::ChangeDetectionType::TaggedSymbol
          )
        end
        attr_accessor :change_detection_type

        sig { returns(Time) }
        attr_accessor :detected_at

        # Text diff between the previous and current page baseline.
        sig { returns(String) }
        attr_accessor :diff

        sig { returns(String) }
        attr_accessor :monitor_id

        sig { returns(String) }
        attr_accessor :summary

        sig do
          returns(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::TargetType::TaggedSymbol
          )
        end
        attr_accessor :target_type

        sig { returns(String) }
        attr_accessor :title

        sig { returns(String) }
        attr_accessor :url

        sig { returns(T.nilable(String)) }
        attr_reader :after_text_excerpt

        sig { params(after_text_excerpt: String).void }
        attr_writer :after_text_excerpt

        sig { returns(T.nilable(String)) }
        attr_reader :before_text_excerpt

        sig { params(before_text_excerpt: String).void }
        attr_writer :before_text_excerpt

        # User-defined tags for grouping and filtering monitors and their changes.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tags

        sig { params(tags: T::Array[String]).void }
        attr_writer :tags

        sig do
          params(
            id: String,
            change_detection_type:
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::ChangeDetectionType::OrSymbol,
            detected_at: Time,
            diff: String,
            monitor_id: String,
            summary: String,
            target_type:
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::TargetType::OrSymbol,
            title: String,
            url: String,
            after_text_excerpt: String,
            before_text_excerpt: String,
            tags: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          change_detection_type:,
          detected_at:,
          # Text diff between the previous and current page baseline.
          diff:,
          monitor_id:,
          summary:,
          target_type:,
          title:,
          url:,
          after_text_excerpt: nil,
          before_text_excerpt: nil,
          # User-defined tags for grouping and filtering monitors and their changes.
          tags: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              change_detection_type:
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::ChangeDetectionType::TaggedSymbol,
              detected_at: Time,
              diff: String,
              monitor_id: String,
              summary: String,
              target_type:
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::TargetType::TaggedSymbol,
              title: String,
              url: String,
              after_text_excerpt: String,
              before_text_excerpt: String,
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
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::ChangeDetectionType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXACT =
            T.let(
              :exact,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::ChangeDetectionType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::ChangeDetectionType::TaggedSymbol
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
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::TargetType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PAGE =
            T.let(
              :page,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::TargetType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::TargetType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class MonitorsSitemapExactChange < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Integer) }
        attr_accessor :added_url_count

        sig { returns(T::Array[String]) }
        attr_accessor :added_urls

        sig do
          returns(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::ChangeDetectionType::TaggedSymbol
          )
        end
        attr_accessor :change_detection_type

        sig { returns(Time) }
        attr_accessor :detected_at

        sig { returns(String) }
        attr_accessor :monitor_id

        sig { returns(Integer) }
        attr_accessor :removed_url_count

        sig { returns(T::Array[String]) }
        attr_accessor :removed_urls

        sig { returns(String) }
        attr_accessor :summary

        sig do
          returns(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::TargetType::TaggedSymbol
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
            added_urls: T::Array[String],
            change_detection_type:
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::ChangeDetectionType::OrSymbol,
            detected_at: Time,
            monitor_id: String,
            removed_url_count: Integer,
            removed_urls: T::Array[String],
            summary: String,
            target_type:
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::TargetType::OrSymbol,
            title: String,
            url: String,
            tags: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          added_url_count:,
          added_urls:,
          change_detection_type:,
          detected_at:,
          monitor_id:,
          removed_url_count:,
          removed_urls:,
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
              added_urls: T::Array[String],
              change_detection_type:
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::ChangeDetectionType::TaggedSymbol,
              detected_at: Time,
              monitor_id: String,
              removed_url_count: Integer,
              removed_urls: T::Array[String],
              summary: String,
              target_type:
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::TargetType::TaggedSymbol,
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
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::ChangeDetectionType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXACT =
            T.let(
              :exact,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::ChangeDetectionType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::ChangeDetectionType::TaggedSymbol
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
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::TargetType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SITEMAP =
            T.let(
              :sitemap,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::TargetType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::TargetType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class MonitorsPageSemanticChange < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::ChangeDetectionType::TaggedSymbol
          )
        end
        attr_accessor :change_detection_type

        sig { returns(Float) }
        attr_accessor :confidence

        sig { returns(Time) }
        attr_accessor :detected_at

        sig do
          returns(
            T::Array[
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Evidence
            ]
          )
        end
        attr_accessor :evidence

        sig do
          returns(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance::TaggedSymbol
          )
        end
        attr_accessor :importance

        sig { returns(String) }
        attr_accessor :monitor_id

        sig { returns(String) }
        attr_accessor :query

        sig { returns(String) }
        attr_accessor :summary

        sig do
          returns(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::TargetType::TaggedSymbol
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
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::ChangeDetectionType::OrSymbol,
            confidence: Float,
            detected_at: Time,
            evidence:
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Evidence::OrHash
              ],
            importance:
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance::OrSymbol,
            monitor_id: String,
            query: String,
            summary: String,
            target_type:
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::TargetType::OrSymbol,
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
          evidence:,
          importance:,
          monitor_id:,
          query:,
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
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::ChangeDetectionType::TaggedSymbol,
              confidence: Float,
              detected_at: Time,
              evidence:
                T::Array[
                  ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Evidence
                ],
              importance:
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance::TaggedSymbol,
              monitor_id: String,
              query: String,
              summary: String,
              target_type:
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::TargetType::TaggedSymbol,
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
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::ChangeDetectionType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SEMANTIC =
            T.let(
              :semantic,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::ChangeDetectionType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::ChangeDetectionType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Evidence < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Evidence,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :after

          sig { returns(String) }
          attr_accessor :before

          sig do
            params(after: String, before: String).returns(T.attached_class)
          end
          def self.new(after:, before:)
          end

          sig { override.returns({ after: String, before: String }) }
          def to_hash
          end
        end

        module Importance
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOW =
            T.let(
              :low,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance::TaggedSymbol
            )
          MEDIUM =
            T.let(
              :medium,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance::TaggedSymbol
            )
          HIGH =
            T.let(
              :high,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance::TaggedSymbol
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
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::TargetType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PAGE =
            T.let(
              :page,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::TargetType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::TargetType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class MonitorsExtractSemanticChange < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::ChangeDetectionType::TaggedSymbol
          )
        end
        attr_accessor :change_detection_type

        sig { returns(Float) }
        attr_accessor :confidence

        sig { returns(Time) }
        attr_accessor :detected_at

        sig do
          returns(
            T::Array[
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Evidence
            ]
          )
        end
        attr_accessor :evidence

        sig do
          returns(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance::TaggedSymbol
          )
        end
        attr_accessor :importance

        sig { returns(Integer) }
        attr_accessor :matched_url_count

        sig { returns(T::Array[String]) }
        attr_accessor :matched_urls

        sig { returns(String) }
        attr_accessor :monitor_id

        sig { returns(String) }
        attr_accessor :query

        sig { returns(String) }
        attr_accessor :summary

        sig do
          returns(
            ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::TargetType::TaggedSymbol
          )
        end
        attr_accessor :target_type

        sig { returns(String) }
        attr_accessor :title

        # Root URL of the extract target.
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
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::ChangeDetectionType::OrSymbol,
            confidence: Float,
            detected_at: Time,
            evidence:
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Evidence::OrHash
              ],
            importance:
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance::OrSymbol,
            matched_url_count: Integer,
            matched_urls: T::Array[String],
            monitor_id: String,
            query: String,
            summary: String,
            target_type:
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::TargetType::OrSymbol,
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
          evidence:,
          importance:,
          matched_url_count:,
          matched_urls:,
          monitor_id:,
          query:,
          summary:,
          target_type:,
          title:,
          # Root URL of the extract target.
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
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::ChangeDetectionType::TaggedSymbol,
              confidence: Float,
              detected_at: Time,
              evidence:
                T::Array[
                  ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Evidence
                ],
              importance:
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance::TaggedSymbol,
              matched_url_count: Integer,
              matched_urls: T::Array[String],
              monitor_id: String,
              query: String,
              summary: String,
              target_type:
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::TargetType::TaggedSymbol,
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
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::ChangeDetectionType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SEMANTIC =
            T.let(
              :semantic,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::ChangeDetectionType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::ChangeDetectionType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Evidence < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Evidence,
                ContextDev::Internal::AnyHash
              )
            end

          # Snapshot of the extracted data after the change.
          sig { returns(String) }
          attr_accessor :after

          # Snapshot of the extracted data before the change.
          sig { returns(String) }
          attr_accessor :before

          # Optional URL the evidence relates to. Absent for whole-target extract diffs.
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          sig do
            params(after: String, before: String, url: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Snapshot of the extracted data after the change.
            after:,
            # Snapshot of the extracted data before the change.
            before:,
            # Optional URL the evidence relates to. Absent for whole-target extract diffs.
            url: nil
          )
          end

          sig do
            override.returns({ after: String, before: String, url: String })
          end
          def to_hash
          end
        end

        module Importance
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOW =
            T.let(
              :low,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance::TaggedSymbol
            )
          MEDIUM =
            T.let(
              :medium,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance::TaggedSymbol
            )
          HIGH =
            T.let(
              :high,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance::TaggedSymbol
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
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::TargetType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXTRACT =
            T.let(
              :extract,
              ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::TargetType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::TargetType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig do
        override.returns(
          T::Array[ContextDev::Models::MonitorRetrieveChangeResponse::Variants]
        )
      end
      def self.variants
      end
    end
  end
end
