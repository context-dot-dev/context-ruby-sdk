# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#list_changes
    class MonitorListChangesResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Array<ContextDev::Models::MonitorListChangesResponse::Data>]
      required :data,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::MonitorListChangesResponse::Data] }

      # @!attribute has_more
      #
      #   @return [Boolean]
      required :has_more, ContextDev::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String, nil]
      required :next_cursor, String, nil?: true

      # @!method initialize(data:, has_more:, next_cursor:)
      #   @param data [Array<ContextDev::Models::MonitorListChangesResponse::Data>]
      #   @param has_more [Boolean]
      #   @param next_cursor [String, nil]

      class Data < ContextDev::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute change_detection_type
        #
        #   @return [Symbol, ContextDev::Models::MonitorListChangesResponse::Data::ChangeDetectionType]
        required :change_detection_type,
                 enum: -> { ContextDev::Models::MonitorListChangesResponse::Data::ChangeDetectionType }

        # @!attribute detected_at
        #
        #   @return [Time]
        required :detected_at, Time

        # @!attribute mode
        #   Top-level monitor category. Always `web` today; the concrete behavior is
        #   described by `target` and `change_detection`.
        #
        #   @return [Symbol, ContextDev::Models::MonitorListChangesResponse::Data::Mode]
        required :mode, enum: -> { ContextDev::Models::MonitorListChangesResponse::Data::Mode }

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
        #   @return [Symbol, ContextDev::Models::MonitorListChangesResponse::Data::TargetType]
        required :target_type, enum: -> { ContextDev::Models::MonitorListChangesResponse::Data::TargetType }

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

        # @!attribute confidence
        #
        #   @return [Float, nil]
        optional :confidence, Float

        # @!attribute importance
        #
        #   @return [Symbol, ContextDev::Models::MonitorListChangesResponse::Data::Importance, nil]
        optional :importance, enum: -> { ContextDev::Models::MonitorListChangesResponse::Data::Importance }

        # @!attribute matched_url_count
        #
        #   @return [Integer, nil]
        optional :matched_url_count, Integer

        # @!attribute removed_url_count
        #
        #   @return [Integer, nil]
        optional :removed_url_count, Integer

        # @!attribute tags
        #   User-defined tags for grouping and filtering monitors and their changes.
        #   Duplicates are removed.
        #
        #   @return [Array<String>, nil]
        optional :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(id:, change_detection_type:, detected_at:, mode:, monitor_id:, summary:, target_type:, title:, url:, added_url_count: nil, confidence: nil, importance: nil, matched_url_count: nil, removed_url_count: nil, tags: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::MonitorListChangesResponse::Data} for more details.
        #
        #   A lightweight change summary. `mode` is the constant `web`; `target_type` and
        #   `change_detection_type` describe the change, and which optional fields are
        #   present depends on them (e.g. sitemap changes include
        #   `added_url_count`/`removed_url_count`; semantic changes include
        #   `confidence`/`importance`).
        #
        #   @param id [String]
        #
        #   @param change_detection_type [Symbol, ContextDev::Models::MonitorListChangesResponse::Data::ChangeDetectionType]
        #
        #   @param detected_at [Time]
        #
        #   @param mode [Symbol, ContextDev::Models::MonitorListChangesResponse::Data::Mode] Top-level monitor category. Always `web` today; the concrete behavior is describ
        #
        #   @param monitor_id [String]
        #
        #   @param summary [String]
        #
        #   @param target_type [Symbol, ContextDev::Models::MonitorListChangesResponse::Data::TargetType]
        #
        #   @param title [String]
        #
        #   @param url [String]
        #
        #   @param added_url_count [Integer]
        #
        #   @param confidence [Float]
        #
        #   @param importance [Symbol, ContextDev::Models::MonitorListChangesResponse::Data::Importance]
        #
        #   @param matched_url_count [Integer]
        #
        #   @param removed_url_count [Integer]
        #
        #   @param tags [Array<String>] User-defined tags for grouping and filtering monitors and their changes. Duplica

        # @see ContextDev::Models::MonitorListChangesResponse::Data#change_detection_type
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
        # @see ContextDev::Models::MonitorListChangesResponse::Data#mode
        module Mode
          extend ContextDev::Internal::Type::Enum

          WEB = :web

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorListChangesResponse::Data#target_type
        module TargetType
          extend ContextDev::Internal::Type::Enum

          PAGE = :page
          SITEMAP = :sitemap
          EXTRACT = :extract

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::MonitorListChangesResponse::Data#importance
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
end
