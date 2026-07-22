# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#get_credit_usage
    class MonitorGetCreditUsageParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute since
      #   Only include items at or after this ISO 8601 timestamp.
      #
      #   @return [Time, nil]
      optional :since, Time

      # @!attribute until_
      #   Only include items before this ISO 8601 timestamp.
      #
      #   @return [Time, nil]
      optional :until_, Time

      # @!method initialize(since: nil, until_: nil, request_options: {})
      #   @param since [Time] Only include items at or after this ISO 8601 timestamp.
      #
      #   @param until_ [Time] Only include items before this ISO 8601 timestamp.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
