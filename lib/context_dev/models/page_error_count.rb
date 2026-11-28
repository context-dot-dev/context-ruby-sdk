# frozen_string_literal: true

module ContextDev
  module Models
    class PageErrorCount < ContextDev::Internal::Type::BaseModel
      # @!attribute code
      #   Error code for these failures.
      #
      #   @return [String]
      required :code, String

      # @!attribute count
      #   Number of pages that failed with this code.
      #
      #   @return [Integer]
      required :count, Integer

      # @!method initialize(code:, count:)
      #   Page failures sharing one error code.
      #
      #   @param code [String] Error code for these failures.
      #
      #   @param count [Integer] Number of pages that failed with this code.
    end
  end
end
