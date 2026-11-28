# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::People#search
    class PersonSearchResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute results
      #   Up to 10 matching people, most relevant first.
      #
      #   @return [Array<ContextDev::Models::PersonSearchResponse::Result>]
      required :results,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::PersonSearchResponse::Result] }

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::PersonSearchResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::PersonSearchResponse::KeyMetadata }

      # @!attribute next_cursor
      #   Pass as `cursor` to fetch the next page. `null` on the last page.
      #
      #   @return [String, nil]
      optional :next_cursor, String, nil?: true

      # @!method initialize(request_id:, results:, key_metadata: nil, next_cursor: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::PersonSearchResponse} for more details.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param results [Array<ContextDev::Models::PersonSearchResponse::Result>] Up to 10 matching people, most relevant first.
      #
      #   @param key_metadata [ContextDev::Models::PersonSearchResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param next_cursor [String, nil] Pass as `cursor` to fetch the next page. `null` on the last page.

      class Result < ContextDev::Internal::Type::BaseModel
        # @!attribute description
        #   What the person does.
        #
        #   @return [String, nil]
        required :description, String, nil?: true

        # @!attribute is_founder
        #   Whether the person is currently a founder or co-founder. `null` when unknown.
        #
        #   @return [Boolean, nil]
        required :is_founder, ContextDev::Internal::Type::Boolean, nil?: true

        # @!attribute location
        #   Where the person lives.
        #
        #   @return [ContextDev::Models::PersonSearchResponse::Result::Location]
        required :location, -> { ContextDev::Models::PersonSearchResponse::Result::Location }

        # @!attribute name
        #   Full name.
        #
        #   @return [String, nil]
        required :name, String, nil?: true

        # @!attribute profiles
        #   Public professional profile URLs. Send one to `POST /people/enrich` as
        #   `social_urls` for the full profile.
        #
        #   @return [Array<String>]
        required :profiles, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute role
        #   The person's current role.
        #
        #   @return [ContextDev::Models::PersonSearchResponse::Result::Role]
        required :role, -> { ContextDev::Models::PersonSearchResponse::Result::Role }

        # @!attribute schools
        #   Schools attended.
        #
        #   @return [Array<String>]
        required :schools, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute skills
        #   Professional skills.
        #
        #   @return [Array<String>]
        required :skills, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute years_of_experience
        #   Years of professional experience. `null` when unknown.
        #
        #   @return [Integer, nil]
        required :years_of_experience, Integer, nil?: true

        # @!attribute match
        #   How well the person matches the query. Returned only in `ultra` mode.
        #
        #   @return [ContextDev::Models::PersonSearchResponse::Result::Match, nil]
        optional :match, -> { ContextDev::Models::PersonSearchResponse::Result::Match }

        # @!method initialize(description:, is_founder:, location:, name:, profiles:, role:, schools:, skills:, years_of_experience:, match: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::PersonSearchResponse::Result} for more details.
        #
        #   A person who matches your search. Unknown details are `null` or empty lists.
        #
        #   @param description [String, nil] What the person does.
        #
        #   @param is_founder [Boolean, nil] Whether the person is currently a founder or co-founder. `null` when unknown.
        #
        #   @param location [ContextDev::Models::PersonSearchResponse::Result::Location] Where the person lives.
        #
        #   @param name [String, nil] Full name.
        #
        #   @param profiles [Array<String>] Public professional profile URLs. Send one to `POST /people/enrich` as `social_u
        #
        #   @param role [ContextDev::Models::PersonSearchResponse::Result::Role] The person's current role.
        #
        #   @param schools [Array<String>] Schools attended.
        #
        #   @param skills [Array<String>] Professional skills.
        #
        #   @param years_of_experience [Integer, nil] Years of professional experience. `null` when unknown.
        #
        #   @param match [ContextDev::Models::PersonSearchResponse::Result::Match] How well the person matches the query. Returned only in `ultra` mode.

        # @see ContextDev::Models::PersonSearchResponse::Result#location
        class Location < ContextDev::Internal::Type::BaseModel
          # @!attribute city
          #   City.
          #
          #   @return [String, nil]
          required :city, String, nil?: true

          # @!attribute country_code
          #   ISO 3166-1 alpha-2 country code, such as `US`.
          #
          #   @return [String, nil]
          required :country_code, String, nil?: true

          # @!attribute region
          #   State or region.
          #
          #   @return [String, nil]
          required :region, String, nil?: true

          # @!method initialize(city:, country_code:, region:)
          #   Where the person lives.
          #
          #   @param city [String, nil] City.
          #
          #   @param country_code [String, nil] ISO 3166-1 alpha-2 country code, such as `US`.
          #
          #   @param region [String, nil] State or region.
        end

        # @see ContextDev::Models::PersonSearchResponse::Result#role
        class Role < ContextDev::Internal::Type::BaseModel
          # @!attribute company
          #   Current employer. `null` when unknown.
          #
          #   @return [ContextDev::Models::PersonSearchResponse::Result::Role::Company, nil]
          required :company, -> { ContextDev::Models::PersonSearchResponse::Result::Role::Company }, nil?: true

          # @!attribute functions
          #   Areas of responsibility, such as `sales`.
          #
          #   @return [Array<String>]
          required :functions, ContextDev::Internal::Type::ArrayOf[String]

          # @!attribute seniority
          #   Seniority level, such as `executive`.
          #
          #   @return [String, nil]
          required :seniority, String, nil?: true

          # @!attribute started_on
          #   When the role started, as `YYYY-MM-DD`.
          #
          #   @return [String, nil]
          required :started_on, String, nil?: true

          # @!attribute title
          #   Job title.
          #
          #   @return [String, nil]
          required :title, String, nil?: true

          # @!method initialize(company:, functions:, seniority:, started_on:, title:)
          #   The person's current role.
          #
          #   @param company [ContextDev::Models::PersonSearchResponse::Result::Role::Company, nil] Current employer. `null` when unknown.
          #
          #   @param functions [Array<String>] Areas of responsibility, such as `sales`.
          #
          #   @param seniority [String, nil] Seniority level, such as `executive`.
          #
          #   @param started_on [String, nil] When the role started, as `YYYY-MM-DD`.
          #
          #   @param title [String, nil] Job title.

          # @see ContextDev::Models::PersonSearchResponse::Result::Role#company
          class Company < ContextDev::Internal::Type::BaseModel
            # @!attribute domain
            #   Website domain of the company.
            #
            #   @return [String, nil]
            required :domain, String, nil?: true

            # @!attribute name
            #   Company name.
            #
            #   @return [String, nil]
            required :name, String, nil?: true

            # @!method initialize(domain:, name:)
            #   Current employer. `null` when unknown.
            #
            #   @param domain [String, nil] Website domain of the company.
            #
            #   @param name [String, nil] Company name.
          end
        end

        # @see ContextDev::Models::PersonSearchResponse::Result#match
        class Match < ContextDev::Internal::Type::BaseModel
          # @!attribute confidence
          #   How well the person matches the query, from 0 to 1.
          #
          #   @return [Float]
          required :confidence, Float

          # @!method initialize(confidence:)
          #   How well the person matches the query. Returned only in `ultra` mode.
          #
          #   @param confidence [Float] How well the person matches the query, from 0 to 1.
        end
      end

      # @see ContextDev::Models::PersonSearchResponse#key_metadata
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
