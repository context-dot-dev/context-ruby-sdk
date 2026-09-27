# frozen_string_literal: true

module ContextDev
  module Models
    class Intake < ContextDev::Internal::Type::BaseModel
      # @!attribute duplicates
      #   URLs dropped before reserving because another entry resolved to the same page.
      #   Non-zero for sitemap crawls too, whose sitemaps routinely list a page more than
      #   once.
      #
      #   @return [Integer]
      required :duplicates, Integer

      # @!attribute invalid
      #   Rejected input URLs; `null` for a crawl.
      #
      #   @return [Integer, nil]
      required :invalid, Integer, nil?: true

      # @!attribute reserved
      #   Pages accepted; progress counts toward this total.
      #
      #   @return [Integer]
      required :reserved, Integer

      # @!attribute reserved_is_ceiling
      #   True when `reserved` is a crawl ceiling; false when it is an exact URL count.
      #
      #   @return [Boolean]
      required :reserved_is_ceiling, ContextDev::Internal::Type::Boolean

      # @!attribute submitted
      #   URLs in the list you sent, before validation and de-duplication. Null for a
      #   crawl, which is given a source rather than a list.
      #
      #   @return [Integer, nil]
      required :submitted, Integer, nil?: true

      # @!method initialize(duplicates:, invalid:, reserved:, reserved_is_ceiling:, submitted:)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::Intake} for more details.
      #
      #   What the submission accepted.
      #
      #   @param duplicates [Integer] URLs dropped before reserving because another entry resolved to the same page. N
      #
      #   @param invalid [Integer, nil] Rejected input URLs; `null` for a crawl.
      #
      #   @param reserved [Integer] Pages accepted; progress counts toward this total.
      #
      #   @param reserved_is_ceiling [Boolean] True when `reserved` is a crawl ceiling; false when it is an exact URL count.
      #
      #   @param submitted [Integer, nil] URLs in the list you sent, before validation and de-duplication. Null for a craw
    end
  end
end
