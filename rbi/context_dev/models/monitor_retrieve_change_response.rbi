# typed: strong

module ContextDev
  module Models
    class MonitorRetrieveChangeResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorRetrieveChangeResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig do
        returns(
          ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType::TaggedSymbol
        )
      end
      attr_accessor :change_detection_type

      sig { returns(Time) }
      attr_accessor :detected_at

      # Always `web`. Optional.
      sig do
        returns(
          ContextDev::Models::MonitorRetrieveChangeResponse::Mode::TaggedSymbol
        )
      end
      attr_accessor :mode

      sig { returns(String) }
      attr_accessor :monitor_id

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

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
          ContextDev::Models::MonitorRetrieveChangeResponse::TargetType::TaggedSymbol
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
              ContextDev::Models::MonitorRetrieveChangeResponse::Evidence
            ]
          )
        )
      end
      attr_reader :evidence

      sig do
        params(
          evidence:
            T::Array[
              ContextDev::Models::MonitorRetrieveChangeResponse::Evidence::OrHash
            ]
        ).void
      end
      attr_writer :evidence

      sig do
        returns(
          T.nilable(
            ContextDev::Models::MonitorRetrieveChangeResponse::Importance::TaggedSymbol
          )
        )
      end
      attr_reader :importance

      sig do
        params(
          importance:
            ContextDev::Models::MonitorRetrieveChangeResponse::Importance::OrSymbol
        ).void
      end
      attr_writer :importance

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::MonitorRetrieveChangeResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::MonitorRetrieveChangeResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

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

      sig do
        params(
          id: String,
          change_detection_type:
            ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType::OrSymbol,
          detected_at: Time,
          mode:
            ContextDev::Models::MonitorRetrieveChangeResponse::Mode::OrSymbol,
          monitor_id: String,
          request_id: String,
          run_id: String,
          summary: String,
          tags: T::Array[String],
          target_type:
            ContextDev::Models::MonitorRetrieveChangeResponse::TargetType::OrSymbol,
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
              ContextDev::Models::MonitorRetrieveChangeResponse::Evidence::OrHash
            ],
          importance:
            ContextDev::Models::MonitorRetrieveChangeResponse::Importance::OrSymbol,
          key_metadata:
            ContextDev::Models::MonitorRetrieveChangeResponse::KeyMetadata::OrHash,
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
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
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
        # Credits this request used and your remaining balance.
        key_metadata: nil,
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
              ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType::TaggedSymbol,
            detected_at: Time,
            mode:
              ContextDev::Models::MonitorRetrieveChangeResponse::Mode::TaggedSymbol,
            monitor_id: String,
            request_id: String,
            run_id: String,
            summary: String,
            tags: T::Array[String],
            target_type:
              ContextDev::Models::MonitorRetrieveChangeResponse::TargetType::TaggedSymbol,
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
                ContextDev::Models::MonitorRetrieveChangeResponse::Evidence
              ],
            importance:
              ContextDev::Models::MonitorRetrieveChangeResponse::Importance::TaggedSymbol,
            key_metadata:
              ContextDev::Models::MonitorRetrieveChangeResponse::KeyMetadata,
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
              ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXACT =
          T.let(
            :exact,
            ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType::TaggedSymbol
          )
        SEMANTIC =
          T.let(
            :semantic,
            ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType::TaggedSymbol
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
              ContextDev::Models::MonitorRetrieveChangeResponse::Mode
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WEB =
          T.let(
            :web,
            ContextDev::Models::MonitorRetrieveChangeResponse::Mode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorRetrieveChangeResponse::Mode::TaggedSymbol
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
              ContextDev::Models::MonitorRetrieveChangeResponse::TargetType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PAGE =
          T.let(
            :page,
            ContextDev::Models::MonitorRetrieveChangeResponse::TargetType::TaggedSymbol
          )
        SITEMAP =
          T.let(
            :sitemap,
            ContextDev::Models::MonitorRetrieveChangeResponse::TargetType::TaggedSymbol
          )
        EXTRACT =
          T.let(
            :extract,
            ContextDev::Models::MonitorRetrieveChangeResponse::TargetType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorRetrieveChangeResponse::TargetType::TaggedSymbol
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
              ContextDev::Models::MonitorRetrieveChangeResponse::Evidence,
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

        sig { override.returns({ after: String, before: String, url: String }) }
        def to_hash
        end
      end

      module Importance
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::Models::MonitorRetrieveChangeResponse::Importance
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOW =
          T.let(
            :low,
            ContextDev::Models::MonitorRetrieveChangeResponse::Importance::TaggedSymbol
          )
        MEDIUM =
          T.let(
            :medium,
            ContextDev::Models::MonitorRetrieveChangeResponse::Importance::TaggedSymbol
          )
        HIGH =
          T.let(
            :high,
            ContextDev::Models::MonitorRetrieveChangeResponse::Importance::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorRetrieveChangeResponse::Importance::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRetrieveChangeResponse::KeyMetadata,
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
