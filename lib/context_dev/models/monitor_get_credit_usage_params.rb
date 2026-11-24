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

      # @!attribute tag
      #   Only include monitors that currently have this tag. Deleted monitors are left
      #   out.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute until_
      #   Only include items before this ISO 8601 timestamp.
      #
      #   @return [Time, nil]
      optional :until_, Time

      # @!method initialize(since: nil, tag: nil, until_: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorGetCreditUsageParams} for more details.
      #
      #   @param since [Time] Only include items at or after this ISO 8601 timestamp.
      #
      #   @param tag [String] Only include monitors that currently have this tag. Deleted monitors are left ou
      #
      #   @param until_ [Time] Only include items before this ISO 8601 timestamp.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
