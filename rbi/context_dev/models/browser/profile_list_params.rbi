# typed: strong

module ContextDev
  module Models
    module Browser
      class ProfileListParams < ContextDev::Internal::Type::BaseModel
        extend ContextDev::Internal::Type::RequestParameters::Converter
        include ContextDev::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Browser::ProfileListParams,
              ContextDev::Internal::AnyHash
            )
          end

        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Maximum number of profiles to return per page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig do
          params(
            cursor: String,
            limit: Integer,
            request_options: ContextDev::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Cursor from the previous page's `next_cursor`. Omit for the first page.
          cursor: nil,
          # Maximum number of profiles to return per page.
          limit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              cursor: String,
              limit: Integer,
              request_options: ContextDev::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
