# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_account_changes
    class MonitorListAccountChangesResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::MonitorListAccountChangesResponse::Data] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, has_more:, next_cursor:)
      #   @param data [Array<ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String, nil]

      # Union of lightweight change summaries.
      module Data
        extend ContextDev::Internal::Type::Union

        variant -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary }

        variant -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary }

        variant -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary }

        variant -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary }

        class MonitorsPageExactChangeSummary < ContextDev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute change_detection_type
          #
          #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::ChangeDetectionType]
          required :change_detection_type,
                   enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::ChangeDetectionType }

          # @!attribute detected_at
          #
          #   @return [Time]
          required :detected_at, Time

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
          #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::TargetType]
          required :target_type,
                   enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::TargetType }

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

          # @!method initialize(id:, change_detection_type:, detected_at:, monitor_id:, summary:, target_type:, title:, url:, tags: nil)
          #   @param id [String]
          #
          #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::ChangeDetectionType]
          #
          #   @param detected_at [Time]
          #
          #   @param monitor_id [String]
          #
          #   @param summary [String]
          #
          #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary::TargetType]
          #
          #   @param title [String]
          #
          #   @param url [String]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.

          # @see ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary#change_detection_type
          module ChangeDetectionType
            extend ContextDev::Internal::Type::Enum

            EXACT = :exact

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary#target_type
          module TargetType
            extend ContextDev::Internal::Type::Enum

            PAGE = :page

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class MonitorsSitemapExactChangeSummary < ContextDev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute added_url_count
          #
          #   @return [Integer]
          required :added_url_count, Integer

          # @!attribute change_detection_type
          #
          #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::ChangeDetectionType]
          required :change_detection_type,
                   enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::ChangeDetectionType }

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

          # @!attribute summary
          #
          #   @return [String]
          required :summary, String

          # @!attribute target_type
          #
          #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::TargetType]
          required :target_type,
                   enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::TargetType }

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

          # @!method initialize(id:, added_url_count:, change_detection_type:, detected_at:, monitor_id:, removed_url_count:, summary:, target_type:, title:, url:, tags: nil)
          #   @param id [String]
          #
          #   @param added_url_count [Integer]
          #
          #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::ChangeDetectionType]
          #
          #   @param detected_at [Time]
          #
          #   @param monitor_id [String]
          #
          #   @param removed_url_count [Integer]
          #
          #   @param summary [String]
          #
          #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary::TargetType]
          #
          #   @param title [String]
          #
          #   @param url [String]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.

          # @see ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary#change_detection_type
          module ChangeDetectionType
            extend ContextDev::Internal::Type::Enum

            EXACT = :exact

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary#target_type
          module TargetType
            extend ContextDev::Internal::Type::Enum

            SITEMAP = :sitemap

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class MonitorsPageSemanticChangeSummary < ContextDev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute change_detection_type
          #
          #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::ChangeDetectionType]
          required :change_detection_type,
                   enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::ChangeDetectionType }

          # @!attribute confidence
          #
          #   @return [Float]
          required :confidence, Float

          # @!attribute detected_at
          #
          #   @return [Time]
          required :detected_at, Time

          # @!attribute importance
          #
          #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance]
          required :importance,
                   enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance }

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
          #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::TargetType]
          required :target_type,
                   enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::TargetType }

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

          # @!method initialize(id:, change_detection_type:, confidence:, detected_at:, importance:, monitor_id:, summary:, target_type:, title:, url:, tags: nil)
          #   @param id [String]
          #
          #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::ChangeDetectionType]
          #
          #   @param confidence [Float]
          #
          #   @param detected_at [Time]
          #
          #   @param importance [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::Importance]
          #
          #   @param monitor_id [String]
          #
          #   @param summary [String]
          #
          #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary::TargetType]
          #
          #   @param title [String]
          #
          #   @param url [String]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.

          # @see ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary#change_detection_type
          module ChangeDetectionType
            extend ContextDev::Internal::Type::Enum

            SEMANTIC = :semantic

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary#importance
          module Importance
            extend ContextDev::Internal::Type::Enum

            LOW = :low
            MEDIUM = :medium
            HIGH = :high

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary#target_type
          module TargetType
            extend ContextDev::Internal::Type::Enum

            PAGE = :page

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class MonitorsExtractSemanticChangeSummary < ContextDev::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute change_detection_type
          #
          #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::ChangeDetectionType]
          required :change_detection_type,
                   enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::ChangeDetectionType }

          # @!attribute confidence
          #
          #   @return [Float]
          required :confidence, Float

          # @!attribute detected_at
          #
          #   @return [Time]
          required :detected_at, Time

          # @!attribute importance
          #
          #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance]
          required :importance,
                   enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance }

          # @!attribute matched_url_count
          #
          #   @return [Integer]
          required :matched_url_count, Integer

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
          #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::TargetType]
          required :target_type,
                   enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::TargetType }

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

          # @!method initialize(id:, change_detection_type:, confidence:, detected_at:, importance:, matched_url_count:, monitor_id:, summary:, target_type:, title:, url:, tags: nil)
          #   @param id [String]
          #
          #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::ChangeDetectionType]
          #
          #   @param confidence [Float]
          #
          #   @param detected_at [Time]
          #
          #   @param importance [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::Importance]
          #
          #   @param matched_url_count [Integer]
          #
          #   @param monitor_id [String]
          #
          #   @param summary [String]
          #
          #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary::TargetType]
          #
          #   @param title [String]
          #
          #   @param url [String]
          #
          #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes.

          # @see ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary#change_detection_type
          module ChangeDetectionType
            extend ContextDev::Internal::Type::Enum

            SEMANTIC = :semantic

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary#importance
          module Importance
            extend ContextDev::Internal::Type::Enum

            LOW = :low
            MEDIUM = :medium
            HIGH = :high

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary#target_type
          module TargetType
            extend ContextDev::Internal::Type::Enum

            EXTRACT = :extract

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageExactChangeSummary, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsSitemapExactChangeSummary, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsPageSemanticChangeSummary, ContextDev::Models::MonitorListAccountChangesResponse::Data::MonitorsExtractSemanticChangeSummary)]
      end
    end
  end
end
