# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#retrieve_change
    class MonitorRetrieveChangeResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute change_detection_type
      #
      #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType]
      required :change_detection_type,
               enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType }

      # @!attribute detected_at
      #
      #   @return [Time]
      required :detected_at, Time

      # @!attribute mode
      #   Top-level monitor category. Always `web` today; the concrete behavior is
      #   described by `target` and `change_detection`.
      #
      #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::Mode]
      required :mode, enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::Mode }

      # @!attribute monitor_id
      #
      #   @return [String]
      required :monitor_id, String

      # @!attribute run_id
      #   The run that detected this change.
      #
      #   @return [String]
      required :run_id, String

      # @!attribute summary
      #
      #   @return [String]
      required :summary, String

      # @!attribute tags
      #   User-defined tags for grouping and filtering monitors and their changes.
      #   Duplicates are removed.
      #
      #   @return [Array<String>]
      required :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute target_type
      #
      #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::TargetType]
      required :target_type, enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::TargetType }

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!attribute added_url_count
      #
      #   @return [Integer, nil]
      optional :added_url_count, Integer

      # @!attribute added_urls
      #   At most 500 URLs are included; the corresponding count field is always exact.
      #
      #   @return [Array<String>, nil]
      optional :added_urls, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute after_text_excerpt
      #
      #   @return [String, nil]
      optional :after_text_excerpt, String

      # @!attribute before_text_excerpt
      #
      #   @return [String, nil]
      optional :before_text_excerpt, String

      # @!attribute confidence
      #
      #   @return [Float, nil]
      optional :confidence, Float

      # @!attribute diff
      #   Text diff between the previous and current page baseline (page targets).
      #
      #   @return [String, nil]
      optional :diff, String

      # @!attribute evidence
      #
      #   @return [Array<ContextDev::Models::MonitorRetrieveChangeResponse::Evidence>, nil]
      optional :evidence,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorRetrieveChangeResponse::Evidence] }

      # @!attribute importance
      #
      #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::Importance, nil]
      optional :importance, enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::Importance }

      # @!attribute matched_url_count
      #
      #   @return [Integer, nil]
      optional :matched_url_count, Integer

      # @!attribute matched_urls
      #   At most 500 URLs are included; the corresponding count field is always exact.
      #
      #   @return [Array<String>, nil]
      optional :matched_urls, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute removed_url_count
      #
      #   @return [Integer, nil]
      optional :removed_url_count, Integer

      # @!attribute removed_urls
      #   At most 500 URLs are included; the corresponding count field is always exact.
      #
      #   @return [Array<String>, nil]
      optional :removed_urls, ContextDev::Internal::Type::ArrayOf[String]

      # @!method initialize(id:, change_detection_type:, detected_at:, mode:, monitor_id:, run_id:, summary:, tags:, target_type:, title:, url:, added_url_count: nil, added_urls: nil, after_text_excerpt: nil, before_text_excerpt: nil, confidence: nil, diff: nil, evidence: nil, importance: nil, matched_url_count: nil, matched_urls: nil, removed_url_count: nil, removed_urls: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorRetrieveChangeResponse} for more details.
      #
      #   A detected change. `mode` is the constant `web`; `target_type` and
      #   `change_detection_type` describe the change, and which optional fields are
      #   present depends on them (page: `diff` + excerpts; sitemap:
      #   `added_urls`/`removed_urls`; semantic:
      #   `confidence`/`importance`/`evidence`/`matched_urls`).
      #
      #   @param id [String]
      #
      #   @param change_detection_type [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::ChangeDetectionType]
      #
      #   @param detected_at [Time]
      #
      #   @param mode [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::Mode] Top-level monitor category. Always `web` today; the concrete behavior is describ
      #
      #   @param monitor_id [String]
      #
      #   @param run_id [String] The run that detected this change.
      #
      #   @param summary [String]
      #
      #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes. Duplica
      #
      #   @param target_type [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::TargetType]
      #
      #   @param title [String]
      #
      #   @param url [String]
      #
      #   @param added_url_count [Integer]
      #
      #   @param added_urls [Array<String>] At most 500 URLs are included; the corresponding count field is always exact.
      #
      #   @param after_text_excerpt [String]
      #
      #   @param before_text_excerpt [String]
      #
      #   @param confidence [Float]
      #
      #   @param diff [String] Text diff between the previous and current page baseline (page targets).
      #
      #   @param evidence [Array<ContextDev::Models::MonitorRetrieveChangeResponse::Evidence>]
      #
      #   @param importance [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::Importance]
      #
      #   @param matched_url_count [Integer]
      #
      #   @param matched_urls [Array<String>] At most 500 URLs are included; the corresponding count field is always exact.
      #
      #   @param removed_url_count [Integer]
      #
      #   @param removed_urls [Array<String>] At most 500 URLs are included; the corresponding count field is always exact.

      # @see ContextDev::Models::MonitorRetrieveChangeResponse#change_detection_type
      module ChangeDetectionType
        extend ContextDev::Internal::Type::Enum

        EXACT = :exact
        SEMANTIC = :semantic

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Top-level monitor category. Always `web` today; the concrete behavior is
      # described by `target` and `change_detection`.
      #
      # @see ContextDev::Models::MonitorRetrieveChangeResponse#mode
      module Mode
        extend ContextDev::Internal::Type::Enum

        WEB = :web

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::MonitorRetrieveChangeResponse#target_type
      module TargetType
        extend ContextDev::Internal::Type::Enum

        PAGE = :page
        SITEMAP = :sitemap
        EXTRACT = :extract

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Evidence < ContextDev::Internal::Type::BaseModel
        # @!attribute after
        #   Snapshot of the content after the change.
        #
        #   @return [String]
        required :after, String

        # @!attribute before
        #   Snapshot of the content before the change.
        #
        #   @return [String]
        required :before, String

        # @!attribute url
        #   Optional URL the evidence relates to. Absent for whole-target diffs.
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(after:, before:, url: nil)
        #   @param after [String] Snapshot of the content after the change.
        #
        #   @param before [String] Snapshot of the content before the change.
        #
        #   @param url [String] Optional URL the evidence relates to. Absent for whole-target diffs.
      end

      # @see ContextDev::Models::MonitorRetrieveChangeResponse#importance
      module Importance
        extend ContextDev::Internal::Type::Enum

        LOW = :low
        MEDIUM = :medium
        HIGH = :high

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
