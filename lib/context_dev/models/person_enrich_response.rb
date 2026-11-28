# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::People#enrich
    class PersonEnrichResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute match
      #   The best-matching person, with an identity-match score.
      #
      #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate, ContextDev::Models::PersonEnrichResponse::Match::NotFound]
      required :match, union: -> { ContextDev::Models::PersonEnrichResponse::Match }

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::PersonEnrichResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::PersonEnrichResponse::KeyMetadata }

      # @!attribute partial
      #   `true` when the `timeoutOpts` deadline ended processing early. The response
      #   holds the data completed so far; unfinished fields are omitted.
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!method initialize(match:, request_id:, key_metadata: nil, partial: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::PersonEnrichResponse} for more details.
      #
      #   @param match [ContextDev::Models::PersonEnrichResponse::Match::Candidate, ContextDev::Models::PersonEnrichResponse::Match::NotFound] The best-matching person, with an identity-match score.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param key_metadata [ContextDev::Models::PersonEnrichResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param partial [Boolean] `true` when the `timeoutOpts` deadline ended processing early. The response hold

      # The best-matching person, with an identity-match score.
      #
      # @see ContextDev::Models::PersonEnrichResponse#match
      module Match
        extend ContextDev::Internal::Type::Union

        discriminator :status

        # The best-matching person, with an identity-match score.
        variant :candidate, -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate }

        # No usable candidate was found.
        variant :not_found, -> { ContextDev::Models::PersonEnrichResponse::Match::NotFound }

        class Candidate < ContextDev::Internal::Type::BaseModel
          # @!attribute person
          #   Profile of the matched person.
          #
          #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person]
          required :person, -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person }

          # @!attribute score
          #   Identity-match score from 0 to 100. Higher is a stronger match; weak candidates
          #   are still returned.
          #
          #   @return [Integer]
          required :score, Integer

          # @!attribute status
          #   Always `candidate` for a match.
          #
          #   @return [Symbol, :candidate]
          required :status, const: :candidate

          # @!method initialize(person:, score:, status: :candidate)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::PersonEnrichResponse::Match::Candidate} for more details.
          #
          #   The best-matching person, with an identity-match score.
          #
          #   @param person [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person] Profile of the matched person.
          #
          #   @param score [Integer] Identity-match score from 0 to 100. Higher is a stronger match; weak candidates
          #
          #   @param status [Symbol, :candidate] Always `candidate` for a match.

          # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate#person
          class Person < ContextDev::Internal::Type::BaseModel
            # @!attribute current_role_status
            #   Whether the person's current role is known. `present` means `current_role` is
            #   filled in; `none` means the work history shows every role has ended; `unknown`
            #   means it could not be confirmed either way, so treat a missing `current_role` as
            #   unverified, not vacant.
            #
            #   @return [Symbol, ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus]
            required :current_role_status,
                     enum: -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus }

            # @!attribute education
            #   Education history.
            #
            #   @return [Array<ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education>]
            required :education,
                     -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education] }

            # @!attribute experience
            #   Work history. Each entry has the same fields as `current_role`.
            #
            #   @return [Array<ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience>]
            required :experience,
                     -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience] }

            # @!attribute skills
            #   Professional skills.
            #
            #   @return [Array<String>]
            required :skills, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute social_urls
            #   Public profile URLs for the person.
            #
            #   @return [Array<String>]
            required :social_urls, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute website_urls
            #   Other websites associated with the person.
            #
            #   @return [Array<String>]
            required :website_urls, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute avatar_url
            #   URL of the hosted profile picture. Omitted with zero data retention.
            #
            #   @return [String, nil]
            optional :avatar_url, String

            # @!attribute bio
            #   Short bio from the person's profile.
            #
            #   @return [String, nil]
            optional :bio, String

            # @!attribute checked_at
            #   When Context.dev last refreshed the profile from its sources, as an ISO 8601
            #   timestamp.
            #
            #   @return [String, nil]
            optional :checked_at, String

            # @!attribute current_role
            #   The person's current job. See `current_role_status` when it is missing.
            #
            #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole, nil]
            optional :current_role,
                     -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole }

            # @!attribute email
            #   Email address of the person.
            #
            #   @return [String, nil]
            optional :email, String

            # @!attribute last_updated
            #   When the profile data last changed at its sources, as an ISO 8601 timestamp.
            #   Omitted when unknown.
            #
            #   @return [String, nil]
            optional :last_updated, String

            # @!attribute location
            #   Where the person is based.
            #
            #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location, nil]
            optional :location, -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location }

            # @!attribute name
            #   Name of the person.
            #
            #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name, nil]
            optional :name, -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name }

            # @!method initialize(current_role_status:, education:, experience:, skills:, social_urls:, website_urls:, avatar_url: nil, bio: nil, checked_at: nil, current_role: nil, email: nil, last_updated: nil, location: nil, name: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person} for more
            #   details.
            #
            #   Profile of the matched person.
            #
            #   @param current_role_status [Symbol, ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus] Whether the person's current role is known. `present` means `current_role` is fi
            #
            #   @param education [Array<ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education>] Education history.
            #
            #   @param experience [Array<ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience>] Work history. Each entry has the same fields as `current_role`.
            #
            #   @param skills [Array<String>] Professional skills.
            #
            #   @param social_urls [Array<String>] Public profile URLs for the person.
            #
            #   @param website_urls [Array<String>] Other websites associated with the person.
            #
            #   @param avatar_url [String] URL of the hosted profile picture. Omitted with zero data retention.
            #
            #   @param bio [String] Short bio from the person's profile.
            #
            #   @param checked_at [String] When Context.dev last refreshed the profile from its sources, as an ISO 8601 tim
            #
            #   @param current_role [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole] The person's current job. See `current_role_status` when it is missing.
            #
            #   @param email [String] Email address of the person.
            #
            #   @param last_updated [String] When the profile data last changed at its sources, as an ISO 8601 timestamp. Omi
            #
            #   @param location [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location] Where the person is based.
            #
            #   @param name [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name] Name of the person.

            # Whether the person's current role is known. `present` means `current_role` is
            # filled in; `none` means the work history shows every role has ended; `unknown`
            # means it could not be confirmed either way, so treat a missing `current_role` as
            # unverified, not vacant.
            #
            # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person#current_role_status
            module CurrentRoleStatus
              extend ContextDev::Internal::Type::Enum

              PRESENT = :present
              NONE = :none
              UNKNOWN = :unknown

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            class Education < ContextDev::Internal::Type::BaseModel
              # @!attribute institution
              #   School or university.
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution]
              required :institution,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution }

              # @!attribute degree
              #   Degree or qualification.
              #
              #   @return [String, nil]
              optional :degree, String

              # @!attribute description
              #   Description of the studies.
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute end_date
              #   When the studies ended.
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate, nil]
              optional :end_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate }

              # @!attribute field_of_study
              #   Subject or major studied.
              #
              #   @return [String, nil]
              optional :field_of_study, String

              # @!attribute start_date
              #   When the studies started.
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate, nil]
              optional :start_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate }

              # @!method initialize(institution:, degree: nil, description: nil, end_date: nil, field_of_study: nil, start_date: nil)
              #   @param institution [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution] School or university.
              #
              #   @param degree [String] Degree or qualification.
              #
              #   @param description [String] Description of the studies.
              #
              #   @param end_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate] When the studies ended.
              #
              #   @param field_of_study [String] Subject or major studied.
              #
              #   @param start_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate] When the studies started.

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education#institution
              class Institution < ContextDev::Internal::Type::BaseModel
                # @!attribute name
                #   Name of the organization.
                #
                #   @return [String]
                required :name, String

                # @!attribute domain
                #   Website domain of the organization. Omitted when unknown.
                #
                #   @return [String, nil]
                optional :domain, String

                # @!method initialize(name:, domain: nil)
                #   School or university.
                #
                #   @param name [String] Name of the organization.
                #
                #   @param domain [String] Website domain of the organization. Omitted when unknown.
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education#end_date
              class EndDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #   Four-digit year.
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #   Day of the month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #   Month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   When the studies ended.
                #
                #   @param year [Integer] Four-digit year.
                #
                #   @param day [Integer] Day of the month. Omitted when unknown.
                #
                #   @param month [Integer] Month. Omitted when unknown.
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education#start_date
              class StartDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #   Four-digit year.
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #   Day of the month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #   Month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   When the studies started.
                #
                #   @param year [Integer] Four-digit year.
                #
                #   @param day [Integer] Day of the month. Omitted when unknown.
                #
                #   @param month [Integer] Month. Omitted when unknown.
              end
            end

            class Experience < ContextDev::Internal::Type::BaseModel
              # @!attribute organization
              #   Employer for this role.
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization]
              required :organization,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization }

              # @!attribute title
              #   Job title.
              #
              #   @return [String]
              required :title, String

              # @!attribute description
              #   Description of the role.
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute end_date
              #   When the role ended.
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate, nil]
              optional :end_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate }

              # @!attribute is_current
              #   Whether the person still holds this role.
              #
              #   @return [Boolean, nil]
              optional :is_current, ContextDev::Internal::Type::Boolean

              # @!attribute location
              #   Where the role is based.
              #
              #   @return [String, nil]
              optional :location, String

              # @!attribute start_date
              #   When the role started.
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate, nil]
              optional :start_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate }

              # @!method initialize(organization:, title:, description: nil, end_date: nil, is_current: nil, location: nil, start_date: nil)
              #   @param organization [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization] Employer for this role.
              #
              #   @param title [String] Job title.
              #
              #   @param description [String] Description of the role.
              #
              #   @param end_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate] When the role ended.
              #
              #   @param is_current [Boolean] Whether the person still holds this role.
              #
              #   @param location [String] Where the role is based.
              #
              #   @param start_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate] When the role started.

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience#organization
              class Organization < ContextDev::Internal::Type::BaseModel
                # @!attribute name
                #   Name of the organization.
                #
                #   @return [String]
                required :name, String

                # @!attribute domain
                #   Website domain of the organization. Omitted when unknown.
                #
                #   @return [String, nil]
                optional :domain, String

                # @!method initialize(name:, domain: nil)
                #   Employer for this role.
                #
                #   @param name [String] Name of the organization.
                #
                #   @param domain [String] Website domain of the organization. Omitted when unknown.
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience#end_date
              class EndDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #   Four-digit year.
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #   Day of the month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #   Month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   When the role ended.
                #
                #   @param year [Integer] Four-digit year.
                #
                #   @param day [Integer] Day of the month. Omitted when unknown.
                #
                #   @param month [Integer] Month. Omitted when unknown.
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience#start_date
              class StartDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #   Four-digit year.
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #   Day of the month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #   Month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   When the role started.
                #
                #   @param year [Integer] Four-digit year.
                #
                #   @param day [Integer] Day of the month. Omitted when unknown.
                #
                #   @param month [Integer] Month. Omitted when unknown.
              end
            end

            # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person#current_role
            class CurrentRole < ContextDev::Internal::Type::BaseModel
              # @!attribute organization
              #   Employer for this role.
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization]
              required :organization,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization }

              # @!attribute title
              #   Job title.
              #
              #   @return [String]
              required :title, String

              # @!attribute description
              #   Description of the role.
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute end_date
              #   When the role ended.
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate, nil]
              optional :end_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate }

              # @!attribute is_current
              #   Whether the person still holds this role.
              #
              #   @return [Boolean, nil]
              optional :is_current, ContextDev::Internal::Type::Boolean

              # @!attribute location
              #   Where the role is based.
              #
              #   @return [String, nil]
              optional :location, String

              # @!attribute start_date
              #   When the role started.
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate, nil]
              optional :start_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate }

              # @!method initialize(organization:, title:, description: nil, end_date: nil, is_current: nil, location: nil, start_date: nil)
              #   The person's current job. See `current_role_status` when it is missing.
              #
              #   @param organization [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization] Employer for this role.
              #
              #   @param title [String] Job title.
              #
              #   @param description [String] Description of the role.
              #
              #   @param end_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate] When the role ended.
              #
              #   @param is_current [Boolean] Whether the person still holds this role.
              #
              #   @param location [String] Where the role is based.
              #
              #   @param start_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate] When the role started.

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole#organization
              class Organization < ContextDev::Internal::Type::BaseModel
                # @!attribute name
                #   Name of the organization.
                #
                #   @return [String]
                required :name, String

                # @!attribute domain
                #   Website domain of the organization. Omitted when unknown.
                #
                #   @return [String, nil]
                optional :domain, String

                # @!method initialize(name:, domain: nil)
                #   Employer for this role.
                #
                #   @param name [String] Name of the organization.
                #
                #   @param domain [String] Website domain of the organization. Omitted when unknown.
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole#end_date
              class EndDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #   Four-digit year.
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #   Day of the month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #   Month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   When the role ended.
                #
                #   @param year [Integer] Four-digit year.
                #
                #   @param day [Integer] Day of the month. Omitted when unknown.
                #
                #   @param month [Integer] Month. Omitted when unknown.
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole#start_date
              class StartDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #   Four-digit year.
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #   Day of the month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #   Month. Omitted when unknown.
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   When the role started.
                #
                #   @param year [Integer] Four-digit year.
                #
                #   @param day [Integer] Day of the month. Omitted when unknown.
                #
                #   @param month [Integer] Month. Omitted when unknown.
              end
            end

            # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person#location
            class Location < ContextDev::Internal::Type::BaseModel
              # @!attribute city
              #   City.
              #
              #   @return [String, nil]
              optional :city, String

              # @!attribute country
              #   Country name.
              #
              #   @return [String, nil]
              optional :country, String

              # @!attribute country_code
              #   ISO 3166-1 alpha-2 country code.
              #
              #   @return [String, nil]
              optional :country_code, String

              # @!attribute display_
              #   Location as a single display string.
              #
              #   @return [String, nil]
              optional :display_, String, api_name: :display

              # @!attribute region
              #   State, province, or region.
              #
              #   @return [String, nil]
              optional :region, String

              # @!method initialize(city: nil, country: nil, country_code: nil, display_: nil, region: nil)
              #   Where the person is based.
              #
              #   @param city [String] City.
              #
              #   @param country [String] Country name.
              #
              #   @param country_code [String] ISO 3166-1 alpha-2 country code.
              #
              #   @param display_ [String] Location as a single display string.
              #
              #   @param region [String] State, province, or region.
            end

            # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person#name
            class Name < ContextDev::Internal::Type::BaseModel
              # @!attribute first
              #   First or given name.
              #
              #   @return [String, nil]
              optional :first, String

              # @!attribute full
              #   Full name.
              #
              #   @return [String, nil]
              optional :full, String

              # @!attribute last
              #   Last or family name.
              #
              #   @return [String, nil]
              optional :last, String

              # @!method initialize(first: nil, full: nil, last: nil)
              #   Name of the person.
              #
              #   @param first [String] First or given name.
              #
              #   @param full [String] Full name.
              #
              #   @param last [String] Last or family name.
            end
          end
        end

        class NotFound < ContextDev::Internal::Type::BaseModel
          # @!attribute person
          #   Always `null`.
          #
          #   @return [nil]
          required :person, NilClass

          # @!attribute score
          #   Always `null`.
          #
          #   @return [nil]
          required :score, NilClass

          # @!attribute status
          #   Always `not_found` when no candidate exists.
          #
          #   @return [Symbol, :not_found]
          required :status, const: :not_found

          # @!method initialize(person:, score:, status: :not_found)
          #   No usable candidate was found.
          #
          #   @param person [nil] Always `null`.
          #
          #   @param score [nil] Always `null`.
          #
          #   @param status [Symbol, :not_found] Always `not_found` when no candidate exists.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::PersonEnrichResponse::Match::Candidate, ContextDev::Models::PersonEnrichResponse::Match::NotFound)]
      end

      # @see ContextDev::Models::PersonEnrichResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end
    end
  end
end
