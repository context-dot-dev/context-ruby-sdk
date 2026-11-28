# typed: strong

module ContextDev
  module Models
    class PersonEnrichResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::PersonEnrichResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # The best-matching person, with an identity-match score.
      sig { returns(ContextDev::Models::PersonEnrichResponse::Match::Variants) }
      attr_accessor :match

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(ContextDev::Models::PersonEnrichResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::PersonEnrichResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # `true` when the `timeoutOpts` deadline ended processing early. The response
      # holds the data completed so far; unfinished fields are omitted.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :partial

      sig { params(partial: T::Boolean).void }
      attr_writer :partial

      sig do
        params(
          match:
            T.any(
              ContextDev::Models::PersonEnrichResponse::Match::Candidate::OrHash,
              ContextDev::Models::PersonEnrichResponse::Match::NotFound::OrHash
            ),
          request_id: String,
          key_metadata:
            ContextDev::Models::PersonEnrichResponse::KeyMetadata::OrHash,
          partial: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # The best-matching person, with an identity-match score.
        match:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # `true` when the `timeoutOpts` deadline ended processing early. The response
        # holds the data completed so far; unfinished fields are omitted.
        partial: nil
      )
      end

      sig do
        override.returns(
          {
            match: ContextDev::Models::PersonEnrichResponse::Match::Variants,
            request_id: String,
            key_metadata: ContextDev::Models::PersonEnrichResponse::KeyMetadata,
            partial: T::Boolean
          }
        )
      end
      def to_hash
      end

      # The best-matching person, with an identity-match score.
      module Match
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::Models::PersonEnrichResponse::Match::Candidate,
              ContextDev::Models::PersonEnrichResponse::Match::NotFound
            )
          end

        class Candidate < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::PersonEnrichResponse::Match::Candidate,
                ContextDev::Internal::AnyHash
              )
            end

          # Profile of the matched person.
          sig do
            returns(
              ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person
            )
          end
          attr_reader :person

          sig do
            params(
              person:
                ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::OrHash
            ).void
          end
          attr_writer :person

          # Identity-match score from 0 to 100. Higher is a stronger match; weak candidates
          # are still returned.
          sig { returns(Integer) }
          attr_accessor :score

          # Always `candidate` for a match.
          sig { returns(Symbol) }
          attr_accessor :status

          # The best-matching person, with an identity-match score.
          sig do
            params(
              person:
                ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::OrHash,
              score: Integer,
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Profile of the matched person.
            person:,
            # Identity-match score from 0 to 100. Higher is a stronger match; weak candidates
            # are still returned.
            score:,
            # Always `candidate` for a match.
            status: :candidate
          )
          end

          sig do
            override.returns(
              {
                person:
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person,
                score: Integer,
                status: Symbol
              }
            )
          end
          def to_hash
          end

          class Person < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person,
                  ContextDev::Internal::AnyHash
                )
              end

            # Whether the person's current role is known. `present` means `current_role` is
            # filled in; `none` means the work history shows every role has ended; `unknown`
            # means it could not be confirmed either way, so treat a missing `current_role` as
            # unverified, not vacant.
            sig do
              returns(
                ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus::TaggedSymbol
              )
            end
            attr_accessor :current_role_status

            # Education history.
            sig do
              returns(
                T::Array[
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education
                ]
              )
            end
            attr_accessor :education

            # Work history. Each entry has the same fields as `current_role`.
            sig do
              returns(
                T::Array[
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience
                ]
              )
            end
            attr_accessor :experience

            # Professional skills.
            sig { returns(T::Array[String]) }
            attr_accessor :skills

            # Public profile URLs for the person.
            sig { returns(T::Array[String]) }
            attr_accessor :social_urls

            # Other websites associated with the person.
            sig { returns(T::Array[String]) }
            attr_accessor :website_urls

            # URL of the hosted profile picture. Omitted with zero data retention.
            sig { returns(T.nilable(String)) }
            attr_reader :avatar_url

            sig { params(avatar_url: String).void }
            attr_writer :avatar_url

            # Short bio from the person's profile.
            sig { returns(T.nilable(String)) }
            attr_reader :bio

            sig { params(bio: String).void }
            attr_writer :bio

            # When Context.dev last refreshed the profile from its sources, as an ISO 8601
            # timestamp.
            sig { returns(T.nilable(String)) }
            attr_reader :checked_at

            sig { params(checked_at: String).void }
            attr_writer :checked_at

            # The person's current job. See `current_role_status` when it is missing.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole
                )
              )
            end
            attr_reader :current_role

            sig do
              params(
                current_role:
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::OrHash
              ).void
            end
            attr_writer :current_role

            # Email address of the person.
            sig { returns(T.nilable(String)) }
            attr_reader :email

            sig { params(email: String).void }
            attr_writer :email

            # When the profile data last changed at its sources, as an ISO 8601 timestamp.
            # Omitted when unknown.
            sig { returns(T.nilable(String)) }
            attr_reader :last_updated

            sig { params(last_updated: String).void }
            attr_writer :last_updated

            # Where the person is based.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location
                )
              )
            end
            attr_reader :location

            sig do
              params(
                location:
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location::OrHash
              ).void
            end
            attr_writer :location

            # Name of the person.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name
                )
              )
            end
            attr_reader :name

            sig do
              params(
                name:
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name::OrHash
              ).void
            end
            attr_writer :name

            # Profile of the matched person.
            sig do
              params(
                current_role_status:
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus::OrSymbol,
                education:
                  T::Array[
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::OrHash
                  ],
                experience:
                  T::Array[
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::OrHash
                  ],
                skills: T::Array[String],
                social_urls: T::Array[String],
                website_urls: T::Array[String],
                avatar_url: String,
                bio: String,
                checked_at: String,
                current_role:
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::OrHash,
                email: String,
                last_updated: String,
                location:
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location::OrHash,
                name:
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Whether the person's current role is known. `present` means `current_role` is
              # filled in; `none` means the work history shows every role has ended; `unknown`
              # means it could not be confirmed either way, so treat a missing `current_role` as
              # unverified, not vacant.
              current_role_status:,
              # Education history.
              education:,
              # Work history. Each entry has the same fields as `current_role`.
              experience:,
              # Professional skills.
              skills:,
              # Public profile URLs for the person.
              social_urls:,
              # Other websites associated with the person.
              website_urls:,
              # URL of the hosted profile picture. Omitted with zero data retention.
              avatar_url: nil,
              # Short bio from the person's profile.
              bio: nil,
              # When Context.dev last refreshed the profile from its sources, as an ISO 8601
              # timestamp.
              checked_at: nil,
              # The person's current job. See `current_role_status` when it is missing.
              current_role: nil,
              # Email address of the person.
              email: nil,
              # When the profile data last changed at its sources, as an ISO 8601 timestamp.
              # Omitted when unknown.
              last_updated: nil,
              # Where the person is based.
              location: nil,
              # Name of the person.
              name: nil
            )
            end

            sig do
              override.returns(
                {
                  current_role_status:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus::TaggedSymbol,
                  education:
                    T::Array[
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education
                    ],
                  experience:
                    T::Array[
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience
                    ],
                  skills: T::Array[String],
                  social_urls: T::Array[String],
                  website_urls: T::Array[String],
                  avatar_url: String,
                  bio: String,
                  checked_at: String,
                  current_role:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole,
                  email: String,
                  last_updated: String,
                  location:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location,
                  name:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name
                }
              )
            end
            def to_hash
            end

            # Whether the person's current role is known. `present` means `current_role` is
            # filled in; `none` means the work history shows every role has ended; `unknown`
            # means it could not be confirmed either way, so treat a missing `current_role` as
            # unverified, not vacant.
            module CurrentRoleStatus
              extend ContextDev::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              PRESENT =
                T.let(
                  :present,
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus::TaggedSymbol
                )
              NONE =
                T.let(
                  :none,
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus::TaggedSymbol
                )
              UNKNOWN =
                T.let(
                  :unknown,
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class Education < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education,
                    ContextDev::Internal::AnyHash
                  )
                end

              # School or university.
              sig do
                returns(
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution
                )
              end
              attr_reader :institution

              sig do
                params(
                  institution:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution::OrHash
                ).void
              end
              attr_writer :institution

              # Degree or qualification.
              sig { returns(T.nilable(String)) }
              attr_reader :degree

              sig { params(degree: String).void }
              attr_writer :degree

              # Description of the studies.
              sig { returns(T.nilable(String)) }
              attr_reader :description

              sig { params(description: String).void }
              attr_writer :description

              # When the studies ended.
              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate
                  )
                )
              end
              attr_reader :end_date

              sig do
                params(
                  end_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate::OrHash
                ).void
              end
              attr_writer :end_date

              # Subject or major studied.
              sig { returns(T.nilable(String)) }
              attr_reader :field_of_study

              sig { params(field_of_study: String).void }
              attr_writer :field_of_study

              # When the studies started.
              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate
                  )
                )
              end
              attr_reader :start_date

              sig do
                params(
                  start_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate::OrHash
                ).void
              end
              attr_writer :start_date

              sig do
                params(
                  institution:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution::OrHash,
                  degree: String,
                  description: String,
                  end_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate::OrHash,
                  field_of_study: String,
                  start_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # School or university.
                institution:,
                # Degree or qualification.
                degree: nil,
                # Description of the studies.
                description: nil,
                # When the studies ended.
                end_date: nil,
                # Subject or major studied.
                field_of_study: nil,
                # When the studies started.
                start_date: nil
              )
              end

              sig do
                override.returns(
                  {
                    institution:
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution,
                    degree: String,
                    description: String,
                    end_date:
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate,
                    field_of_study: String,
                    start_date:
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate
                  }
                )
              end
              def to_hash
              end

              class Institution < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::Institution,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Name of the organization.
                sig { returns(String) }
                attr_accessor :name

                # Website domain of the organization. Omitted when unknown.
                sig { returns(T.nilable(String)) }
                attr_reader :domain

                sig { params(domain: String).void }
                attr_writer :domain

                # School or university.
                sig do
                  params(name: String, domain: String).returns(T.attached_class)
                end
                def self.new(
                  # Name of the organization.
                  name:,
                  # Website domain of the organization. Omitted when unknown.
                  domain: nil
                )
                end

                sig { override.returns({ name: String, domain: String }) }
                def to_hash
                end
              end

              class EndDate < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::EndDate,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Four-digit year.
                sig { returns(Integer) }
                attr_accessor :year

                # Day of the month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                # Month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                # When the studies ended.
                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # Four-digit year.
                  year:,
                  # Day of the month. Omitted when unknown.
                  day: nil,
                  # Month. Omitted when unknown.
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
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education::StartDate,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Four-digit year.
                sig { returns(Integer) }
                attr_accessor :year

                # Day of the month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                # Month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                # When the studies started.
                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # Four-digit year.
                  year:,
                  # Day of the month. Omitted when unknown.
                  day: nil,
                  # Month. Omitted when unknown.
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

            class Experience < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Employer for this role.
              sig do
                returns(
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization
                )
              end
              attr_reader :organization

              sig do
                params(
                  organization:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization::OrHash
                ).void
              end
              attr_writer :organization

              # Job title.
              sig { returns(String) }
              attr_accessor :title

              # Description of the role.
              sig { returns(T.nilable(String)) }
              attr_reader :description

              sig { params(description: String).void }
              attr_writer :description

              # When the role ended.
              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate
                  )
                )
              end
              attr_reader :end_date

              sig do
                params(
                  end_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate::OrHash
                ).void
              end
              attr_writer :end_date

              # Whether the person still holds this role.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :is_current

              sig { params(is_current: T::Boolean).void }
              attr_writer :is_current

              # Where the role is based.
              sig { returns(T.nilable(String)) }
              attr_reader :location

              sig { params(location: String).void }
              attr_writer :location

              # When the role started.
              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate
                  )
                )
              end
              attr_reader :start_date

              sig do
                params(
                  start_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate::OrHash
                ).void
              end
              attr_writer :start_date

              sig do
                params(
                  organization:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization::OrHash,
                  title: String,
                  description: String,
                  end_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate::OrHash,
                  is_current: T::Boolean,
                  location: String,
                  start_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # Employer for this role.
                organization:,
                # Job title.
                title:,
                # Description of the role.
                description: nil,
                # When the role ended.
                end_date: nil,
                # Whether the person still holds this role.
                is_current: nil,
                # Where the role is based.
                location: nil,
                # When the role started.
                start_date: nil
              )
              end

              sig do
                override.returns(
                  {
                    organization:
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization,
                    title: String,
                    description: String,
                    end_date:
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate,
                    is_current: T::Boolean,
                    location: String,
                    start_date:
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate
                  }
                )
              end
              def to_hash
              end

              class Organization < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::Organization,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Name of the organization.
                sig { returns(String) }
                attr_accessor :name

                # Website domain of the organization. Omitted when unknown.
                sig { returns(T.nilable(String)) }
                attr_reader :domain

                sig { params(domain: String).void }
                attr_writer :domain

                # Employer for this role.
                sig do
                  params(name: String, domain: String).returns(T.attached_class)
                end
                def self.new(
                  # Name of the organization.
                  name:,
                  # Website domain of the organization. Omitted when unknown.
                  domain: nil
                )
                end

                sig { override.returns({ name: String, domain: String }) }
                def to_hash
                end
              end

              class EndDate < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::EndDate,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Four-digit year.
                sig { returns(Integer) }
                attr_accessor :year

                # Day of the month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                # Month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                # When the role ended.
                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # Four-digit year.
                  year:,
                  # Day of the month. Omitted when unknown.
                  day: nil,
                  # Month. Omitted when unknown.
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
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience::StartDate,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Four-digit year.
                sig { returns(Integer) }
                attr_accessor :year

                # Day of the month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                # Month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                # When the role started.
                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # Four-digit year.
                  year:,
                  # Day of the month. Omitted when unknown.
                  day: nil,
                  # Month. Omitted when unknown.
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

            class CurrentRole < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Employer for this role.
              sig do
                returns(
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization
                )
              end
              attr_reader :organization

              sig do
                params(
                  organization:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization::OrHash
                ).void
              end
              attr_writer :organization

              # Job title.
              sig { returns(String) }
              attr_accessor :title

              # Description of the role.
              sig { returns(T.nilable(String)) }
              attr_reader :description

              sig { params(description: String).void }
              attr_writer :description

              # When the role ended.
              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate
                  )
                )
              end
              attr_reader :end_date

              sig do
                params(
                  end_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate::OrHash
                ).void
              end
              attr_writer :end_date

              # Whether the person still holds this role.
              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :is_current

              sig { params(is_current: T::Boolean).void }
              attr_writer :is_current

              # Where the role is based.
              sig { returns(T.nilable(String)) }
              attr_reader :location

              sig { params(location: String).void }
              attr_writer :location

              # When the role started.
              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate
                  )
                )
              end
              attr_reader :start_date

              sig do
                params(
                  start_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate::OrHash
                ).void
              end
              attr_writer :start_date

              # The person's current job. See `current_role_status` when it is missing.
              sig do
                params(
                  organization:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization::OrHash,
                  title: String,
                  description: String,
                  end_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate::OrHash,
                  is_current: T::Boolean,
                  location: String,
                  start_date:
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # Employer for this role.
                organization:,
                # Job title.
                title:,
                # Description of the role.
                description: nil,
                # When the role ended.
                end_date: nil,
                # Whether the person still holds this role.
                is_current: nil,
                # Where the role is based.
                location: nil,
                # When the role started.
                start_date: nil
              )
              end

              sig do
                override.returns(
                  {
                    organization:
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization,
                    title: String,
                    description: String,
                    end_date:
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate,
                    is_current: T::Boolean,
                    location: String,
                    start_date:
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate
                  }
                )
              end
              def to_hash
              end

              class Organization < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::Organization,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Name of the organization.
                sig { returns(String) }
                attr_accessor :name

                # Website domain of the organization. Omitted when unknown.
                sig { returns(T.nilable(String)) }
                attr_reader :domain

                sig { params(domain: String).void }
                attr_writer :domain

                # Employer for this role.
                sig do
                  params(name: String, domain: String).returns(T.attached_class)
                end
                def self.new(
                  # Name of the organization.
                  name:,
                  # Website domain of the organization. Omitted when unknown.
                  domain: nil
                )
                end

                sig { override.returns({ name: String, domain: String }) }
                def to_hash
                end
              end

              class EndDate < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::EndDate,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Four-digit year.
                sig { returns(Integer) }
                attr_accessor :year

                # Day of the month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                # Month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                # When the role ended.
                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # Four-digit year.
                  year:,
                  # Day of the month. Omitted when unknown.
                  day: nil,
                  # Month. Omitted when unknown.
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
                      ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRole::StartDate,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Four-digit year.
                sig { returns(Integer) }
                attr_accessor :year

                # Day of the month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                # Month. Omitted when unknown.
                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                # When the role started.
                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # Four-digit year.
                  year:,
                  # Day of the month. Omitted when unknown.
                  day: nil,
                  # Month. Omitted when unknown.
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

            class Location < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Location,
                    ContextDev::Internal::AnyHash
                  )
                end

              # City.
              sig { returns(T.nilable(String)) }
              attr_reader :city

              sig { params(city: String).void }
              attr_writer :city

              # Country name.
              sig { returns(T.nilable(String)) }
              attr_reader :country

              sig { params(country: String).void }
              attr_writer :country

              # ISO 3166-1 alpha-2 country code.
              sig { returns(T.nilable(String)) }
              attr_reader :country_code

              sig { params(country_code: String).void }
              attr_writer :country_code

              # Location as a single display string.
              sig { returns(T.nilable(String)) }
              attr_reader :display_

              sig { params(display_: String).void }
              attr_writer :display_

              # State, province, or region.
              sig { returns(T.nilable(String)) }
              attr_reader :region

              sig { params(region: String).void }
              attr_writer :region

              # Where the person is based.
              sig do
                params(
                  city: String,
                  country: String,
                  country_code: String,
                  display_: String,
                  region: String
                ).returns(T.attached_class)
              end
              def self.new(
                # City.
                city: nil,
                # Country name.
                country: nil,
                # ISO 3166-1 alpha-2 country code.
                country_code: nil,
                # Location as a single display string.
                display_: nil,
                # State, province, or region.
                region: nil
              )
              end

              sig do
                override.returns(
                  {
                    city: String,
                    country: String,
                    country_code: String,
                    display_: String,
                    region: String
                  }
                )
              end
              def to_hash
              end
            end

            class Name < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Name,
                    ContextDev::Internal::AnyHash
                  )
                end

              # First or given name.
              sig { returns(T.nilable(String)) }
              attr_reader :first

              sig { params(first: String).void }
              attr_writer :first

              # Full name.
              sig { returns(T.nilable(String)) }
              attr_reader :full

              sig { params(full: String).void }
              attr_writer :full

              # Last or family name.
              sig { returns(T.nilable(String)) }
              attr_reader :last

              sig { params(last: String).void }
              attr_writer :last

              # Name of the person.
              sig do
                params(first: String, full: String, last: String).returns(
                  T.attached_class
                )
              end
              def self.new(
                # First or given name.
                first: nil,
                # Full name.
                full: nil,
                # Last or family name.
                last: nil
              )
              end

              sig do
                override.returns({ first: String, full: String, last: String })
              end
              def to_hash
              end
            end
          end
        end

        class NotFound < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::PersonEnrichResponse::Match::NotFound,
                ContextDev::Internal::AnyHash
              )
            end

          # Always `null`.
          sig { returns(NilClass) }
          attr_accessor :person

          # Always `null`.
          sig { returns(NilClass) }
          attr_accessor :score

          # Always `not_found` when no candidate exists.
          sig { returns(Symbol) }
          attr_accessor :status

          # No usable candidate was found.
          sig do
            params(person: NilClass, score: NilClass, status: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Always `null`.
            person:,
            # Always `null`.
            score:,
            # Always `not_found` when no candidate exists.
            status: :not_found
          )
          end

          sig do
            override.returns(
              { person: NilClass, score: NilClass, status: Symbol }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::Models::PersonEnrichResponse::Match::Variants]
          )
        end
        def self.variants
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::PersonEnrichResponse::KeyMetadata,
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
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
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
