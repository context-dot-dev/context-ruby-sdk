# frozen_string_literal: true

module ContextDev
  module Models
    class Intake < ContextDev::Internal::Type::BaseModel
      # @!attribute duplicates
      #   URLs dropped because another entry resolved to the same page. Sitemap crawls
      #   report duplicates too, since sitemaps often list a page more than once.
      #
      #   @return [Integer]
      required :duplicates, Integer

      # @!attribute invalid
      #   URLs rejected as invalid. `null` for a crawl.
      #
      #   @return [Integer, nil]
      required :invalid, Integer, nil?: true

      # @!attribute reserved
      #   Pages accepted for scraping. `progress` counts toward this total.
      #
      #   @return [Integer]
      required :reserved, Integer

      # @!attribute reserved_is_ceiling
      #   `true` when `reserved` is a crawl ceiling, `false` when it is an exact URL
      #   count.
      #
      #   @return [Boolean]
      required :reserved_is_ceiling, ContextDev::Internal::Type::Boolean

      # @!attribute submitted
      #   URLs in your list before validation and de-duplication. `null` for a crawl.
      #
      #   @return [Integer, nil]
      required :submitted, Integer, nil?: true

      # @!method initialize(duplicates:, invalid:, reserved:, reserved_is_ceiling:, submitted:)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::Intake} for more details.
      #
      #   Page counts from your submission.
      #
      #   @param duplicates [Integer] URLs dropped because another entry resolved to the same page. Sitemap crawls rep
      #
      #   @param invalid [Integer, nil] URLs rejected as invalid. `null` for a crawl.
      #
      #   @param reserved [Integer] Pages accepted for scraping. `progress` counts toward this total.
      #
      #   @param reserved_is_ceiling [Boolean] `true` when `reserved` is a crawl ceiling, `false` when it is an exact URL count
      #
      #   @param submitted [Integer, nil] URLs in your list before validation and de-duplication. `null` for a crawl.
    end
  end
end
