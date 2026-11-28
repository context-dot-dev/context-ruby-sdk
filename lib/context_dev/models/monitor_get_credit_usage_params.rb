# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Monitors#get_credit_usage
    class MonitorGetCreditUsageParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute since
      #   Count only runs created at or after this time.
      #
      #   @return [Time, nil]
      optional :since, Time

      # @!attribute tag
      #   Return usage only for monitors that currently have this tag. Deleted monitors
      #   are excluded.
      #
      #   @return [String, nil]
      optional :tag, String

      # @!attribute until_
      #   Count only runs created at or before this time.
      #
      #   @return [Time, nil]
      optional :until_, Time

      # @!method initialize(since: nil, tag: nil, until_: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::MonitorGetCreditUsageParams} for more details.
      #
      #   @param since [Time] Count only runs created at or after this time.
      #
      #   @param tag [String] Return usage only for monitors that currently have this tag. Deleted monitors ar
      #
      #   @param until_ [Time] Count only runs created at or before this time.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
