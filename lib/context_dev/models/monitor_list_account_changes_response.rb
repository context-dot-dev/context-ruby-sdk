# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_account_changes
    class MonitorListAccountChangesResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #   Changes on this page.
      #
      #   @return [Array<ContextDev::Models::MonitorListAccountChangesResponse::Data>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListAccountChangesResponse::Data] }

      # @!attribute has_more
      #   Whether more results are available after this page.
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Pass as `cursor` to fetch the next page. `null` on the last page.
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
      #   @param data [Array<ContextDev::Models::MonitorListAccountChangesResponse::Data>] Changes on this page.
      #
      #   @param has_more [Boolean] Whether more results are available after this page.
      #
      #   @param next_cursor [String, nil] Pass as `cursor` to fetch the next page. `null` on the last page.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata] Credits this request used and your remaining balance.

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #   Unique ID of the change.
        #
        #   @return [String]
        required :id, String

        # @!attribute change_detection_type
        #   Change detection type the monitor uses.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType]
        required :change_detection_type,
                 enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType }

        # @!attribute detected_at
        #   When the change was detected.
        #
        #   @return [Time]
        required :detected_at, Time

        # @!attribute mode
        #   Monitor category. Always `web`.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode]
        required :mode, enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode }

        # @!attribute monitor_id
        #   ID of the monitor that detected the change.
        #
        #   @return [String]
        required :monitor_id, String

        # @!attribute run_id
        #   ID of the run that detected the change.
        #
        #   @return [String]
        required :run_id, String

        # @!attribute summary
        #   Plain-language summary of what changed.
        #
        #   @return [String]
        required :summary, String

        # @!attribute tags
        #   Tags the monitor had when the change was detected.
        #
        #   @return [Array<String>]
        required :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute target_type
        #   Type of target the monitor watches.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType]
        required :target_type,
                 enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType }

        # @!attribute title
        #   Short headline for the change.
        #
        #   @return [String]
        required :title, String

        # @!attribute url
        #   Monitored URL. For search targets, the first new result.
        #
        #   @return [String]
        required :url, String

        # @!attribute added_url_count
        #   Total number of URLs added.
        #
        #   @return [Integer, nil]
        optional :added_url_count, Integer

        # @!attribute added_urls
        #   URLs added to the sitemap, up to 500. `added_url_count` has the full count.
        #
        #   @return [Array<String>, nil]
        optional :added_urls, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute after_text_excerpt
        #   Excerpt of the page text after the change. Page targets only.
        #
        #   @return [String, nil]
        optional :after_text_excerpt, String

        # @!attribute before_text_excerpt
        #   Excerpt of the page text before the change. Page targets only.
        #
        #   @return [String, nil]
        optional :before_text_excerpt, String

        # @!attribute confidence
        #   Confidence that the change matters, from 0 to 1. Set by `semantic` detection
        #   only.
        #
        #   @return [Float, nil]
        optional :confidence, Float

        # @!attribute diff
        #   Text diff of the change, for page and extract targets. Extract diffs have one
        #   section per changed page.
        #
        #   @return [String, nil]
        optional :diff, String

        # @!attribute evidence
        #   Before and after excerpts that support the change.
        #
        #   @return [Array<ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence>, nil]
        optional :evidence,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence] }

        # @!attribute importance
        #   How important the change is. Set by `semantic` detection only.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance, nil]
        optional :importance, enum: -> { ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance }

        # @!attribute matched_url_count
        #   Total number of matched URLs.
        #
        #   @return [Integer, nil]
        optional :matched_url_count, Integer

        # @!attribute matched_urls
        #   URLs where the change was found: the changed pages for page and extract targets,
        #   or the new results for search targets. Up to 500; `matched_url_count` has the
        #   full count.
        #
        #   @return [Array<String>, nil]
        optional :matched_urls, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute removed_url_count
        #   Total number of URLs removed.
        #
        #   @return [Integer, nil]
        optional :removed_url_count, Integer

        # @!attribute removed_urls
        #   URLs removed from the sitemap, or pages no longer found for extract targets, up
        #   to 500. `removed_url_count` has the full count.
        #
        #   @return [Array<String>, nil]
        optional :removed_urls, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, change_detection_type:, detected_at:, mode:, monitor_id:, run_id:, summary:, tags:, target_type:, title:, url:, added_url_count: nil, added_urls: nil, after_text_excerpt: nil, before_text_excerpt: nil, confidence: nil, diff: nil, evidence: nil, importance: nil, matched_url_count: nil, matched_urls: nil, removed_url_count: nil, removed_urls: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorListAccountChangesResponse::Data} for more details.
        #
        #   A change detected by a monitor run, with a summary and, depending on the target,
        #   a text diff, added or removed URLs, matched results, and evidence.
        #
        #   @param id [String] Unique ID of the change.
        #
        #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType] Change detection type the monitor uses.
        #
        #   @param detected_at [Time] When the change was detected.
        #
        #   @param mode [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode] Monitor category. Always `web`.
        #
        #   @param monitor_id [String] ID of the monitor that detected the change.
        #
        #   @param run_id [String] ID of the run that detected the change.
        #
        #   @param summary [String] Plain-language summary of what changed.
        #
        #   @param tags [Array<String>] Tags the monitor had when the change was detected.
        #
        #   @param target_type [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType] Type of target the monitor watches.
        #
        #   @param title [String] Short headline for the change.
        #
        #   @param url [String] Monitored URL. For search targets, the first new result.
        #
        #   @param added_url_count [Integer] Total number of URLs added.
        #
        #   @param added_urls [Array<String>] URLs added to the sitemap, up to 500. `added_url_count` has the full count.
        #
        #   @param after_text_excerpt [String] Excerpt of the page text after the change. Page targets only.
        #
        #   @param before_text_excerpt [String] Excerpt of the page text before the change. Page targets only.
        #
        #   @param confidence [Float] Confidence that the change matters, from 0 to 1. Set by `semantic` detection onl
        #
        #   @param diff [String] Text diff of the change, for page and extract targets. Extract diffs have one se
        #
        #   @param evidence [Array<ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence>] Before and after excerpts that support the change.
        #
        #   @param importance [Symbol, ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance] How important the change is. Set by `semantic` detection only.
        #
        #   @param matched_url_count [Integer] Total number of matched URLs.
        #
        #   @param matched_urls [Array<String>] URLs where the change was found: the changed pages for page and extract targets,
        #
        #   @param removed_url_count [Integer] Total number of URLs removed.
        #
        #   @param removed_urls [Array<String>] URLs removed from the sitemap, or pages no longer found for extract targets, up

        # Change detection type the monitor uses.
        #
        # @see ContextDev::Models::MonitorListAccountChangesResponse::Data#change_detection_type
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          EXACT = :exact
          SEMANTIC = :semantic

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Monitor category. Always `web`.
        #
        # @see ContextDev::Models::MonitorListAccountChangesResponse::Data#mode
        module Mode
          extend ContextDev::Internal::Type::Enum

          WEB = :web

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Type of target the monitor watches.
        #
        # @see ContextDev::Models::MonitorListAccountChangesResponse::Data#target_type
        module TargetType
          extend ContextDev::Internal::Type::Enum

          PAGE = :page
          SITEMAP = :sitemap
          EXTRACT = :extract
          SEARCH = :search

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Evidence < ContextDev::Internal::Type::BaseModel
          # @!attribute after
          #   Content after the change.
          #
          #   @return [String]
          required :after, String

          # @!attribute before
          #   Content before the change. Empty for new search results.
          #
          #   @return [String]
          required :before, String

          # @!attribute url
          #   Page the evidence comes from. Omitted when the evidence covers the whole target.
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(after:, before:, url: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence} for more
          #   details.
          #
          #   Before and after excerpts that support a change.
          #
          #   @param after [String] Content after the change.
          #
          #   @param before [String] Content before the change. Empty for new search results.
          #
          #   @param url [String] Page the evidence comes from. Omitted when the evidence covers the whole target.
        end

        # How important the change is. Set by `semantic` detection only.
        #
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
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end
    end
  end
end
