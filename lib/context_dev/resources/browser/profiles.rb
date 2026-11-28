# frozen_string_literal: true

module ContextDev
  module Resources
    class Browser
      # List the authenticated browser profiles your organization created.
      class Profiles
        # List the browser profiles your organization saved through `POST /web/scrape`,
        # newest first. Pass a profile `id` as `sharedParams.profile.profileId` to scrape
        # as that signed-in user.
        #
        # @overload list(cursor: nil, limit: nil, request_options: {})
        #
        # @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
        #
        # @param limit [Integer] Maximum number of profiles to return per page.
        #
        # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [ContextDev::Models::Browser::ProfileListResponse]
        #
        # @see ContextDev::Models::Browser::ProfileListParams
        def list(params = {})
          parsed, options = ContextDev::Browser::ProfileListParams.dump_request(params)
          query = ContextDev::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "org/browser/profiles",
            query: query,
            model: ContextDev::Models::Browser::ProfileListResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [ContextDev::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
