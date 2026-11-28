# typed: strong

module ContextDev
  module Resources
    class Browser
      # List the authenticated browser profiles your organization created.
      class Profiles
        # List the browser profiles your organization saved through `POST /web/scrape`,
        # newest first. Pass a profile `id` as `sharedParams.profile.profileId` to scrape
        # as that signed-in user.
        sig do
          params(
            cursor: String,
            limit: Integer,
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(ContextDev::Models::Browser::ProfileListResponse)
        end
        def list(
          # Cursor from the previous page's `next_cursor`. Omit for the first page.
          cursor: nil,
          # Maximum number of profiles to return per page.
          limit: nil,
          request_options: {}
        )
        end

        # @api private
        sig { params(client: ContextDev::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
