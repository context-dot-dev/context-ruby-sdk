# frozen_string_literal: true

module ContextDev
  module Models
    class Failure < ContextDev::Internal::Type::BaseModel
      # @!attribute code
      #   Machine-readable failure code, such as `stalled` or `USAGE_EXCEEDED`.
      #
      #   @return [String]
      required :code, String

      # @!attribute message
      #   Human-readable explanation of the failure.
      #
      #   @return [String]
      required :message, String

      # @!method initialize(code:, message:)
      #   Why the batch as a whole failed. Individual page failures are counted in
      #   `page_errors`.
      #
      #   @param code [String] Machine-readable failure code, such as `stalled` or `USAGE_EXCEEDED`.
      #
      #   @param message [String] Human-readable explanation of the failure.
    end
  end
end
