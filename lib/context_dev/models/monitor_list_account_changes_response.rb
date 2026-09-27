# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_account_changes
    class MonitorListAccountChangesResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<ContextDev::Models::MonitorListAccountChangesResponse::Data>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListAccountChangesResponse::Data] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata }

      # @!method initialize(data:, has_more:, next_cursor:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorListAccountChangesResponse} for more details.
      #
      #   @param data [Array<ContextDev::Models::MonitorListAccountChangesResponse::Data>]
      #
      #   @param has_more [Boolean]
      #
      #   @param next_cursor [String, nil]
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata] Credits this request used and your remaining balance.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute change_detection_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType]
        required :change_detection_type,
                 enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType }

        # @!attribute detected_at
        #
        #   @return [Time]
        required :detected_at, Time

        # @!attribute mode
        #   Always `web`. Optional.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode]
        required :mode, enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode }

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
        #   Labels for filtering monitors, their changes, and their usage.
        #
        #   @return [Array<String>]
        required :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute target_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType]
        required :target_type,
                 enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType }

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
        #   @return [Array<ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence>, nil]
        optional :evidence,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence] }

        # @!attribute importance
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance, nil]
        optional :importance, enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance }

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
        #   Detected change, including applicable diffs, URLs, and supporting evidence.
        #
        #   @param id [String]
        #
        #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType]
        #
        #   @param detected_at [Time]
        #
        #   @param mode [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode] Always `web`. Optional.
        #
        #   @param monitor_id [String]
        #
        #   @param run_id [String] The run that detected this change.
        #
        #   @param summary [String]
        #
        #   @param tags [Array<String>] Labels for filtering monitors, their changes, and their usage.
        #
        #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType]
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
        #   @param evidence [Array<ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence>]
        #
        #   @param importance [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance]
        #
        #   @param matched_url_count [Integer]
        #
        #   @param matched_urls [Array<String>] At most 500 URLs are included; the corresponding count field is always exact.
        #
        #   @param removed_url_count [Integer]
        #
        #   @param removed_urls [Array<String>] At most 500 URLs are included; the corresponding count field is always exact.

        # @see ContextDev::Models::MonitorListAccountChangesResponse::Data#change_detection_type
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          EXACT = :exact
          SEMANTIC = :semantic

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Always `web`. Optional.
        #
        # @see ContextDev::Models::MonitorListAccountChangesResponse::Data#mode
        module Mode
          extend ContextDev::Internal::Type::Enum

          WEB = :web

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorListAccountChangesResponse::Data#target_type
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

        # @see ContextDev::Models::MonitorListAccountChangesResponse::Data#importance
        module Importance
          extend ContextDev::Internal::Type::Enum

          LOW = :low
          MEDIUM = :medium
          HIGH = :high

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::MonitorListAccountChangesResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
