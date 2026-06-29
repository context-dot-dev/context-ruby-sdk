# frozen_string_literal: true

module ContextDev
  module Models
    # Union of full change detail objects.
    #
    # @see ContextDev::Resources::Monitors#retrieve_change
    module MonitorRetrieveChangeResponse
      extend ContextDev::Internal::Type::Union

      variant -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange }

      variant -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange }

      variant -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange }

      variant -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange }

      class MonitorsPageExactChange < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute change_detection_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::ChangeDetectionType]
        required :change_detection_type,
                 enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::ChangeDetectionType }

        # @!attribute detected_at
        #
        #   @return [Time]
        required :detected_at, Time

        # @!attribute diff
        #   Text diff between the previous and current page baseline.
        #
        #   @return [String]
        required :diff, String

        # @!attribute monitor_id
        #
        #   @return [String]
        required :monitor_id, String

        # @!attribute summary
        #
        #   @return [String]
        required :summary, String

        # @!attribute target_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::TargetType]
        required :target_type,
                 enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::TargetType }

        # @!attribute title
        #
        #   @return [String]
        required :title, String

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!attribute after_text_excerpt
        #
        #   @return [String, nil]
        optional :after_text_excerpt, String

        # @!attribute before_text_excerpt
        #
        #   @return [String, nil]
        optional :before_text_excerpt, String

        # @!attribute tags
        #   User-defined tags for grouping and filtering monitors and their changes.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, change_detection_type:, detected_at:, diff:, monitor_id:, summary:, target_type:, title:, url:, after_text_excerpt: nil, before_text_excerpt: nil, tags: nil)
        #   @param id [String]
        #
        #   @param change_detection_type [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::ChangeDetectionType]
        #
        #   @param detected_at [Time]
        #
        #   @param diff [String] Text diff between the previous and current page baseline.
        #
        #   @param monitor_id [String]
        #
        #   @param summary [String]
        #
        #   @param target_type [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange::TargetType]
        #
        #   @param title [String]
        #
        #   @param url [String]
        #
        #   @param after_text_excerpt [String]
        #
        #   @param before_text_excerpt [String]
        #
        #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.

        # @see ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange#change_detection_type
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          EXACT = :exact

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange#target_type
        module TargetType
          extend ContextDev::Internal::Type::Enum

          PAGE = :page

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class MonitorsSitemapExactChange < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute added_url_count
        #
        #   @return [Integer]
        required :added_url_count, Integer

        # @!attribute added_urls
        #
        #   @return [Array<String>]
        required :added_urls, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute change_detection_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::ChangeDetectionType]
        required :change_detection_type,
                 enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::ChangeDetectionType }

        # @!attribute detected_at
        #
        #   @return [Time]
        required :detected_at, Time

        # @!attribute monitor_id
        #
        #   @return [String]
        required :monitor_id, String

        # @!attribute removed_url_count
        #
        #   @return [Integer]
        required :removed_url_count, Integer

        # @!attribute removed_urls
        #
        #   @return [Array<String>]
        required :removed_urls, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute summary
        #
        #   @return [String]
        required :summary, String

        # @!attribute target_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::TargetType]
        required :target_type,
                 enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::TargetType }

        # @!attribute title
        #
        #   @return [String]
        required :title, String

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!attribute tags
        #   User-defined tags for grouping and filtering monitors and their changes.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, added_url_count:, added_urls:, change_detection_type:, detected_at:, monitor_id:, removed_url_count:, removed_urls:, summary:, target_type:, title:, url:, tags: nil)
        #   @param id [String]
        #
        #   @param added_url_count [Integer]
        #
        #   @param added_urls [Array<String>]
        #
        #   @param change_detection_type [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::ChangeDetectionType]
        #
        #   @param detected_at [Time]
        #
        #   @param monitor_id [String]
        #
        #   @param removed_url_count [Integer]
        #
        #   @param removed_urls [Array<String>]
        #
        #   @param summary [String]
        #
        #   @param target_type [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange::TargetType]
        #
        #   @param title [String]
        #
        #   @param url [String]
        #
        #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.

        # @see ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange#change_detection_type
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          EXACT = :exact

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange#target_type
        module TargetType
          extend ContextDev::Internal::Type::Enum

          SITEMAP = :sitemap

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class MonitorsPageSemanticChange < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute change_detection_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::ChangeDetectionType]
        required :change_detection_type,
                 enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::ChangeDetectionType }

        # @!attribute confidence
        #
        #   @return [Float]
        required :confidence, Float

        # @!attribute detected_at
        #
        #   @return [Time]
        required :detected_at, Time

        # @!attribute evidence
        #
        #   @return [Array<ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Evidence>]
        required :evidence,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Evidence] }

        # @!attribute importance
        #
        #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance]
        required :importance,
                 enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance }

        # @!attribute monitor_id
        #
        #   @return [String]
        required :monitor_id, String

        # @!attribute query
        #
        #   @return [String]
        required :query, String

        # @!attribute summary
        #
        #   @return [String]
        required :summary, String

        # @!attribute target_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::TargetType]
        required :target_type,
                 enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::TargetType }

        # @!attribute title
        #
        #   @return [String]
        required :title, String

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!attribute tags
        #   User-defined tags for grouping and filtering monitors and their changes.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, change_detection_type:, confidence:, detected_at:, evidence:, importance:, monitor_id:, query:, summary:, target_type:, title:, url:, tags: nil)
        #   @param id [String]
        #
        #   @param change_detection_type [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::ChangeDetectionType]
        #
        #   @param confidence [Float]
        #
        #   @param detected_at [Time]
        #
        #   @param evidence [Array<ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Evidence>]
        #
        #   @param importance [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::Importance]
        #
        #   @param monitor_id [String]
        #
        #   @param query [String]
        #
        #   @param summary [String]
        #
        #   @param target_type [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange::TargetType]
        #
        #   @param title [String]
        #
        #   @param url [String]
        #
        #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.

        # @see ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange#change_detection_type
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          SEMANTIC = :semantic

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Evidence < ContextDev::Internal::Type::BaseModel
          # @!attribute after
          #
          #   @return [String]
          required :after, String

          # @!attribute before
          #
          #   @return [String]
          required :before, String

          # @!method initialize(after:, before:)
          #   @param after [String]
          #   @param before [String]
        end

        # @see ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange#importance
        module Importance
          extend ContextDev::Internal::Type::Enum

          LOW = :low
          MEDIUM = :medium
          HIGH = :high

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange#target_type
        module TargetType
          extend ContextDev::Internal::Type::Enum

          PAGE = :page

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class MonitorsExtractSemanticChange < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute change_detection_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::ChangeDetectionType]
        required :change_detection_type,
                 enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::ChangeDetectionType }

        # @!attribute confidence
        #
        #   @return [Float]
        required :confidence, Float

        # @!attribute detected_at
        #
        #   @return [Time]
        required :detected_at, Time

        # @!attribute evidence
        #
        #   @return [Array<ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Evidence>]
        required :evidence,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Evidence] }

        # @!attribute importance
        #
        #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance]
        required :importance,
                 enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance }

        # @!attribute matched_url_count
        #
        #   @return [Integer]
        required :matched_url_count, Integer

        # @!attribute matched_urls
        #
        #   @return [Array<String>]
        required :matched_urls, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute monitor_id
        #
        #   @return [String]
        required :monitor_id, String

        # @!attribute query
        #
        #   @return [String]
        required :query, String

        # @!attribute summary
        #
        #   @return [String]
        required :summary, String

        # @!attribute target_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::TargetType]
        required :target_type,
                 enum: -> { ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::TargetType }

        # @!attribute title
        #
        #   @return [String]
        required :title, String

        # @!attribute url
        #   Root URL of the extract target.
        #
        #   @return [String]
        required :url, String

        # @!attribute tags
        #   User-defined tags for grouping and filtering monitors and their changes.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, change_detection_type:, confidence:, detected_at:, evidence:, importance:, matched_url_count:, matched_urls:, monitor_id:, query:, summary:, target_type:, title:, url:, tags: nil)
        #   @param id [String]
        #
        #   @param change_detection_type [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::ChangeDetectionType]
        #
        #   @param confidence [Float]
        #
        #   @param detected_at [Time]
        #
        #   @param evidence [Array<ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Evidence>]
        #
        #   @param importance [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::Importance]
        #
        #   @param matched_url_count [Integer]
        #
        #   @param matched_urls [Array<String>]
        #
        #   @param monitor_id [String]
        #
        #   @param query [String]
        #
        #   @param summary [String]
        #
        #   @param target_type [Symbol, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange::TargetType]
        #
        #   @param title [String]
        #
        #   @param url [String] Root URL of the extract target.
        #
        #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.

        # @see ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange#change_detection_type
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          SEMANTIC = :semantic

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Evidence < ContextDev::Internal::Type::BaseModel
          # @!attribute after
          #   Snapshot of the extracted data after the change.
          #
          #   @return [String]
          required :after, String

          # @!attribute before
          #   Snapshot of the extracted data before the change.
          #
          #   @return [String]
          required :before, String

          # @!attribute url
          #   Optional URL the evidence relates to. Absent for whole-target extract diffs.
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(after:, before:, url: nil)
          #   @param after [String] Snapshot of the extracted data after the change.
          #
          #   @param before [String] Snapshot of the extracted data before the change.
          #
          #   @param url [String] Optional URL the evidence relates to. Absent for whole-target extract diffs.
        end

        # @see ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange#importance
        module Importance
          extend ContextDev::Internal::Type::Enum

          LOW = :low
          MEDIUM = :medium
          HIGH = :high

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange#target_type
        module TargetType
          extend ContextDev::Internal::Type::Enum

          EXTRACT = :extract

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageExactChange, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsSitemapExactChange, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsPageSemanticChange, ContextDev::Models::MonitorRetrieveChangeResponse::MonitorsExtractSemanticChange)]
    end
  end
end
