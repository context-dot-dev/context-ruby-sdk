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

      # Top-level monitor category. Always `web` today; the concrete behavior is
      # described by `target` and `change_detection`.
      sig do
        returns(
          ContextDev::Models::MonitorRetrieveChangeResponse::Mode::TaggedSymbol
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

      sig { returns(T.nilable(Integer)) }
      attr_reader :matched_url_count

      sig { params(matched_url_count: Integer).void }
      attr_writer :matched_url_count

      # At most 500 URLs are included; the corresponding count field is always exact.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :matched_urls

      sig { params(matched_urls: T::Array[String]).void }
      attr_writer :matched_urls

      sig { returns(T.nilable(String)) }
      attr_reader :query

      sig { params(query: String).void }
      attr_writer :query

      sig { returns(T.nilable(Integer)) }
      attr_reader :removed_url_count

      sig { params(removed_url_count: Integer).void }
      attr_writer :removed_url_count

      # At most 500 URLs are included; the corresponding count field is always exact.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :removed_urls

      sig { params(removed_urls: T::Array[String]).void }
      attr_writer :removed_urls

      # User-defined tags for grouping and filtering monitors and their changes.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # A detected change. `mode` is the constant `web`; `target_type` and
      # `change_detection_type` describe the change, and which optional fields are
      # present depends on them (page: `diff` + excerpts; sitemap:
      # `added_urls`/`removed_urls`; semantic:
      # `query`/`confidence`/`importance`/`evidence`/`matched_urls`).
      sig do
        params(
          id: String,
          change_detection_type:
            ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType::OrSymbol,
          detected_at: Time,
          mode:
            ContextDev::Models::MonitorRetrieveChangeResponse::Mode::OrSymbol,
          monitor_id: String,
          run_id: String,
          summary: String,
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
          matched_url_count: Integer,
          matched_urls: T::Array[String],
          query: String,
          removed_url_count: Integer,
          removed_urls: T::Array[String],
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
        # The run that detected this change.
        run_id:,
        summary:,
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
        query: nil,
        removed_url_count: nil,
        # At most 500 URLs are included; the corresponding count field is always exact.
        removed_urls: nil,
        # User-defined tags for grouping and filtering monitors and their changes.
        tags: nil
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
            run_id: String,
            summary: String,
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
            matched_url_count: Integer,
            matched_urls: T::Array[String],
            query: String,
            removed_url_count: Integer,
            removed_urls: T::Array[String],
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

      # Top-level monitor category. Always `web` today; the concrete behavior is
      # described by `target` and `change_detection`.
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
    end
  end
end
