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
          T::Array[ContextDev::Models::MonitorListAccountChangesResponse::Data]
        )
      end
      attr_accessor :data

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data:
            T::Array[
              ContextDev::Models::MonitorListAccountChangesResponse::Data::OrHash
            ],
          has_more: T::Boolean,
          next_cursor: T.nilable(String),
          request_id: String,
          key_metadata:
            ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        has_more:,
        next_cursor:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            data:
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data
              ],
            has_more: T::Boolean,
            next_cursor: T.nilable(String),
            request_id: String,
            key_metadata:
              ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListAccountChangesResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::TaggedSymbol
          )
        end
        attr_accessor :change_detection_type

        sig { returns(Time) }
        attr_accessor :detected_at

        # Always `web`. Optional.
        sig do
          returns(
            ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode::TaggedSymbol
          )
        end
        attr_accessor :mode

        sig { returns(String) }
        attr_accessor :monitor_id

        # The run that detected this change.
        sig { returns(String) }
        attr_accessor :run_id

        sig { returns(String) }
        attr_accessor :summary

        # Labels for filtering monitors, their changes, and their usage.
        sig { returns(T::Array[String]) }
        attr_accessor :tags

        sig do
          returns(
            ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
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

        # At most 500 URLs are included; the corresponding count field is always exact.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :added_urls

        sig { params(added_urls: T::Array[String]).void }
        attr_writer :added_urls

        sig { returns(T.nilable(String)) }
        attr_reader :after_text_excerpt

        sig { params(after_text_excerpt: String).void }
        attr_writer :after_text_excerpt

        sig { returns(T.nilable(String)) }
        attr_reader :before_text_excerpt

        sig { params(before_text_excerpt: String).void }
        attr_writer :before_text_excerpt

        sig { returns(T.nilable(Float)) }
        attr_reader :confidence

        sig { params(confidence: Float).void }
        attr_writer :confidence

        # Text diff between the previous and current page baseline (page targets).
        sig { returns(T.nilable(String)) }
        attr_reader :diff

        sig { params(diff: String).void }
        attr_writer :diff

        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence
              ]
            )
          )
        end
        attr_reader :evidence

        sig do
          params(
            evidence:
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence::OrHash
              ]
          ).void
        end
        attr_writer :evidence

        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol
            )
          )
        end
        attr_reader :importance

        sig do
          params(
            importance:
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::OrSymbol
          ).void
        end
        attr_writer :importance

        sig { returns(T.nilable(Integer)) }
        attr_reader :matched_url_count

        sig { params(matched_url_count: Integer).void }
        attr_writer :matched_url_count

        # At most 500 URLs are included; the corresponding count field is always exact.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :matched_urls

        sig { params(matched_urls: T::Array[String]).void }
        attr_writer :matched_urls

        sig { returns(T.nilable(Integer)) }
        attr_reader :removed_url_count

        sig { params(removed_url_count: Integer).void }
        attr_writer :removed_url_count

        # At most 500 URLs are included; the corresponding count field is always exact.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :removed_urls

        sig { params(removed_urls: T::Array[String]).void }
        attr_writer :removed_urls

        # Detected change, including applicable diffs, URLs, and supporting evidence.
        sig do
          params(
            id: String,
            change_detection_type:
              ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::OrSymbol,
            detected_at: Time,
            mode:
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode::OrSymbol,
            monitor_id: String,
            run_id: String,
            summary: String,
            tags: T::Array[String],
            target_type:
              ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::OrSymbol,
            title: String,
            url: String,
            added_url_count: Integer,
            added_urls: T::Array[String],
            after_text_excerpt: String,
            before_text_excerpt: String,
            confidence: Float,
            diff: String,
            evidence:
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence::OrHash
              ],
            importance:
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::OrSymbol,
            matched_url_count: Integer,
            matched_urls: T::Array[String],
            removed_url_count: Integer,
            removed_urls: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          change_detection_type:,
          detected_at:,
          # Always `web`. Optional.
          mode:,
          monitor_id:,
          # The run that detected this change.
          run_id:,
          summary:,
          # Labels for filtering monitors, their changes, and their usage.
          tags:,
          target_type:,
          title:,
          url:,
          added_url_count: nil,
          # At most 500 URLs are included; the corresponding count field is always exact.
          added_urls: nil,
          after_text_excerpt: nil,
          before_text_excerpt: nil,
          confidence: nil,
          # Text diff between the previous and current page baseline (page targets).
          diff: nil,
          evidence: nil,
          importance: nil,
          matched_url_count: nil,
          # At most 500 URLs are included; the corresponding count field is always exact.
          matched_urls: nil,
          removed_url_count: nil,
          # At most 500 URLs are included; the corresponding count field is always exact.
          removed_urls: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              change_detection_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::TaggedSymbol,
              detected_at: Time,
              mode:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode::TaggedSymbol,
              monitor_id: String,
              run_id: String,
              summary: String,
              tags: T::Array[String],
              target_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol,
              title: String,
              url: String,
              added_url_count: Integer,
              added_urls: T::Array[String],
              after_text_excerpt: String,
              before_text_excerpt: String,
              confidence: Float,
              diff: String,
              evidence:
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence
                ],
              importance:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol,
              matched_url_count: Integer,
              matched_urls: T::Array[String],
              removed_url_count: Integer,
              removed_urls: T::Array[String]
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
                ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXACT =
            T.let(
              :exact,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::TaggedSymbol
            )
          SEMANTIC =
            T.let(
              :semantic,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Always `web`. Optional.
        module Mode
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB =
            T.let(
              :web,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode::TaggedSymbol
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
                ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PAGE =
            T.let(
              :page,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
            )
          SITEMAP =
            T.let(
              :sitemap,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
            )
          EXTRACT =
            T.let(
              :extract,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
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
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence,
                ContextDev::Internal::AnyHash
              )
            end

          # Snapshot of the content after the change.
          sig { returns(String) }
          attr_accessor :after

          # Snapshot of the content before the change.
          sig { returns(String) }
          attr_accessor :before

          # Optional URL the evidence relates to. Absent for whole-target diffs.
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
            # Snapshot of the content after the change.
            after:,
            # Snapshot of the content before the change.
            before:,
            # Optional URL the evidence relates to. Absent for whole-target diffs.
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
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOW =
            T.let(
              :low,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol
            )
          MEDIUM =
            T.let(
              :medium,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol
            )
          HIGH =
            T.let(
              :high,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credits this request used and your remaining balance.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits charged for this request.
          credits_consumed:,
          # Credits remaining for your organization.
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
