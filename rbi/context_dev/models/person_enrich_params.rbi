# typed: strong

module ContextDev
  module Models
    class PersonEnrichParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::PersonEnrichParams, ContextDev::Internal::AnyHash)
        end

      sig { returns(T.nilable(ContextDev::PersonEnrichParams::Company)) }
      attr_reader :company

      sig do
        params(company: ContextDev::PersonEnrichParams::Company::OrHash).void
      end
      attr_writer :company

      sig do
        returns(T.nilable(T::Array[ContextDev::PersonEnrichParams::Education]))
      end
      attr_reader :education

      sig do
        params(
          education: T::Array[ContextDev::PersonEnrichParams::Education::OrHash]
        ).void
      end
      attr_writer :education

      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      sig { returns(T.nilable(ContextDev::PersonEnrichParams::Location)) }
      attr_reader :location

      sig do
        params(location: ContextDev::PersonEnrichParams::Location::OrHash).void
      end
      attr_writer :location

      sig { returns(T.nilable(ContextDev::PersonEnrichParams::Name)) }
      attr_reader :name

      sig { params(name: ContextDev::PersonEnrichParams::Name::OrHash).void }
      attr_writer :name

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :social_urls

      sig { params(social_urls: T::Array[String]).void }
      attr_writer :social_urls

      # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Optional request deadline and behavior on timeout. For GET requests, use
      # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      # timeoutOpts object.
      sig { returns(T.nilable(ContextDev::PersonEnrichParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::PersonEnrichParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      sig do
        params(
          company: ContextDev::PersonEnrichParams::Company::OrHash,
          education:
            T::Array[ContextDev::PersonEnrichParams::Education::OrHash],
          email: String,
          location: ContextDev::PersonEnrichParams::Location::OrHash,
          name: ContextDev::PersonEnrichParams::Name::OrHash,
          social_urls: T::Array[String],
          tags: T::Array[String],
          timeout_opts: ContextDev::PersonEnrichParams::TimeoutOpts::OrHash,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        company: nil,
        education: nil,
        email: nil,
        location: nil,
        name: nil,
        social_urls: nil,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        timeout_opts: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            company: ContextDev::PersonEnrichParams::Company,
            education: T::Array[ContextDev::PersonEnrichParams::Education],
            email: String,
            location: ContextDev::PersonEnrichParams::Location,
            name: ContextDev::PersonEnrichParams::Name,
            social_urls: T::Array[String],
            tags: T::Array[String],
            timeout_opts: ContextDev::PersonEnrichParams::TimeoutOpts,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Company < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::PersonEnrichParams::Company,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :domain

        sig { params(domain: String).void }
        attr_writer :domain

        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        sig { params(domain: String, name: String).returns(T.attached_class) }
        def self.new(domain: nil, name: nil)
        end

        sig { override.returns({ domain: String, name: String }) }
        def to_hash
        end
      end

      class Education < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::PersonEnrichParams::Education,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :degree

        sig { params(degree: String).void }
        attr_writer :degree

        sig { returns(T.nilable(String)) }
        attr_reader :field_of_study

        sig { params(field_of_study: String).void }
        attr_writer :field_of_study

        sig { returns(T.nilable(Integer)) }
        attr_reader :graduation_year

        sig { params(graduation_year: Integer).void }
        attr_writer :graduation_year

        sig do
          returns(
            T.nilable(ContextDev::PersonEnrichParams::Education::Institution)
          )
        end
        attr_reader :institution

        sig do
          params(
            institution:
              ContextDev::PersonEnrichParams::Education::Institution::OrHash
          ).void
        end
        attr_writer :institution

        sig do
          params(
            degree: String,
            field_of_study: String,
            graduation_year: Integer,
            institution:
              ContextDev::PersonEnrichParams::Education::Institution::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          degree: nil,
          field_of_study: nil,
          graduation_year: nil,
          institution: nil
        )
        end

        sig do
          override.returns(
            {
              degree: String,
              field_of_study: String,
              graduation_year: Integer,
              institution:
                ContextDev::PersonEnrichParams::Education::Institution
            }
          )
        end
        def to_hash
        end

        class Institution < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::PersonEnrichParams::Education::Institution,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(String)) }
          attr_reader :domain

          sig { params(domain: String).void }
          attr_writer :domain

          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          sig { params(domain: String, name: String).returns(T.attached_class) }
          def self.new(domain: nil, name: nil)
          end

          sig { override.returns({ domain: String, name: String }) }
          def to_hash
          end
        end
      end

      class Location < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::PersonEnrichParams::Location,
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
        attr_reader :region

        sig { params(region: String).void }
        attr_writer :region

        sig do
          params(city: String, country: String, region: String).returns(
            T.attached_class
          )
        end
        def self.new(city: nil, country: nil, region: nil)
        end

        sig do
          override.returns({ city: String, country: String, region: String })
        end
        def to_hash
        end
      end

      class Name < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::PersonEnrichParams::Name,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :first

        sig { params(first: String).void }
        attr_writer :first

        sig { returns(T.nilable(String)) }
        attr_reader :last

        sig { params(last: String).void }
        attr_writer :last

        sig { params(first: String, last: String).returns(T.attached_class) }
        def self.new(first: nil, last: nil)
        end

        sig { override.returns({ first: String, last: String }) }
        def to_hash
        end
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::PersonEnrichParams::TimeoutOpts,
              ContextDev::Internal::AnyHash
            )
          end

        # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
        sig do
          returns(
            T.nilable(
              ContextDev::PersonEnrichParams::TimeoutOpts::Behavior::OrSymbol
            )
          )
        end
        attr_reader :behavior

        sig do
          params(
            behavior:
              ContextDev::PersonEnrichParams::TimeoutOpts::Behavior::OrSymbol
          ).void
        end
        attr_writer :behavior

        # Optional request deadline and behavior on timeout. For GET requests, use
        # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        # timeoutOpts object.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::PersonEnrichParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Request deadline in milliseconds. Maximum: 300000 (5 minutes).
          milliseconds:,
          # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
          # credits. "return-partial" returns usable results collected so far; if none are
          # available, the request still fails without charging credits. Partial results are
          # not cached as complete results.
          behavior: nil
        )
        end

        sig do
          override.returns(
            {
              milliseconds: Integer,
              behavior:
                ContextDev::PersonEnrichParams::TimeoutOpts::Behavior::OrSymbol
            }
          )
        end
        def to_hash
        end

        # What to do at the deadline. "fail" returns 408 REQUEST_TIMEOUT without charging
        # credits. "return-partial" returns usable results collected so far; if none are
        # available, the request still fails without charging credits. Partial results are
        # not cached as complete results.
        module Behavior
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::PersonEnrichParams::TimeoutOpts::Behavior
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          FAIL =
            T.let(
              :fail,
              ContextDev::PersonEnrichParams::TimeoutOpts::Behavior::TaggedSymbol
            )
          RETURN_PARTIAL =
            T.let(
              :"return-partial",
              ContextDev::PersonEnrichParams::TimeoutOpts::Behavior::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::PersonEnrichParams::TimeoutOpts::Behavior::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
