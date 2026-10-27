# typed: strong

module ContextDev
  module Models
    class PersonSearchResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::PersonSearchResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Up to 10 matching people, most relevant first.
      sig do
        returns(T::Array[ContextDev::Models::PersonSearchResponse::Result])
      end
      attr_accessor :results

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(ContextDev::Models::PersonSearchResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::PersonSearchResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Pass as cursor to fetch the next page; null when there are no more results.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      sig do
        params(
          request_id: String,
          results:
            T::Array[ContextDev::Models::PersonSearchResponse::Result::OrHash],
          key_metadata:
            ContextDev::Models::PersonSearchResponse::KeyMetadata::OrHash,
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Up to 10 matching people, most relevant first.
        results:,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # Pass as cursor to fetch the next page; null when there are no more results.
        next_cursor: nil
      )
      end

      sig do
        override.returns(
          {
            request_id: String,
            results: T::Array[ContextDev::Models::PersonSearchResponse::Result],
            key_metadata: ContextDev::Models::PersonSearchResponse::KeyMetadata,
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Result < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::PersonSearchResponse::Result,
              ContextDev::Internal::AnyHash
            )
          end

        # What the person does.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # Whether the person is currently a founder or co-founder.
        sig { returns(T.nilable(T::Boolean)) }
        attr_accessor :is_founder

        # Where the person lives.
        sig do
          returns(ContextDev::Models::PersonSearchResponse::Result::Location)
        end
        attr_reader :location

        sig do
          params(
            location:
              ContextDev::Models::PersonSearchResponse::Result::Location::OrHash
          ).void
        end
        attr_writer :location

        # Full name.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # Public professional profile URLs.
        sig { returns(T::Array[String]) }
        attr_accessor :profiles

        # The person’s current role.
        sig { returns(ContextDev::Models::PersonSearchResponse::Result::Role) }
        attr_reader :role

        sig do
          params(
            role: ContextDev::Models::PersonSearchResponse::Result::Role::OrHash
          ).void
        end
        attr_writer :role

        # Schools attended.
        sig { returns(T::Array[String]) }
        attr_accessor :schools

        # Professional skills.
        sig { returns(T::Array[String]) }
        attr_accessor :skills

        # Years of professional experience.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :years_of_experience

        # How well the person matches the query. Only returned in `ultra` mode.
        sig do
          returns(
            T.nilable(ContextDev::Models::PersonSearchResponse::Result::Match)
          )
        end
        attr_reader :match

        sig do
          params(
            match:
              ContextDev::Models::PersonSearchResponse::Result::Match::OrHash
          ).void
        end
        attr_writer :match

        # A person matching your search; unavailable details are null or empty lists.
        sig do
          params(
            description: T.nilable(String),
            is_founder: T.nilable(T::Boolean),
            location:
              ContextDev::Models::PersonSearchResponse::Result::Location::OrHash,
            name: T.nilable(String),
            profiles: T::Array[String],
            role:
              ContextDev::Models::PersonSearchResponse::Result::Role::OrHash,
            schools: T::Array[String],
            skills: T::Array[String],
            years_of_experience: T.nilable(Integer),
            match:
              ContextDev::Models::PersonSearchResponse::Result::Match::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # What the person does.
          description:,
          # Whether the person is currently a founder or co-founder.
          is_founder:,
          # Where the person lives.
          location:,
          # Full name.
          name:,
          # Public professional profile URLs.
          profiles:,
          # The person’s current role.
          role:,
          # Schools attended.
          schools:,
          # Professional skills.
          skills:,
          # Years of professional experience.
          years_of_experience:,
          # How well the person matches the query. Only returned in `ultra` mode.
          match: nil
        )
        end

        sig do
          override.returns(
            {
              description: T.nilable(String),
              is_founder: T.nilable(T::Boolean),
              location:
                ContextDev::Models::PersonSearchResponse::Result::Location,
              name: T.nilable(String),
              profiles: T::Array[String],
              role: ContextDev::Models::PersonSearchResponse::Result::Role,
              schools: T::Array[String],
              skills: T::Array[String],
              years_of_experience: T.nilable(Integer),
              match: ContextDev::Models::PersonSearchResponse::Result::Match
            }
          )
        end
        def to_hash
        end

        class Location < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::PersonSearchResponse::Result::Location,
                ContextDev::Internal::AnyHash
              )
            end

          # City.
          sig { returns(T.nilable(String)) }
          attr_accessor :city

          # Country as a two-letter code, such as US or GB.
          sig { returns(T.nilable(String)) }
          attr_accessor :country_code

          # State or region.
          sig { returns(T.nilable(String)) }
          attr_accessor :region

          # Where the person lives.
          sig do
            params(
              city: T.nilable(String),
              country_code: T.nilable(String),
              region: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # City.
            city:,
            # Country as a two-letter code, such as US or GB.
            country_code:,
            # State or region.
            region:
          )
          end

          sig do
            override.returns(
              {
                city: T.nilable(String),
                country_code: T.nilable(String),
                region: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        class Role < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::PersonSearchResponse::Result::Role,
                ContextDev::Internal::AnyHash
              )
            end

          # Current employer, when known.
          sig do
            returns(
              T.nilable(
                ContextDev::Models::PersonSearchResponse::Result::Role::Company
              )
            )
          end
          attr_reader :company

          sig do
            params(
              company:
                T.nilable(
                  ContextDev::Models::PersonSearchResponse::Result::Role::Company::OrHash
                )
            ).void
          end
          attr_writer :company

          # Areas of responsibility.
          sig { returns(T::Array[String]) }
          attr_accessor :functions

          # Seniority level.
          sig { returns(T.nilable(String)) }
          attr_accessor :seniority

          # Role start date (YYYY-MM-DD).
          sig { returns(T.nilable(String)) }
          attr_accessor :started_on

          # Job title.
          sig { returns(T.nilable(String)) }
          attr_accessor :title

          # The person’s current role.
          sig do
            params(
              company:
                T.nilable(
                  ContextDev::Models::PersonSearchResponse::Result::Role::Company::OrHash
                ),
              functions: T::Array[String],
              seniority: T.nilable(String),
              started_on: T.nilable(String),
              title: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Current employer, when known.
            company:,
            # Areas of responsibility.
            functions:,
            # Seniority level.
            seniority:,
            # Role start date (YYYY-MM-DD).
            started_on:,
            # Job title.
            title:
          )
          end

          sig do
            override.returns(
              {
                company:
                  T.nilable(
                    ContextDev::Models::PersonSearchResponse::Result::Role::Company
                  ),
                functions: T::Array[String],
                seniority: T.nilable(String),
                started_on: T.nilable(String),
                title: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          class Company < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::PersonSearchResponse::Result::Role::Company,
                  ContextDev::Internal::AnyHash
                )
              end

            # The company’s website domain.
            sig { returns(T.nilable(String)) }
            attr_accessor :domain

            # Company name.
            sig { returns(T.nilable(String)) }
            attr_accessor :name

            # Current employer, when known.
            sig do
              params(
                domain: T.nilable(String),
                name: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The company’s website domain.
              domain:,
              # Company name.
              name:
            )
            end

            sig do
              override.returns(
                { domain: T.nilable(String), name: T.nilable(String) }
              )
            end
            def to_hash
            end
          end
        end

        class Match < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::PersonSearchResponse::Result::Match,
                ContextDev::Internal::AnyHash
              )
            end

          # How well the person matches the query, from 0 to 1.
          sig { returns(Float) }
          attr_accessor :confidence

          # How well the person matches the query. Only returned in `ultra` mode.
          sig { params(confidence: Float).returns(T.attached_class) }
          def self.new(
            # How well the person matches the query, from 0 to 1.
            confidence:
          )
          end

          sig { override.returns({ confidence: Float }) }
          def to_hash
          end
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::PersonSearchResponse::KeyMetadata,
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
