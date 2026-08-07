# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::People#enrich
    class PersonEnrichParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute company
      #
      #   @return [ContextDev::Models::PersonEnrichParams::Company, nil]
      optional :company, -> { ContextDev::PersonEnrichParams::Company }

      # @!attribute education
      #
      #   @return [Array<ContextDev::Models::PersonEnrichParams::Education>, nil]
      optional :education, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::PersonEnrichParams::Education] }

      # @!attribute email
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute location
      #
      #   @return [ContextDev::Models::PersonEnrichParams::Location, nil]
      optional :location, -> { ContextDev::PersonEnrichParams::Location }

      # @!attribute name
      #
      #   @return [ContextDev::Models::PersonEnrichParams::Name, nil]
      optional :name, -> { ContextDev::PersonEnrichParams::Name }

      # @!attribute social_urls
      #
      #   @return [Array<String>, nil]
      optional :social_urls, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute tags
      #   Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer, api_name: :timeoutMS

      # @!method initialize(company: nil, education: nil, email: nil, location: nil, name: nil, social_urls: nil, tags: nil, timeout_ms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::PersonEnrichParams} for more details.
      #
      #   @param company [ContextDev::Models::PersonEnrichParams::Company]
      #
      #   @param education [Array<ContextDev::Models::PersonEnrichParams::Education>]
      #
      #   @param email [String]
      #
      #   @param location [ContextDev::Models::PersonEnrichParams::Location]
      #
      #   @param name [ContextDev::Models::PersonEnrichParams::Name]
      #
      #   @param social_urls [Array<String>]
      #
      #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Company < ContextDev::Internal::Type::BaseModel
        # @!attribute domain
        #
        #   @return [String, nil]
        optional :domain, String

        # @!attribute name
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(domain: nil, name: nil)
        #   @param domain [String]
        #   @param name [String]
      end

      class Education < ContextDev::Internal::Type::BaseModel
        # @!attribute degree
        #
        #   @return [String, nil]
        optional :degree, String

        # @!attribute field_of_study
        #
        #   @return [String, nil]
        optional :field_of_study, String

        # @!attribute graduation_year
        #
        #   @return [Integer, nil]
        optional :graduation_year, Integer

        # @!attribute institution
        #
        #   @return [ContextDev::Models::PersonEnrichParams::Education::Institution, nil]
        optional :institution, -> { ContextDev::PersonEnrichParams::Education::Institution }

        # @!method initialize(degree: nil, field_of_study: nil, graduation_year: nil, institution: nil)
        #   @param degree [String]
        #   @param field_of_study [String]
        #   @param graduation_year [Integer]
        #   @param institution [ContextDev::Models::PersonEnrichParams::Education::Institution]

        # @see ContextDev::Models::PersonEnrichParams::Education#institution
        class Institution < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #
          #   @return [String, nil]
          optional :domain, String

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(domain: nil, name: nil)
          #   @param domain [String]
          #   @param name [String]
        end
      end

      class Location < ContextDev::Internal::Type::BaseModel
        # @!attribute city
        #
        #   @return [String, nil]
        optional :city, String

        # @!attribute country
        #
        #   @return [String, nil]
        optional :country, String

        # @!attribute region
        #
        #   @return [String, nil]
        optional :region, String

        # @!method initialize(city: nil, country: nil, region: nil)
        #   @param city [String]
        #   @param country [String]
        #   @param region [String]
      end

      class Name < ContextDev::Internal::Type::BaseModel
        # @!attribute first
        #
        #   @return [String, nil]
        optional :first, String

        # @!attribute last
        #
        #   @return [String, nil]
        optional :last, String

        # @!method initialize(first: nil, last: nil)
        #   @param first [String]
        #   @param last [String]
      end
    end
  end
end
