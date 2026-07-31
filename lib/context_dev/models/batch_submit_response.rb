# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Batch#submit
    class BatchSubmitResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute code
      #   HTTP status code.
      #
      #   @return [Integer, ContextDev::Models::BatchSubmitResponse::Code]
      required :code, enum: -> { ContextDev::Models::BatchSubmitResponse::Code }

      # @!attribute metadata
      #   Additional response details.
      #
      #   @return [ContextDev::Models::BatchSubmitResponse::Metadata]
      required :metadata, -> { ContextDev::Models::BatchSubmitResponse::Metadata }

      # @!attribute person
      #   Retrieved person profile.
      #
      #   @return [ContextDev::Models::BatchSubmitResponse::Person]
      required :person, -> { ContextDev::Models::BatchSubmitResponse::Person }

      # @!attribute status
      #   Response status.
      #
      #   @return [Symbol, ContextDev::Models::BatchSubmitResponse::Status]
      required :status, enum: -> { ContextDev::Models::BatchSubmitResponse::Status }

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::BatchSubmitResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BatchSubmitResponse::KeyMetadata }

      # @!method initialize(code:, metadata:, person:, status:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BatchSubmitResponse} for more details.
      #
      #   @param code [Integer, ContextDev::Models::BatchSubmitResponse::Code] HTTP status code.
      #
      #   @param metadata [ContextDev::Models::BatchSubmitResponse::Metadata] Additional response details.
      #
      #   @param person [ContextDev::Models::BatchSubmitResponse::Person] Retrieved person profile.
      #
      #   @param status [Symbol, ContextDev::Models::BatchSubmitResponse::Status] Response status.
      #
      #   @param key_metadata [ContextDev::Models::BatchSubmitResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

      # HTTP status code.
      #
      # @see ContextDev::Models::BatchSubmitResponse#code
      module Code
        extend ContextDev::Internal::Type::Enum

        CODE_200 = 200

        # @!method self.values
        #   @return [Array<Integer>]
      end

      # @see ContextDev::Models::BatchSubmitResponse#metadata
      class Metadata < ContextDev::Internal::Type::BaseModel
        # @!attribute identifiers
        #   Identifiers returned for the person.
        #
        #   @return [ContextDev::Models::BatchSubmitResponse::Metadata::Identifiers]
        required :identifiers, -> { ContextDev::Models::BatchSubmitResponse::Metadata::Identifiers }

        # @!attribute sources_attempted
        #   Source categories checked.
        #
        #   @return [Array<Symbol, ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted>]
        required :sources_attempted,
                 -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted] },
                 api_name: :sourcesAttempted

        # @!attribute sources_succeeded
        #   Source categories with data.
        #
        #   @return [Array<Symbol, ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded>]
        required :sources_succeeded,
                 -> { ContextDev::Internal::Type::ArrayOf[enum: ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded] },
                 api_name: :sourcesSucceeded

        # @!attribute urls_analyzed
        #   URLs reviewed for this profile.
        #
        #   @return [Array<String>]
        required :urls_analyzed, ContextDev::Internal::Type::ArrayOf[String], api_name: :urlsAnalyzed

        # @!attribute personal_website_url
        #   Personal website URL, when found.
        #
        #   @return [String, nil]
        optional :personal_website_url, String, api_name: :personalWebsiteUrl

        # @!method initialize(identifiers:, sources_attempted:, sources_succeeded:, urls_analyzed:, personal_website_url: nil)
        #   Additional response details.
        #
        #   @param identifiers [ContextDev::Models::BatchSubmitResponse::Metadata::Identifiers] Identifiers returned for the person.
        #
        #   @param sources_attempted [Array<Symbol, ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted>] Source categories checked.
        #
        #   @param sources_succeeded [Array<Symbol, ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded>] Source categories with data.
        #
        #   @param urls_analyzed [Array<String>] URLs reviewed for this profile.
        #
        #   @param personal_website_url [String] Personal website URL, when found.

        # @see ContextDev::Models::BatchSubmitResponse::Metadata#identifiers
        class Identifiers < ContextDev::Internal::Type::BaseModel
          # @!attribute linkedin_url
          #   LinkedIn profile URL.
          #
          #   @return [String, nil]
          optional :linkedin_url, String, api_name: :linkedinUrl

          # @!method initialize(linkedin_url: nil)
          #   Identifiers returned for the person.
          #
          #   @param linkedin_url [String] LinkedIn profile URL.
        end

        module SourcesAttempted
          extend ContextDev::Internal::Type::Enum

          LINKEDIN = :linkedin
          CV = :cv
          MANUAL = :manual
          GITHUB = :github
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        module SourcesSucceeded
          extend ContextDev::Internal::Type::Enum

          LINKEDIN = :linkedin
          CV = :cv
          MANUAL = :manual
          GITHUB = :github
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::BatchSubmitResponse#person
      class Person < ContextDev::Internal::Type::BaseModel
        # @!attribute education
        #   Education history.
        #
        #   @return [Array<ContextDev::Models::BatchSubmitResponse::Person::Education>]
        required :education,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchSubmitResponse::Person::Education] }

        # @!attribute experience
        #   Work history.
        #
        #   @return [Array<ContextDev::Models::BatchSubmitResponse::Person::Experience>]
        required :experience,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchSubmitResponse::Person::Experience] }

        # @!attribute profile
        #   Core profile details.
        #
        #   @return [ContextDev::Models::BatchSubmitResponse::Person::Profile]
        required :profile, -> { ContextDev::Models::BatchSubmitResponse::Person::Profile }

        # @!attribute skills
        #   Listed skills.
        #
        #   @return [Array<ContextDev::Models::BatchSubmitResponse::Person::Skill>]
        required :skills,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchSubmitResponse::Person::Skill] }

        # @!method initialize(education:, experience:, profile:, skills:)
        #   Retrieved person profile.
        #
        #   @param education [Array<ContextDev::Models::BatchSubmitResponse::Person::Education>] Education history.
        #
        #   @param experience [Array<ContextDev::Models::BatchSubmitResponse::Person::Experience>] Work history.
        #
        #   @param profile [ContextDev::Models::BatchSubmitResponse::Person::Profile] Core profile details.
        #
        #   @param skills [Array<ContextDev::Models::BatchSubmitResponse::Person::Skill>] Listed skills.

        class Education < ContextDev::Internal::Type::BaseModel
          # @!attribute institution
          #   School or institution name.
          #
          #   @return [ContextDev::Models::BatchSubmitResponse::Person::Education::Institution]
          required :institution, -> { ContextDev::Models::BatchSubmitResponse::Person::Education::Institution }

          # @!attribute dates
          #   Education dates.
          #
          #   @return [ContextDev::Models::BatchSubmitResponse::Person::Education::Dates, nil]
          optional :dates, -> { ContextDev::Models::BatchSubmitResponse::Person::Education::Dates }

          # @!attribute description
          #   Additional education details.
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute field_of_study
          #   Area of study.
          #
          #   @return [String, nil]
          optional :field_of_study, String, api_name: :fieldOfStudy

          # @!attribute qualification
          #   Degree, certificate, or credential.
          #
          #   @return [String, nil]
          optional :qualification, String

          # @!method initialize(institution:, dates: nil, description: nil, field_of_study: nil, qualification: nil)
          #   @param institution [ContextDev::Models::BatchSubmitResponse::Person::Education::Institution] School or institution name.
          #
          #   @param dates [ContextDev::Models::BatchSubmitResponse::Person::Education::Dates] Education dates.
          #
          #   @param description [String] Additional education details.
          #
          #   @param field_of_study [String] Area of study.
          #
          #   @param qualification [String] Degree, certificate, or credential.

          # @see ContextDev::Models::BatchSubmitResponse::Person::Education#institution
          class Institution < ContextDev::Internal::Type::BaseModel
            # @!attribute display_
            #   Display name.
            #
            #   @return [String]
            required :display_, String, api_name: :display

            # @!attribute normalized
            #   Standardized name, when available.
            #
            #   @return [String, nil]
            optional :normalized, String

            # @!method initialize(display_:, normalized: nil)
            #   School or institution name.
            #
            #   @param display_ [String] Display name.
            #
            #   @param normalized [String] Standardized name, when available.
          end

          # @see ContextDev::Models::BatchSubmitResponse::Person::Education#dates
          class Dates < ContextDev::Internal::Type::BaseModel
            # @!attribute end_date
            #   End date, when known.
            #
            #   @return [ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::EndDate, nil]
            optional :end_date,
                     -> { ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::EndDate },
                     api_name: :endDate

            # @!attribute is_current
            #   Whether the entry is current.
            #
            #   @return [Boolean, nil]
            optional :is_current, ContextDev::Internal::Type::Boolean, api_name: :isCurrent

            # @!attribute start_date
            #   Start date, when known.
            #
            #   @return [ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::StartDate, nil]
            optional :start_date,
                     -> { ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::StartDate },
                     api_name: :startDate

            # @!method initialize(end_date: nil, is_current: nil, start_date: nil)
            #   Education dates.
            #
            #   @param end_date [ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::EndDate] End date, when known.
            #
            #   @param is_current [Boolean] Whether the entry is current.
            #
            #   @param start_date [ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::StartDate] Start date, when known.

            # @see ContextDev::Models::BatchSubmitResponse::Person::Education::Dates#end_date
            class EndDate < ContextDev::Internal::Type::BaseModel
              # @!attribute year
              #   Year value.
              #
              #   @return [Integer]
              required :year, Integer

              # @!attribute day
              #   Day value, when known.
              #
              #   @return [Integer, nil]
              optional :day, Integer

              # @!attribute month
              #   Month value, when known.
              #
              #   @return [Integer, nil]
              optional :month, Integer

              # @!method initialize(year:, day: nil, month: nil)
              #   End date, when known.
              #
              #   @param year [Integer] Year value.
              #
              #   @param day [Integer] Day value, when known.
              #
              #   @param month [Integer] Month value, when known.
            end

            # @see ContextDev::Models::BatchSubmitResponse::Person::Education::Dates#start_date
            class StartDate < ContextDev::Internal::Type::BaseModel
              # @!attribute year
              #   Year value.
              #
              #   @return [Integer]
              required :year, Integer

              # @!attribute day
              #   Day value, when known.
              #
              #   @return [Integer, nil]
              optional :day, Integer

              # @!attribute month
              #   Month value, when known.
              #
              #   @return [Integer, nil]
              optional :month, Integer

              # @!method initialize(year:, day: nil, month: nil)
              #   Start date, when known.
              #
              #   @param year [Integer] Year value.
              #
              #   @param day [Integer] Day value, when known.
              #
              #   @param month [Integer] Month value, when known.
            end
          end
        end

        class Experience < ContextDev::Internal::Type::BaseModel
          # @!attribute company
          #   Company or organization name.
          #
          #   @return [ContextDev::Models::BatchSubmitResponse::Person::Experience::Company]
          required :company, -> { ContextDev::Models::BatchSubmitResponse::Person::Experience::Company }

          # @!attribute title
          #   Role or job title.
          #
          #   @return [String]
          required :title, String

          # @!attribute dates
          #   Role dates.
          #
          #   @return [ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates, nil]
          optional :dates, -> { ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates }

          # @!attribute description
          #   Role description.
          #
          #   @return [String, nil]
          optional :description, String

          # @!method initialize(company:, title:, dates: nil, description: nil)
          #   @param company [ContextDev::Models::BatchSubmitResponse::Person::Experience::Company] Company or organization name.
          #
          #   @param title [String] Role or job title.
          #
          #   @param dates [ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates] Role dates.
          #
          #   @param description [String] Role description.

          # @see ContextDev::Models::BatchSubmitResponse::Person::Experience#company
          class Company < ContextDev::Internal::Type::BaseModel
            # @!attribute display_
            #   Display name.
            #
            #   @return [String]
            required :display_, String, api_name: :display

            # @!attribute normalized
            #   Standardized name, when available.
            #
            #   @return [String, nil]
            optional :normalized, String

            # @!method initialize(display_:, normalized: nil)
            #   Company or organization name.
            #
            #   @param display_ [String] Display name.
            #
            #   @param normalized [String] Standardized name, when available.
          end

          # @see ContextDev::Models::BatchSubmitResponse::Person::Experience#dates
          class Dates < ContextDev::Internal::Type::BaseModel
            # @!attribute end_date
            #   End date, when known.
            #
            #   @return [ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::EndDate, nil]
            optional :end_date,
                     -> { ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::EndDate },
                     api_name: :endDate

            # @!attribute is_current
            #   Whether the entry is current.
            #
            #   @return [Boolean, nil]
            optional :is_current, ContextDev::Internal::Type::Boolean, api_name: :isCurrent

            # @!attribute start_date
            #   Start date, when known.
            #
            #   @return [ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::StartDate, nil]
            optional :start_date,
                     -> { ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::StartDate },
                     api_name: :startDate

            # @!method initialize(end_date: nil, is_current: nil, start_date: nil)
            #   Role dates.
            #
            #   @param end_date [ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::EndDate] End date, when known.
            #
            #   @param is_current [Boolean] Whether the entry is current.
            #
            #   @param start_date [ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::StartDate] Start date, when known.

            # @see ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates#end_date
            class EndDate < ContextDev::Internal::Type::BaseModel
              # @!attribute year
              #   Year value.
              #
              #   @return [Integer]
              required :year, Integer

              # @!attribute day
              #   Day value, when known.
              #
              #   @return [Integer, nil]
              optional :day, Integer

              # @!attribute month
              #   Month value, when known.
              #
              #   @return [Integer, nil]
              optional :month, Integer

              # @!method initialize(year:, day: nil, month: nil)
              #   End date, when known.
              #
              #   @param year [Integer] Year value.
              #
              #   @param day [Integer] Day value, when known.
              #
              #   @param month [Integer] Month value, when known.
            end

            # @see ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates#start_date
            class StartDate < ContextDev::Internal::Type::BaseModel
              # @!attribute year
              #   Year value.
              #
              #   @return [Integer]
              required :year, Integer

              # @!attribute day
              #   Day value, when known.
              #
              #   @return [Integer, nil]
              optional :day, Integer

              # @!attribute month
              #   Month value, when known.
              #
              #   @return [Integer, nil]
              optional :month, Integer

              # @!method initialize(year:, day: nil, month: nil)
              #   Start date, when known.
              #
              #   @param year [Integer] Year value.
              #
              #   @param day [Integer] Day value, when known.
              #
              #   @param month [Integer] Month value, when known.
            end
          end
        end

        # @see ContextDev::Models::BatchSubmitResponse::Person#profile
        class Profile < ContextDev::Internal::Type::BaseModel
          # @!attribute full_name
          #   Person's full name.
          #
          #   @return [String, nil]
          optional :full_name, String, api_name: :fullName

          # @!attribute headline
          #   Short professional headline.
          #
          #   @return [String, nil]
          optional :headline, String

          # @!attribute location
          #   Person's listed location.
          #
          #   @return [String, nil]
          optional :location, String

          # @!attribute profile_picture_url
          #   Profile image URL.
          #
          #   @return [String, nil]
          optional :profile_picture_url, String, api_name: :profilePictureUrl

          # @!attribute summary
          #   Brief profile summary.
          #
          #   @return [String, nil]
          optional :summary, String

          # @!method initialize(full_name: nil, headline: nil, location: nil, profile_picture_url: nil, summary: nil)
          #   Core profile details.
          #
          #   @param full_name [String] Person's full name.
          #
          #   @param headline [String] Short professional headline.
          #
          #   @param location [String] Person's listed location.
          #
          #   @param profile_picture_url [String] Profile image URL.
          #
          #   @param summary [String] Brief profile summary.
        end

        class Skill < ContextDev::Internal::Type::BaseModel
          # @!attribute name
          #   Skill name.
          #
          #   @return [String]
          required :name, String

          # @!attribute normalized
          #   Standardized skill name, when available.
          #
          #   @return [String, nil]
          optional :normalized, String

          # @!attribute proficiency
          #   Skill proficiency, when available.
          #
          #   @return [String, nil]
          optional :proficiency, String

          # @!method initialize(name:, normalized: nil, proficiency: nil)
          #   @param name [String] Skill name.
          #
          #   @param normalized [String] Standardized skill name, when available.
          #
          #   @param proficiency [String] Skill proficiency, when available.
        end
      end

      # Response status.
      #
      # @see ContextDev::Models::BatchSubmitResponse#status
      module Status
        extend ContextDev::Internal::Type::Enum

        OK = :ok

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::BatchSubmitResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   The number of credits consumed by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   The number of credits remaining for your organization after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Metadata about the API key used for the request. Included in every response
        #   whenever a valid API key is provided, even when the response status is not 200.
        #
        #   @param credits_consumed [Integer] The number of credits consumed by this request.
        #
        #   @param credits_remaining [Integer] The number of credits remaining for your organization after this request.
      end
    end
  end
end
