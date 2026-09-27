# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::People#enrich
    class PersonEnrichParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute company
      #   Company context to help identify the person. Provide a name or domain.
      #
      #   @return [ContextDev::Models::PersonEnrichParams::Company, nil]
      optional :company, -> { ContextDev::PersonEnrichParams::Company }

      # @!attribute education
      #   Education history to help distinguish people with similar names.
      #
      #   @return [Array<ContextDev::Models::PersonEnrichParams::Education>, nil]
      optional :education, -> { ContextDev::Internal::Type::ArrayOf[ContextDev::PersonEnrichParams::Education] }

      # @!attribute email
      #   Email address of the person to find.
      #
      #   @return [String, nil]
      optional :email, String

      # @!attribute location
      #   Location context to help identify the person. Provide a city, region, or
      #   country.
      #
      #   @return [ContextDev::Models::PersonEnrichParams::Location, nil]
      optional :location, -> { ContextDev::PersonEnrichParams::Location }

      # @!attribute name
      #   Person name. Without an email or person-profile URL, provide both first and last
      #   name plus company, education, or location.
      #
      #   @return [ContextDev::Models::PersonEnrichParams::Name, nil]
      optional :name, -> { ContextDev::PersonEnrichParams::Name }

      # @!attribute social_urls
      #   Public profile URLs for the person. A person-profile URL can identify the person
      #   without a name.
      #
      #   @return [Array<String>, nil]
      optional :social_urls, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute tags
      #   Labels for filtering usage in the dashboard.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::PersonEnrichParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::PersonEnrichParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::PersonEnrichParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::PersonEnrichParams::Zdr }

      # @!method initialize(company: nil, education: nil, email: nil, location: nil, name: nil, social_urls: nil, tags: nil, timeout_opts: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::PersonEnrichParams} for more details.
      #
      #   @param company [ContextDev::Models::PersonEnrichParams::Company] Company context to help identify the person. Provide a name or domain.
      #
      #   @param education [Array<ContextDev::Models::PersonEnrichParams::Education>] Education history to help distinguish people with similar names.
      #
      #   @param email [String] Email address of the person to find.
      #
      #   @param location [ContextDev::Models::PersonEnrichParams::Location] Location context to help identify the person. Provide a city, region, or country
      #
      #   @param name [ContextDev::Models::PersonEnrichParams::Name] Person name. Without an email or person-profile URL, provide both first and last
      #
      #   @param social_urls [Array<String>] Public profile URLs for the person. A person-profile URL can identify the person
      #
      #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      #   @param timeout_opts [ContextDev::Models::PersonEnrichParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param zdr [Symbol, ContextDev::Models::PersonEnrichParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      class Company < ContextDev::Internal::Type::BaseModel
        # @!attribute domain
        #   Website domain of a company associated with the person.
        #
        #   @return [String, nil]
        optional :domain, String

        # @!attribute name
        #   Name of a company associated with the person.
        #
        #   @return [String, nil]
        optional :name, String

        # @!method initialize(domain: nil, name: nil)
        #   Company context to help identify the person. Provide a name or domain.
        #
        #   @param domain [String] Website domain of a company associated with the person.
        #
        #   @param name [String] Name of a company associated with the person.
      end

      class Education < ContextDev::Internal::Type::BaseModel
        # @!attribute degree
        #   Degree or qualification earned.
        #
        #   @return [String, nil]
        optional :degree, String

        # @!attribute field_of_study
        #   Subject or major studied.
        #
        #   @return [String, nil]
        optional :field_of_study, String

        # @!attribute graduation_year
        #   Four-digit graduation year.
        #
        #   @return [Integer, nil]
        optional :graduation_year, Integer

        # @!attribute institution
        #   School or university, identified by name or domain.
        #
        #   @return [ContextDev::Models::PersonEnrichParams::Education::Institution, nil]
        optional :institution, -> { ContextDev::PersonEnrichParams::Education::Institution }

        # @!method initialize(degree: nil, field_of_study: nil, graduation_year: nil, institution: nil)
        #   @param degree [String] Degree or qualification earned.
        #
        #   @param field_of_study [String] Subject or major studied.
        #
        #   @param graduation_year [Integer] Four-digit graduation year.
        #
        #   @param institution [ContextDev::Models::PersonEnrichParams::Education::Institution] School or university, identified by name or domain.

        # @see ContextDev::Models::PersonEnrichParams::Education#institution
        class Institution < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #   Website domain of the school or university.
          #
          #   @return [String, nil]
          optional :domain, String

          # @!attribute name
          #   Name of the school or university.
          #
          #   @return [String, nil]
          optional :name, String

          # @!method initialize(domain: nil, name: nil)
          #   School or university, identified by name or domain.
          #
          #   @param domain [String] Website domain of the school or university.
          #
          #   @param name [String] Name of the school or university.
        end
      end

      class Location < ContextDev::Internal::Type::BaseModel
        # @!attribute city
        #   City associated with the person.
        #
        #   @return [String, nil]
        optional :city, String

        # @!attribute country
        #   Country associated with the person.
        #
        #   @return [String, nil]
        optional :country, String

        # @!attribute region
        #   State, province, or region associated with the person.
        #
        #   @return [String, nil]
        optional :region, String

        # @!method initialize(city: nil, country: nil, region: nil)
        #   Location context to help identify the person. Provide a city, region, or
        #   country.
        #
        #   @param city [String] City associated with the person.
        #
        #   @param country [String] Country associated with the person.
        #
        #   @param region [String] State, province, or region associated with the person.
      end

      class Name < ContextDev::Internal::Type::BaseModel
        # @!attribute first
        #   First or given name.
        #
        #   @return [String, nil]
        optional :first, String

        # @!attribute last
        #   Last or family name.
        #
        #   @return [String, nil]
        optional :last, String

        # @!method initialize(first: nil, last: nil)
        #   Person name. Without an email or person-profile URL, provide both first and last
        #   name plus company, education, or location.
        #
        #   @param first [String] First or given name.
        #
        #   @param last [String] Last or family name.
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        # @!attribute milliseconds
        #   Deadline in milliseconds.
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   "fail" returns 408 at the deadline. "return-partial" returns available results;
        #   inspect the response’s partial flag.
        #
        #   @return [Symbol, ContextDev::Models::PersonEnrichParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::PersonEnrichParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::PersonEnrichParams::TimeoutOpts} for more details.
        #
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::PersonEnrichParams::TimeoutOpts::Behavior] "fail" returns 408 at the deadline. "return-partial" returns available results;

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
        #
        # @see ContextDev::Models::PersonEnrichParams::TimeoutOpts#behavior
        module Behavior
          extend ContextDev::Internal::Type::Enum

          FAIL = :fail
          RETURN_PARTIAL = :"return-partial"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        ENABLED = :enabled
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
