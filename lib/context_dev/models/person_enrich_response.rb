# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::People#enrich
    class PersonEnrichResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute match
      #   The highest-scoring person candidate.
      #
      #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate, ContextDev::Models::PersonEnrichResponse::Match::NotFound]
      required :match, union: -> { ContextDev::Models::PersonEnrichResponse::Match }

      # @!attribute request_id
      #   Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #   it when contacting support about a failed request.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::PersonEnrichResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::PersonEnrichResponse::KeyMetadata }

      # @!method initialize(match:, request_id:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::PersonEnrichResponse} for more details.
      #
      #   @param match [ContextDev::Models::PersonEnrichResponse::Match::Candidate, ContextDev::Models::PersonEnrichResponse::Match::NotFound] The highest-scoring person candidate.
      #
      #   @param request_id [String] Unique id of this API call, also sent in the X-Request-Id response header. Quote
      #
      #   @param key_metadata [ContextDev::Models::PersonEnrichResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

      # The highest-scoring person candidate.
      #
      # @see ContextDev::Models::PersonEnrichResponse#match
      module Match
        extend ContextDev::Internal::Type::Union

        discriminator :status

        # The highest-scoring person candidate.
        variant :candidate, -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate }

        # No usable person candidate was found.
        variant :not_found, -> { ContextDev::Models::PersonEnrichResponse::Match::NotFound }

        class Candidate < ContextDev::Internal::Type::BaseModel
          # @!attribute person
          #
          #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person]
          required :person, -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person }

          # @!attribute score
          #
          #   @return [Integer]
          required :score, Integer

          # @!attribute status
          #
          #   @return [Symbol, :candidate]
          required :status, const: :candidate

          # @!method initialize(person:, score:, status: :candidate)
          #   The highest-scoring person candidate.
          #
          #   @param person [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person]
          #   @param score [Integer]
          #   @param status [Symbol, :candidate]

          # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate#person
          class Person < ContextDev::Internal::Type::BaseModel
            # @!attribute current_role_status
            #   Whether the person's current role is known. `present` — current_role is
            #   populated. `none` — the work history explicitly shows every role has ended.
            #   `unknown` — our data sources could not confirm either way; treat a missing
            #   current_role as unverified rather than vacant.
            #
            #   @return [Symbol, ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus]
            required :current_role_status,
                     enum: -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus }

            # @!attribute education
            #
            #   @return [Array<ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education>]
            required :education,
                     -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education] }

            # @!attribute experience
            #
            #   @return [Array<ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience>]
            required :experience,
                     -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience] }

            # @!attribute skills
            #
            #   @return [Array<String>]
            required :skills, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute social_urls
            #
            #   @return [Array<String>]
            required :social_urls, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute website_urls
            #
            #   @return [Array<String>]
            required :website_urls, ContextDev::Internal::Type::ArrayOf[String]

            # @!attribute avatar_url
            #
            #   @return [String, nil]
            optional :avatar_url, String

            # @!attribute bio
            #
            #   @return [String, nil]
            optional :bio, String

            # @!attribute checked_at
            #   When we last refreshed this profile from our data sources (ISO 8601).
            #
            #   @return [String, nil]
            optional :checked_at, String

            # @!attribute current_role
            #
            #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole, nil]
            optional :current_role,
                     -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole }

            # @!attribute email
            #
            #   @return [String, nil]
            optional :email, String

            # @!attribute last_updated
            #   When the underlying profile data last changed in our data sources (ISO 8601).
            #   Omitted when unknown.
            #
            #   @return [String, nil]
            optional :last_updated, String

            # @!attribute location
            #
            #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location, nil]
            optional :location, -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location }

            # @!attribute name
            #
            #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name, nil]
            optional :name, -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name }

            # @!method initialize(current_role_status:, education:, experience:, skills:, social_urls:, website_urls:, avatar_url: nil, bio: nil, checked_at: nil, current_role: nil, email: nil, last_updated: nil, location: nil, name: nil)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person} for more
            #   details.
            #
            #   @param current_role_status [Symbol, ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus] Whether the person's current role is known. `present` — current_role is populate
            #
            #   @param education [Array<ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education>]
            #
            #   @param experience [Array<ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience>]
            #
            #   @param skills [Array<String>]
            #
            #   @param social_urls [Array<String>]
            #
            #   @param website_urls [Array<String>]
            #
            #   @param avatar_url [String]
            #
            #   @param bio [String]
            #
            #   @param checked_at [String] When we last refreshed this profile from our data sources (ISO 8601).
            #
            #   @param current_role [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole]
            #
            #   @param email [String]
            #
            #   @param last_updated [String] When the underlying profile data last changed in our data sources (ISO 8601). Om
            #
            #   @param location [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location]
            #
            #   @param name [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name]

            # Whether the person's current role is known. `present` — current_role is
            # populated. `none` — the work history explicitly shows every role has ended.
            # `unknown` — our data sources could not confirm either way; treat a missing
            # current_role as unverified rather than vacant.
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
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution]
              required :institution,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution }

              # @!attribute degree
              #
              #   @return [String, nil]
              optional :degree, String

              # @!attribute description
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute end_date
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate, nil]
              optional :end_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate }

              # @!attribute field_of_study
              #
              #   @return [String, nil]
              optional :field_of_study, String

              # @!attribute start_date
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate, nil]
              optional :start_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate }

              # @!method initialize(institution:, degree: nil, description: nil, end_date: nil, field_of_study: nil, start_date: nil)
              #   @param institution [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution]
              #   @param degree [String]
              #   @param description [String]
              #   @param end_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate]
              #   @param field_of_study [String]
              #   @param start_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate]

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education#institution
              class Institution < ContextDev::Internal::Type::BaseModel
                # @!attribute name
                #
                #   @return [String]
                required :name, String

                # @!attribute domain
                #
                #   @return [String, nil]
                optional :domain, String

                # @!method initialize(name:, domain: nil)
                #   @param name [String]
                #   @param domain [String]
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education#end_date
              class EndDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   @param year [Integer]
                #   @param day [Integer]
                #   @param month [Integer]
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education#start_date
              class StartDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   @param year [Integer]
                #   @param day [Integer]
                #   @param month [Integer]
              end
            end

            class Experience < ContextDev::Internal::Type::BaseModel
              # @!attribute organization
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization]
              required :organization,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization }

              # @!attribute title
              #
              #   @return [String]
              required :title, String

              # @!attribute description
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute end_date
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate, nil]
              optional :end_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate }

              # @!attribute is_current
              #
              #   @return [Boolean, nil]
              optional :is_current, ContextDev::Internal::Type::Boolean

              # @!attribute location
              #
              #   @return [String, nil]
              optional :location, String

              # @!attribute start_date
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate, nil]
              optional :start_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate }

              # @!method initialize(organization:, title:, description: nil, end_date: nil, is_current: nil, location: nil, start_date: nil)
              #   @param organization [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization]
              #   @param title [String]
              #   @param description [String]
              #   @param end_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate]
              #   @param is_current [Boolean]
              #   @param location [String]
              #   @param start_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate]

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience#organization
              class Organization < ContextDev::Internal::Type::BaseModel
                # @!attribute name
                #
                #   @return [String]
                required :name, String

                # @!attribute domain
                #
                #   @return [String, nil]
                optional :domain, String

                # @!method initialize(name:, domain: nil)
                #   @param name [String]
                #   @param domain [String]
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience#end_date
              class EndDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   @param year [Integer]
                #   @param day [Integer]
                #   @param month [Integer]
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience#start_date
              class StartDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   @param year [Integer]
                #   @param day [Integer]
                #   @param month [Integer]
              end
            end

            # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person#current_role
            class CurrentRole < ContextDev::Internal::Type::BaseModel
              # @!attribute organization
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization]
              required :organization,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization }

              # @!attribute title
              #
              #   @return [String]
              required :title, String

              # @!attribute description
              #
              #   @return [String, nil]
              optional :description, String

              # @!attribute end_date
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate, nil]
              optional :end_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate }

              # @!attribute is_current
              #
              #   @return [Boolean, nil]
              optional :is_current, ContextDev::Internal::Type::Boolean

              # @!attribute location
              #
              #   @return [String, nil]
              optional :location, String

              # @!attribute start_date
              #
              #   @return [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate, nil]
              optional :start_date,
                       -> { ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate }

              # @!method initialize(organization:, title:, description: nil, end_date: nil, is_current: nil, location: nil, start_date: nil)
              #   @param organization [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization]
              #   @param title [String]
              #   @param description [String]
              #   @param end_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate]
              #   @param is_current [Boolean]
              #   @param location [String]
              #   @param start_date [ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate]

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole#organization
              class Organization < ContextDev::Internal::Type::BaseModel
                # @!attribute name
                #
                #   @return [String]
                required :name, String

                # @!attribute domain
                #
                #   @return [String, nil]
                optional :domain, String

                # @!method initialize(name:, domain: nil)
                #   @param name [String]
                #   @param domain [String]
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole#end_date
              class EndDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   @param year [Integer]
                #   @param day [Integer]
                #   @param month [Integer]
              end

              # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole#start_date
              class StartDate < ContextDev::Internal::Type::BaseModel
                # @!attribute year
                #
                #   @return [Integer]
                required :year, Integer

                # @!attribute day
                #
                #   @return [Integer, nil]
                optional :day, Integer

                # @!attribute month
                #
                #   @return [Integer, nil]
                optional :month, Integer

                # @!method initialize(year:, day: nil, month: nil)
                #   @param year [Integer]
                #   @param day [Integer]
                #   @param month [Integer]
              end
            end

            # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person#location
            class Location < ContextDev::Internal::Type::BaseModel
              # @!attribute city
              #
              #   @return [String, nil]
              optional :city, String

              # @!attribute country
              #
              #   @return [String, nil]
              optional :country, String

              # @!attribute country_code
              #
              #   @return [String, nil]
              optional :country_code, String

              # @!attribute display_
              #
              #   @return [String, nil]
              optional :display_, String, api_name: :display

              # @!attribute region
              #
              #   @return [String, nil]
              optional :region, String

              # @!method initialize(city: nil, country: nil, country_code: nil, display_: nil, region: nil)
              #   @param city [String]
              #   @param country [String]
              #   @param country_code [String]
              #   @param display_ [String]
              #   @param region [String]
            end

            # @see ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person#name
            class Name < ContextDev::Internal::Type::BaseModel
              # @!attribute first
              #
              #   @return [String, nil]
              optional :first, String

              # @!attribute full
              #
              #   @return [String, nil]
              optional :full, String

              # @!attribute last
              #
              #   @return [String, nil]
              optional :last, String

              # @!method initialize(first: nil, full: nil, last: nil)
              #   @param first [String]
              #   @param full [String]
              #   @param last [String]
            end
          end
        end

        class NotFound < ContextDev::Internal::Type::BaseModel
          # @!attribute person
          #
          #   @return [nil]
          required :person, NilClass

          # @!attribute score
          #
          #   @return [nil]
          required :score, NilClass

          # @!attribute status
          #
          #   @return [Symbol, :not_found]
          required :status, const: :not_found

          # @!method initialize(person:, score:, status: :not_found)
          #   No usable person candidate was found.
          #
          #   @param person [nil]
          #   @param score [nil]
          #   @param status [Symbol, :not_found]
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::PersonEnrichResponse::Match::Candidate, ContextDev::Models::PersonEnrichResponse::Match::NotFound)]
      end

      # @see ContextDev::Models::PersonEnrichResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits used by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credit usage, included whenever a valid API key is provided.
        #
        #   @param credits_consumed [Integer] Credits used by this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
