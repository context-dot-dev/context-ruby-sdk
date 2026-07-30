# typed: strong

module ContextDev
  module Models
    class BatchSubmitResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BatchSubmitResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # HTTP status code.
      sig do
        returns(ContextDev::Models::BatchSubmitResponse::Code::TaggedInteger)
      end
      attr_accessor :code

      # Additional response details.
      sig { returns(ContextDev::Models::BatchSubmitResponse::Metadata) }
      attr_reader :metadata

      sig do
        params(
          metadata: ContextDev::Models::BatchSubmitResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      # Retrieved person profile.
      sig { returns(ContextDev::Models::BatchSubmitResponse::Person) }
      attr_reader :person

      sig do
        params(
          person: ContextDev::Models::BatchSubmitResponse::Person::OrHash
        ).void
      end
      attr_writer :person

      # Response status.
      sig do
        returns(ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
      sig do
        returns(T.nilable(ContextDev::Models::BatchSubmitResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BatchSubmitResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          code: ContextDev::Models::BatchSubmitResponse::Code::OrInteger,
          metadata: ContextDev::Models::BatchSubmitResponse::Metadata::OrHash,
          person: ContextDev::Models::BatchSubmitResponse::Person::OrHash,
          status: ContextDev::Models::BatchSubmitResponse::Status::OrSymbol,
          key_metadata:
            ContextDev::Models::BatchSubmitResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # HTTP status code.
        code:,
        # Additional response details.
        metadata:,
        # Retrieved person profile.
        person:,
        # Response status.
        status:,
        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            code: ContextDev::Models::BatchSubmitResponse::Code::TaggedInteger,
            metadata: ContextDev::Models::BatchSubmitResponse::Metadata,
            person: ContextDev::Models::BatchSubmitResponse::Person,
            status:
              ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol,
            key_metadata: ContextDev::Models::BatchSubmitResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      # HTTP status code.
      module Code
        extend ContextDev::Internal::Type::Enum

        TaggedInteger =
          T.type_alias do
            T.all(Integer, ContextDev::Models::BatchSubmitResponse::Code)
          end
        OrInteger = T.type_alias { Integer }

        CODE_200 =
          T.let(
            200,
            ContextDev::Models::BatchSubmitResponse::Code::TaggedInteger
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchSubmitResponse::Code::TaggedInteger
            ]
          )
        end
        def self.values
        end
      end

      class Metadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchSubmitResponse::Metadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Identifiers returned for the person.
        sig do
          returns(
            ContextDev::Models::BatchSubmitResponse::Metadata::Identifiers
          )
        end
        attr_reader :identifiers

        sig do
          params(
            identifiers:
              ContextDev::Models::BatchSubmitResponse::Metadata::Identifiers::OrHash
          ).void
        end
        attr_writer :identifiers

        # Source categories checked.
        sig do
          returns(
            T::Array[
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted::TaggedSymbol
            ]
          )
        end
        attr_accessor :sources_attempted

        # Source categories with data.
        sig do
          returns(
            T::Array[
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded::TaggedSymbol
            ]
          )
        end
        attr_accessor :sources_succeeded

        # URLs reviewed for this profile.
        sig { returns(T::Array[String]) }
        attr_accessor :urls_analyzed

        # Personal website URL, when found.
        sig { returns(T.nilable(String)) }
        attr_reader :personal_website_url

        sig { params(personal_website_url: String).void }
        attr_writer :personal_website_url

        # Additional response details.
        sig do
          params(
            identifiers:
              ContextDev::Models::BatchSubmitResponse::Metadata::Identifiers::OrHash,
            sources_attempted:
              T::Array[
                ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted::OrSymbol
              ],
            sources_succeeded:
              T::Array[
                ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded::OrSymbol
              ],
            urls_analyzed: T::Array[String],
            personal_website_url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Identifiers returned for the person.
          identifiers:,
          # Source categories checked.
          sources_attempted:,
          # Source categories with data.
          sources_succeeded:,
          # URLs reviewed for this profile.
          urls_analyzed:,
          # Personal website URL, when found.
          personal_website_url: nil
        )
        end

        sig do
          override.returns(
            {
              identifiers:
                ContextDev::Models::BatchSubmitResponse::Metadata::Identifiers,
              sources_attempted:
                T::Array[
                  ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted::TaggedSymbol
                ],
              sources_succeeded:
                T::Array[
                  ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded::TaggedSymbol
                ],
              urls_analyzed: T::Array[String],
              personal_website_url: String
            }
          )
        end
        def to_hash
        end

        class Identifiers < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchSubmitResponse::Metadata::Identifiers,
                ContextDev::Internal::AnyHash
              )
            end

          # LinkedIn profile URL.
          sig { returns(T.nilable(String)) }
          attr_reader :linkedin_url

          sig { params(linkedin_url: String).void }
          attr_writer :linkedin_url

          # Identifiers returned for the person.
          sig { params(linkedin_url: String).returns(T.attached_class) }
          def self.new(
            # LinkedIn profile URL.
            linkedin_url: nil
          )
          end

          sig { override.returns({ linkedin_url: String }) }
          def to_hash
          end
        end

        module SourcesAttempted
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LINKEDIN =
            T.let(
              :linkedin,
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted::TaggedSymbol
            )
          CV =
            T.let(
              :cv,
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted::TaggedSymbol
            )
          MANUAL =
            T.let(
              :manual,
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted::TaggedSymbol
            )
          GITHUB =
            T.let(
              :github,
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted::TaggedSymbol
            )
          OTHER =
            T.let(
              :other,
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::BatchSubmitResponse::Metadata::SourcesAttempted::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module SourcesSucceeded
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LINKEDIN =
            T.let(
              :linkedin,
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded::TaggedSymbol
            )
          CV =
            T.let(
              :cv,
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded::TaggedSymbol
            )
          MANUAL =
            T.let(
              :manual,
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded::TaggedSymbol
            )
          GITHUB =
            T.let(
              :github,
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded::TaggedSymbol
            )
          OTHER =
            T.let(
              :other,
              ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::BatchSubmitResponse::Metadata::SourcesSucceeded::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Person < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchSubmitResponse::Person,
              ContextDev::Internal::AnyHash
            )
          end

        # Education history.
        sig do
          returns(
            T::Array[ContextDev::Models::BatchSubmitResponse::Person::Education]
          )
        end
        attr_accessor :education

        # Work history.
        sig do
          returns(
            T::Array[
              ContextDev::Models::BatchSubmitResponse::Person::Experience
            ]
          )
        end
        attr_accessor :experience

        # Core profile details.
        sig do
          returns(ContextDev::Models::BatchSubmitResponse::Person::Profile)
        end
        attr_reader :profile

        sig do
          params(
            profile:
              ContextDev::Models::BatchSubmitResponse::Person::Profile::OrHash
          ).void
        end
        attr_writer :profile

        # Listed skills.
        sig do
          returns(
            T::Array[ContextDev::Models::BatchSubmitResponse::Person::Skill]
          )
        end
        attr_accessor :skills

        # Retrieved person profile.
        sig do
          params(
            education:
              T::Array[
                ContextDev::Models::BatchSubmitResponse::Person::Education::OrHash
              ],
            experience:
              T::Array[
                ContextDev::Models::BatchSubmitResponse::Person::Experience::OrHash
              ],
            profile:
              ContextDev::Models::BatchSubmitResponse::Person::Profile::OrHash,
            skills:
              T::Array[
                ContextDev::Models::BatchSubmitResponse::Person::Skill::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Education history.
          education:,
          # Work history.
          experience:,
          # Core profile details.
          profile:,
          # Listed skills.
          skills:
        )
        end

        sig do
          override.returns(
            {
              education:
                T::Array[
                  ContextDev::Models::BatchSubmitResponse::Person::Education
                ],
              experience:
                T::Array[
                  ContextDev::Models::BatchSubmitResponse::Person::Experience
                ],
              profile: ContextDev::Models::BatchSubmitResponse::Person::Profile,
              skills:
                T::Array[ContextDev::Models::BatchSubmitResponse::Person::Skill]
            }
          )
        end
        def to_hash
        end

        class Education < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchSubmitResponse::Person::Education,
                ContextDev::Internal::AnyHash
              )
            end

          # School or institution name.
          sig do
            returns(
              ContextDev::Models::BatchSubmitResponse::Person::Education::Institution
            )
          end
          attr_reader :institution

          sig do
            params(
              institution:
                ContextDev::Models::BatchSubmitResponse::Person::Education::Institution::OrHash
            ).void
          end
          attr_writer :institution

          # Education dates.
          sig do
            returns(
              T.nilable(
                ContextDev::Models::BatchSubmitResponse::Person::Education::Dates
              )
            )
          end
          attr_reader :dates

          sig do
            params(
              dates:
                ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::OrHash
            ).void
          end
          attr_writer :dates

          # Additional education details.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # Area of study.
          sig { returns(T.nilable(String)) }
          attr_reader :field_of_study

          sig { params(field_of_study: String).void }
          attr_writer :field_of_study

          # Degree, certificate, or credential.
          sig { returns(T.nilable(String)) }
          attr_reader :qualification

          sig { params(qualification: String).void }
          attr_writer :qualification

          sig do
            params(
              institution:
                ContextDev::Models::BatchSubmitResponse::Person::Education::Institution::OrHash,
              dates:
                ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::OrHash,
              description: String,
              field_of_study: String,
              qualification: String
            ).returns(T.attached_class)
          end
          def self.new(
            # School or institution name.
            institution:,
            # Education dates.
            dates: nil,
            # Additional education details.
            description: nil,
            # Area of study.
            field_of_study: nil,
            # Degree, certificate, or credential.
            qualification: nil
          )
          end

          sig do
            override.returns(
              {
                institution:
                  ContextDev::Models::BatchSubmitResponse::Person::Education::Institution,
                dates:
                  ContextDev::Models::BatchSubmitResponse::Person::Education::Dates,
                description: String,
                field_of_study: String,
                qualification: String
              }
            )
          end
          def to_hash
          end

          class Institution < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BatchSubmitResponse::Person::Education::Institution,
                  ContextDev::Internal::AnyHash
                )
              end

            # Display name.
            sig { returns(String) }
            attr_accessor :display_

            # Standardized name, when available.
            sig { returns(T.nilable(String)) }
            attr_reader :normalized

            sig { params(normalized: String).void }
            attr_writer :normalized

            # School or institution name.
            sig do
              params(display_: String, normalized: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # Display name.
              display_:,
              # Standardized name, when available.
              normalized: nil
            )
            end

            sig { override.returns({ display_: String, normalized: String }) }
            def to_hash
            end
          end

          class Dates < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BatchSubmitResponse::Person::Education::Dates,
                  ContextDev::Internal::AnyHash
                )
              end

            # End date, when known.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::EndDate
                )
              )
            end
            attr_reader :end_date

            sig do
              params(
                end_date:
                  ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::EndDate::OrHash
              ).void
            end
            attr_writer :end_date

            # Whether the entry is current.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :is_current

            sig { params(is_current: T::Boolean).void }
            attr_writer :is_current

            # Start date, when known.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::StartDate
                )
              )
            end
            attr_reader :start_date

            sig do
              params(
                start_date:
                  ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::StartDate::OrHash
              ).void
            end
            attr_writer :start_date

            # Education dates.
            sig do
              params(
                end_date:
                  ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::EndDate::OrHash,
                is_current: T::Boolean,
                start_date:
                  ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::StartDate::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # End date, when known.
              end_date: nil,
              # Whether the entry is current.
              is_current: nil,
              # Start date, when known.
              start_date: nil
            )
            end

            sig do
              override.returns(
                {
                  end_date:
                    ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::EndDate,
                  is_current: T::Boolean,
                  start_date:
                    ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::StartDate
                }
              )
            end
            def to_hash
            end

            class EndDate < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::EndDate,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Year value.
              sig { returns(Integer) }
              attr_accessor :year

              # Day value, when known.
              sig { returns(T.nilable(Integer)) }
              attr_reader :day

              sig { params(day: Integer).void }
              attr_writer :day

              # Month value, when known.
              sig { returns(T.nilable(Integer)) }
              attr_reader :month

              sig { params(month: Integer).void }
              attr_writer :month

              # End date, when known.
              sig do
                params(year: Integer, day: Integer, month: Integer).returns(
                  T.attached_class
                )
              end
              def self.new(
                # Year value.
                year:,
                # Day value, when known.
                day: nil,
                # Month value, when known.
                month: nil
              )
              end

              sig do
                override.returns(
                  { year: Integer, day: Integer, month: Integer }
                )
              end
              def to_hash
              end
            end

            class StartDate < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchSubmitResponse::Person::Education::Dates::StartDate,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Year value.
              sig { returns(Integer) }
              attr_accessor :year

              # Day value, when known.
              sig { returns(T.nilable(Integer)) }
              attr_reader :day

              sig { params(day: Integer).void }
              attr_writer :day

              # Month value, when known.
              sig { returns(T.nilable(Integer)) }
              attr_reader :month

              sig { params(month: Integer).void }
              attr_writer :month

              # Start date, when known.
              sig do
                params(year: Integer, day: Integer, month: Integer).returns(
                  T.attached_class
                )
              end
              def self.new(
                # Year value.
                year:,
                # Day value, when known.
                day: nil,
                # Month value, when known.
                month: nil
              )
              end

              sig do
                override.returns(
                  { year: Integer, day: Integer, month: Integer }
                )
              end
              def to_hash
              end
            end
          end
        end

        class Experience < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchSubmitResponse::Person::Experience,
                ContextDev::Internal::AnyHash
              )
            end

          # Company or organization name.
          sig do
            returns(
              ContextDev::Models::BatchSubmitResponse::Person::Experience::Company
            )
          end
          attr_reader :company

          sig do
            params(
              company:
                ContextDev::Models::BatchSubmitResponse::Person::Experience::Company::OrHash
            ).void
          end
          attr_writer :company

          # Role or job title.
          sig { returns(String) }
          attr_accessor :title

          # Role dates.
          sig do
            returns(
              T.nilable(
                ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates
              )
            )
          end
          attr_reader :dates

          sig do
            params(
              dates:
                ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::OrHash
            ).void
          end
          attr_writer :dates

          # Role description.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          sig do
            params(
              company:
                ContextDev::Models::BatchSubmitResponse::Person::Experience::Company::OrHash,
              title: String,
              dates:
                ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::OrHash,
              description: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Company or organization name.
            company:,
            # Role or job title.
            title:,
            # Role dates.
            dates: nil,
            # Role description.
            description: nil
          )
          end

          sig do
            override.returns(
              {
                company:
                  ContextDev::Models::BatchSubmitResponse::Person::Experience::Company,
                title: String,
                dates:
                  ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates,
                description: String
              }
            )
          end
          def to_hash
          end

          class Company < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BatchSubmitResponse::Person::Experience::Company,
                  ContextDev::Internal::AnyHash
                )
              end

            # Display name.
            sig { returns(String) }
            attr_accessor :display_

            # Standardized name, when available.
            sig { returns(T.nilable(String)) }
            attr_reader :normalized

            sig { params(normalized: String).void }
            attr_writer :normalized

            # Company or organization name.
            sig do
              params(display_: String, normalized: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # Display name.
              display_:,
              # Standardized name, when available.
              normalized: nil
            )
            end

            sig { override.returns({ display_: String, normalized: String }) }
            def to_hash
            end
          end

          class Dates < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates,
                  ContextDev::Internal::AnyHash
                )
              end

            # End date, when known.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::EndDate
                )
              )
            end
            attr_reader :end_date

            sig do
              params(
                end_date:
                  ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::EndDate::OrHash
              ).void
            end
            attr_writer :end_date

            # Whether the entry is current.
            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :is_current

            sig { params(is_current: T::Boolean).void }
            attr_writer :is_current

            # Start date, when known.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::StartDate
                )
              )
            end
            attr_reader :start_date

            sig do
              params(
                start_date:
                  ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::StartDate::OrHash
              ).void
            end
            attr_writer :start_date

            # Role dates.
            sig do
              params(
                end_date:
                  ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::EndDate::OrHash,
                is_current: T::Boolean,
                start_date:
                  ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::StartDate::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # End date, when known.
              end_date: nil,
              # Whether the entry is current.
              is_current: nil,
              # Start date, when known.
              start_date: nil
            )
            end

            sig do
              override.returns(
                {
                  end_date:
                    ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::EndDate,
                  is_current: T::Boolean,
                  start_date:
                    ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::StartDate
                }
              )
            end
            def to_hash
            end

            class EndDate < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::EndDate,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Year value.
              sig { returns(Integer) }
              attr_accessor :year

              # Day value, when known.
              sig { returns(T.nilable(Integer)) }
              attr_reader :day

              sig { params(day: Integer).void }
              attr_writer :day

              # Month value, when known.
              sig { returns(T.nilable(Integer)) }
              attr_reader :month

              sig { params(month: Integer).void }
              attr_writer :month

              # End date, when known.
              sig do
                params(year: Integer, day: Integer, month: Integer).returns(
                  T.attached_class
                )
              end
              def self.new(
                # Year value.
                year:,
                # Day value, when known.
                day: nil,
                # Month value, when known.
                month: nil
              )
              end

              sig do
                override.returns(
                  { year: Integer, day: Integer, month: Integer }
                )
              end
              def to_hash
              end
            end

            class StartDate < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchSubmitResponse::Person::Experience::Dates::StartDate,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Year value.
              sig { returns(Integer) }
              attr_accessor :year

              # Day value, when known.
              sig { returns(T.nilable(Integer)) }
              attr_reader :day

              sig { params(day: Integer).void }
              attr_writer :day

              # Month value, when known.
              sig { returns(T.nilable(Integer)) }
              attr_reader :month

              sig { params(month: Integer).void }
              attr_writer :month

              # Start date, when known.
              sig do
                params(year: Integer, day: Integer, month: Integer).returns(
                  T.attached_class
                )
              end
              def self.new(
                # Year value.
                year:,
                # Day value, when known.
                day: nil,
                # Month value, when known.
                month: nil
              )
              end

              sig do
                override.returns(
                  { year: Integer, day: Integer, month: Integer }
                )
              end
              def to_hash
              end
            end
          end
        end

        class Profile < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchSubmitResponse::Person::Profile,
                ContextDev::Internal::AnyHash
              )
            end

          # Person's full name.
          sig { returns(T.nilable(String)) }
          attr_reader :full_name

          sig { params(full_name: String).void }
          attr_writer :full_name

          # Short professional headline.
          sig { returns(T.nilable(String)) }
          attr_reader :headline

          sig { params(headline: String).void }
          attr_writer :headline

          # Person's listed location.
          sig { returns(T.nilable(String)) }
          attr_reader :location

          sig { params(location: String).void }
          attr_writer :location

          # Profile image URL.
          sig { returns(T.nilable(String)) }
          attr_reader :profile_picture_url

          sig { params(profile_picture_url: String).void }
          attr_writer :profile_picture_url

          # Brief profile summary.
          sig { returns(T.nilable(String)) }
          attr_reader :summary

          sig { params(summary: String).void }
          attr_writer :summary

          # Core profile details.
          sig do
            params(
              full_name: String,
              headline: String,
              location: String,
              profile_picture_url: String,
              summary: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Person's full name.
            full_name: nil,
            # Short professional headline.
            headline: nil,
            # Person's listed location.
            location: nil,
            # Profile image URL.
            profile_picture_url: nil,
            # Brief profile summary.
            summary: nil
          )
          end

          sig do
            override.returns(
              {
                full_name: String,
                headline: String,
                location: String,
                profile_picture_url: String,
                summary: String
              }
            )
          end
          def to_hash
          end
        end

        class Skill < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchSubmitResponse::Person::Skill,
                ContextDev::Internal::AnyHash
              )
            end

          # Skill name.
          sig { returns(String) }
          attr_accessor :name

          # Standardized skill name, when available.
          sig { returns(T.nilable(String)) }
          attr_reader :normalized

          sig { params(normalized: String).void }
          attr_writer :normalized

          # Skill proficiency, when available.
          sig { returns(T.nilable(String)) }
          attr_reader :proficiency

          sig { params(proficiency: String).void }
          attr_writer :proficiency

          sig do
            params(
              name: String,
              normalized: String,
              proficiency: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Skill name.
            name:,
            # Standardized skill name, when available.
            normalized: nil,
            # Skill proficiency, when available.
            proficiency: nil
          )
          end

          sig do
            override.returns(
              { name: String, normalized: String, proficiency: String }
            )
          end
          def to_hash
          end
        end
      end

      # Response status.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchSubmitResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OK =
          T.let(
            :ok,
            ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchSubmitResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # The number of credits consumed by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # The number of credits remaining for your organization after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The number of credits consumed by this request.
          credits_consumed:,
          # The number of credits remaining for your organization after this request.
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
