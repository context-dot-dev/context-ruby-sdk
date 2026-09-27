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

      # The highest-scoring person candidate.
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

      # True when the timeout ended processing and this response contains the usable
      # data completed so far. Unfinished fields are omitted.
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
        # The highest-scoring person candidate.
        match:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # True when the timeout ended processing and this response contains the usable
        # data completed so far. Unfinished fields are omitted.
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

      # The highest-scoring person candidate.
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

          sig { returns(Integer) }
          attr_accessor :score

          sig { returns(Symbol) }
          attr_accessor :status

          # The highest-scoring person candidate.
          sig do
            params(
              person:
                ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::OrHash,
              score: Integer,
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(person:, score:, status: :candidate)
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

            # Whether the person's current role is known. `present` — current_role is
            # populated. `none` — the work history explicitly shows every role has ended.
            # `unknown` — our data sources could not confirm either way; treat a missing
            # current_role as unverified rather than vacant.
            sig do
              returns(
                ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::CurrentRoleStatus::TaggedSymbol
              )
            end
            attr_accessor :current_role_status

            sig do
              returns(
                T::Array[
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Education
                ]
              )
            end
            attr_accessor :education

            sig do
              returns(
                T::Array[
                  ContextDev::Models::PersonEnrichResponse::Match::Candidate::Person::Experience
                ]
              )
            end
            attr_accessor :experience

            sig { returns(T::Array[String]) }
            attr_accessor :skills

            sig { returns(T::Array[String]) }
            attr_accessor :social_urls

            sig { returns(T::Array[String]) }
            attr_accessor :website_urls

            sig { returns(T.nilable(String)) }
            attr_reader :avatar_url

            sig { params(avatar_url: String).void }
            attr_writer :avatar_url

            sig { returns(T.nilable(String)) }
            attr_reader :bio

            sig { params(bio: String).void }
            attr_writer :bio

            # When we last refreshed this profile from our data sources (ISO 8601).
            sig { returns(T.nilable(String)) }
            attr_reader :checked_at

            sig { params(checked_at: String).void }
            attr_writer :checked_at

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

            sig { returns(T.nilable(String)) }
            attr_reader :email

            sig { params(email: String).void }
            attr_writer :email

            # When the underlying profile data last changed in our data sources (ISO 8601).
            # Omitted when unknown.
            sig { returns(T.nilable(String)) }
            attr_reader :last_updated

            sig { params(last_updated: String).void }
            attr_writer :last_updated

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
              # Whether the person's current role is known. `present` — current_role is
              # populated. `none` — the work history explicitly shows every role has ended.
              # `unknown` — our data sources could not confirm either way; treat a missing
              # current_role as unverified rather than vacant.
              current_role_status:,
              education:,
              experience:,
              skills:,
              social_urls:,
              website_urls:,
              avatar_url: nil,
              bio: nil,
              # When we last refreshed this profile from our data sources (ISO 8601).
              checked_at: nil,
              current_role: nil,
              email: nil,
              # When the underlying profile data last changed in our data sources (ISO 8601).
              # Omitted when unknown.
              last_updated: nil,
              location: nil,
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

            # Whether the person's current role is known. `present` — current_role is
            # populated. `none` — the work history explicitly shows every role has ended.
            # `unknown` — our data sources could not confirm either way; treat a missing
            # current_role as unverified rather than vacant.
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

              sig { returns(T.nilable(String)) }
              attr_reader :degree

              sig { params(degree: String).void }
              attr_writer :degree

              sig { returns(T.nilable(String)) }
              attr_reader :description

              sig { params(description: String).void }
              attr_writer :description

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

              sig { returns(T.nilable(String)) }
              attr_reader :field_of_study

              sig { params(field_of_study: String).void }
              attr_writer :field_of_study

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
                institution:,
                degree: nil,
                description: nil,
                end_date: nil,
                field_of_study: nil,
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

                sig { returns(String) }
                attr_accessor :name

                sig { returns(T.nilable(String)) }
                attr_reader :domain

                sig { params(domain: String).void }
                attr_writer :domain

                sig do
                  params(name: String, domain: String).returns(T.attached_class)
                end
                def self.new(name:, domain: nil)
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

                sig { returns(Integer) }
                attr_accessor :year

                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(year:, day: nil, month: nil)
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

                sig { returns(Integer) }
                attr_accessor :year

                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(year:, day: nil, month: nil)
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

              sig { returns(String) }
              attr_accessor :title

              sig { returns(T.nilable(String)) }
              attr_reader :description

              sig { params(description: String).void }
              attr_writer :description

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

              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :is_current

              sig { params(is_current: T::Boolean).void }
              attr_writer :is_current

              sig { returns(T.nilable(String)) }
              attr_reader :location

              sig { params(location: String).void }
              attr_writer :location

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
                organization:,
                title:,
                description: nil,
                end_date: nil,
                is_current: nil,
                location: nil,
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

                sig { returns(String) }
                attr_accessor :name

                sig { returns(T.nilable(String)) }
                attr_reader :domain

                sig { params(domain: String).void }
                attr_writer :domain

                sig do
                  params(name: String, domain: String).returns(T.attached_class)
                end
                def self.new(name:, domain: nil)
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

                sig { returns(Integer) }
                attr_accessor :year

                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(year:, day: nil, month: nil)
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

                sig { returns(Integer) }
                attr_accessor :year

                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(year:, day: nil, month: nil)
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

              sig { returns(String) }
              attr_accessor :title

              sig { returns(T.nilable(String)) }
              attr_reader :description

              sig { params(description: String).void }
              attr_writer :description

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

              sig { returns(T.nilable(T::Boolean)) }
              attr_reader :is_current

              sig { params(is_current: T::Boolean).void }
              attr_writer :is_current

              sig { returns(T.nilable(String)) }
              attr_reader :location

              sig { params(location: String).void }
              attr_writer :location

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
                organization:,
                title:,
                description: nil,
                end_date: nil,
                is_current: nil,
                location: nil,
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

                sig { returns(String) }
                attr_accessor :name

                sig { returns(T.nilable(String)) }
                attr_reader :domain

                sig { params(domain: String).void }
                attr_writer :domain

                sig do
                  params(name: String, domain: String).returns(T.attached_class)
                end
                def self.new(name:, domain: nil)
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

                sig { returns(Integer) }
                attr_accessor :year

                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(year:, day: nil, month: nil)
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

                sig { returns(Integer) }
                attr_accessor :year

                sig { returns(T.nilable(Integer)) }
                attr_reader :day

                sig { params(day: Integer).void }
                attr_writer :day

                sig { returns(T.nilable(Integer)) }
                attr_reader :month

                sig { params(month: Integer).void }
                attr_writer :month

                sig do
                  params(year: Integer, day: Integer, month: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(year:, day: nil, month: nil)
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

              sig { returns(T.nilable(String)) }
              attr_reader :city

              sig { params(city: String).void }
              attr_writer :city

              sig { returns(T.nilable(String)) }
              attr_reader :country

              sig { params(country: String).void }
              attr_writer :country

              sig { returns(T.nilable(String)) }
              attr_reader :country_code

              sig { params(country_code: String).void }
              attr_writer :country_code

              sig { returns(T.nilable(String)) }
              attr_reader :display_

              sig { params(display_: String).void }
              attr_writer :display_

              sig { returns(T.nilable(String)) }
              attr_reader :region

              sig { params(region: String).void }
              attr_writer :region

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
                city: nil,
                country: nil,
                country_code: nil,
                display_: nil,
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

              sig { returns(T.nilable(String)) }
              attr_reader :first

              sig { params(first: String).void }
              attr_writer :first

              sig { returns(T.nilable(String)) }
              attr_reader :full

              sig { params(full: String).void }
              attr_writer :full

              sig { returns(T.nilable(String)) }
              attr_reader :last

              sig { params(last: String).void }
              attr_writer :last

              sig do
                params(first: String, full: String, last: String).returns(
                  T.attached_class
                )
              end
              def self.new(first: nil, full: nil, last: nil)
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

          sig { returns(NilClass) }
          attr_accessor :person

          sig { returns(NilClass) }
          attr_accessor :score

          sig { returns(Symbol) }
          attr_accessor :status

          # No usable person candidate was found.
          sig do
            params(person: NilClass, score: NilClass, status: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(person:, score:, status: :not_found)
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

        # Credits remaining for your organization.
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
          # Credits remaining for your organization.
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
