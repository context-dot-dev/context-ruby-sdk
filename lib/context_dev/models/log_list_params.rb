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
      #   Return only requests that failed with a 4xx or 5xx status.
      #
      #   @return [Boolean, nil]
      optional :errors_only, ContextDev::Internal::Type::Boolean

      # @!attribute from
      #   Return requests at or after this time. Defaults to 24 hours before `to`.
      #
      #   @return [Time, nil]
      optional :from, Time

      # @!attribute key_id
      #   Filter by the ID of the API key that made the request.
      #
      #   @return [String, nil]
      optional :key_id, String

      # @!attribute limit
      #   Maximum number of log entries to return per page.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute page
      #   Page number, starting at 1.
      #
      #   @return [Integer, nil]
      optional :page, Integer

      # @!attribute path
      #   Filter by endpoint path, with or without the `/v1` prefix.
      #
      #   @return [String, nil]
      optional :path, String

      # @!attribute search
      #   Case-insensitive text to find in the request query or body, such as a domain.
      #
      #   @return [String, nil]
      optional :search, String

      # @!attribute status_code
      #   Filter by exact HTTP status code.
      #
      #   @return [Integer, nil]
      optional :status_code, Integer

      # @!attribute tags
      #   Comma-separated tags. Returns log entries that have any of them. Up to 20 tags
      #   of 1 to 50 characters each.
      #
      #   @return [String, nil]
      optional :tags, String

      # @!attribute to
      #   Return requests at or before this time. Defaults to now.
      #
      #   @return [Time, nil]
      optional :to, Time

      # @!method initialize(error_code: nil, errors_only: nil, from: nil, key_id: nil, limit: nil, page: nil, path: nil, search: nil, status_code: nil, tags: nil, to: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::LogListParams} for more details.
      #
      #   @param error_code [String] Filter by the `error_code` returned in the response.
      #
      #   @param errors_only [Boolean] Return only requests that failed with a 4xx or 5xx status.
      #
      #   @param from [Time] Return requests at or after this time. Defaults to 24 hours before `to`.
      #
      #   @param key_id [String] Filter by the ID of the API key that made the request.
      #
      #   @param limit [Integer] Maximum number of log entries to return per page.
      #
      #   @param page [Integer] Page number, starting at 1.
      #
      #   @param path [String] Filter by endpoint path, with or without the `/v1` prefix.
      #
      #   @param search [String] Case-insensitive text to find in the request query or body, such as a domain.
      #
      #   @param status_code [Integer] Filter by exact HTTP status code.
      #
      #   @param tags [String] Comma-separated tags. Returns log entries that have any of them. Up to 20 tags o
      #
      #   @param to [Time] Return requests at or before this time. Defaults to now.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
