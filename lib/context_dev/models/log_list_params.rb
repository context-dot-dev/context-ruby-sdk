# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Logs#list
    class LogListParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute error_code
      #   Filter by the `error_code` returned in the response.
      #
      #   @return [String, nil]
      optional :error_code, String

      # @!attribute errors_only
      #   Only include requests that returned a 4xx or 5xx status.
      #
      #   @return [Boolean, nil]
      optional :errors_only, ContextDev::Internal::Type::Boolean

      # @!attribute from
      #   Only include requests at or after this ISO 8601 timestamp. Defaults to 24 hours
      #   before `to`.
      #
      #   @return [Time, nil]
      optional :from, Time

      # @!attribute key_id
      #   Filter by the API key that made the request.
      #
      #   @return [String, nil]
      optional :key_id, String

      # @!attribute limit
      #   Number of log entries per page.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute page
      #   Page number, starting at 1.
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute path
      #   Filter by endpoint path, with or without the /v1 prefix.
      #
      #   @return [String, nil]
      optional :path, String

      # @!attribute search
      #   Case-insensitive substring match against the request query and body, e.g. a
      #   domain.
      #
      #   @return [String, nil]
      optional :search, String

      # @!attribute status_code
      #   Filter by exact HTTP status code.
      #
      #   @return [Integer, nil]
      optional :status_code, Integer

      # @!attribute tags
      #   Comma-separated request tags. Matches requests carrying any of them. Up to 20
      #   tags, each 1-50 characters.
      #
      #   @return [String, nil]
      optional :tags, String

      # @!attribute to
      #   Only include requests at or before this ISO 8601 timestamp. Defaults to now.
      #
      #   @return [Time, nil]
      optional :to, Time

      # @!method initialize(error_code: nil, errors_only: nil, from: nil, key_id: nil, limit: nil, page: nil, path: nil, search: nil, status_code: nil, tags: nil, to: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::LogListParams} for more details.
      #
      #   @param error_code [String] Filter by the `error_code` returned in the response.
      #
      #   @param errors_only [Boolean] Only include requests that returned a 4xx or 5xx status.
      #
      #   @param from [Time] Only include requests at or after this ISO 8601 timestamp. Defaults to 24 hours
      #
      #   @param key_id [String] Filter by the API key that made the request.
      #
      #   @param limit [Integer] Number of log entries per page.
      #
      #   @param page [Integer] Page number, starting at 1.
      #
      #   @param path [String] Filter by endpoint path, with or without the /v1 prefix.
      #
      #   @param search [String] Case-insensitive substring match against the request query and body, e.g. a doma
      #
      #   @param status_code [Integer] Filter by exact HTTP status code.
      #
      #   @param tags [String] Comma-separated request tags. Matches requests carrying any of them. Up to 20 ta
      #
      #   @param to [Time] Only include requests at or before this ISO 8601 timestamp. Defaults to now.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
