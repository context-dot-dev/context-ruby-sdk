# frozen_string_literal: true

module ContextDev
  module Models
    module Browser
      # @see ContextDev::Resources::Browser::Profiles#list
      class ProfileListParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        # @!attribute cursor
        #   Cursor from the previous page's `next_cursor`. Omit for the first page.
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute limit
        #   Maximum number of profiles to return per page.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!method initialize(cursor: nil, limit: nil, request_options: {})
        #   @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
        #
        #   @param limit [Integer] Maximum number of profiles to return per page.
        #
        #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
