# typed: strong

module ContextDev
  module Models
    module Browser
      class ProfileListResponse < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::Browser::ProfileListResponse,
              ContextDev::Internal::AnyHash
            )
          end

        # Browser profiles on this page, newest first.
        sig do
          returns(
            T::Array[ContextDev::Models::Browser::ProfileListResponse::Data]
          )
        end
        attr_accessor :data

        # Whether more results are available after this page.
        sig { returns(T::Boolean) }
        attr_accessor :has_more

        # Pass as `cursor` to fetch the next page. `null` on the last page.
        sig { returns(T.nilable(String)) }
        attr_accessor :next_cursor

        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        sig { returns(String) }
        attr_accessor :request_id

        # Credits this request used and your remaining balance.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::Browser::ProfileListResponse::KeyMetadata
            )
          )
        end
        attr_reader :key_metadata

        sig do
          params(
            key_metadata:
              ContextDev::Models::Browser::ProfileListResponse::KeyMetadata::OrHash
          ).void
        end
        attr_writer :key_metadata

        sig do
          params(
            data:
              T::Array[
                ContextDev::Models::Browser::ProfileListResponse::Data::OrHash
              ],
            has_more: T::Boolean,
            next_cursor: T.nilable(String),
            request_id: String,
            key_metadata:
              ContextDev::Models::Browser::ProfileListResponse::KeyMetadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Browser profiles on this page, newest first.
          data:,
          # Whether more results are available after this page.
          has_more:,
          # Pass as `cursor` to fetch the next page. `null` on the last page.
          next_cursor:,
          # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
          # support.
          request_id:,
          # Credits this request used and your remaining balance.
          key_metadata: nil
        )
        end

        sig do
          override.returns(
            {
              data:
                T::Array[
                  ContextDev::Models::Browser::ProfileListResponse::Data
                ],
              has_more: T::Boolean,
              next_cursor: T.nilable(String),
              request_id: String,
              key_metadata:
                ContextDev::Models::Browser::ProfileListResponse::KeyMetadata
            }
          )
        end
        def to_hash
        end

        class Data < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::Browser::ProfileListResponse::Data,
                ContextDev::Internal::AnyHash
              )
            end

          # Unique ID of the browser profile. Pass it as `sharedParams.profile.profileId` on
          # `POST /web/scrape`.
          sig { returns(String) }
          attr_accessor :id

          # When the browser profile was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # Label set when the profile was created. `null` when none was set.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          sig do
            params(
              id: String,
              created_at: Time,
              description: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique ID of the browser profile. Pass it as `sharedParams.profile.profileId` on
            # `POST /web/scrape`.
            id:,
            # When the browser profile was created.
            created_at:,
            # Label set when the profile was created. `null` when none was set.
            description:
          )
          end

          sig do
            override.returns(
              { id: String, created_at: Time, description: T.nilable(String) }
            )
          end
          def to_hash
          end
        end

        class KeyMetadata < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::Browser::ProfileListResponse::KeyMetadata,
                ContextDev::Internal::AnyHash
              )
            end

          # Credits charged for this request.
          sig { returns(Integer) }
          attr_accessor :credits_consumed

          # Credits your organization has left after this request.
          sig { returns(Integer) }
          attr_accessor :credits_remaining

          # Credits this request used and your remaining balance.
          sig do
            params(
              credits_consumed: Integer,
              credits_remaining: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Credits charged for this request.
            credits_consumed:,
            # Credits your organization has left after this request.
            credits_remaining:
          )
          end

          sig do
            override.returns(
              { credits_consumed: Integer, credits_remaining: Integer }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
