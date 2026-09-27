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

      # Company context to help identify the person. Provide a name or domain.
      sig { returns(T.nilable(ContextDev::PersonEnrichParams::Company)) }
      attr_reader :company

      sig do
        params(company: ContextDev::PersonEnrichParams::Company::OrHash).void
      end
      attr_writer :company

      # Education history to help distinguish people with similar names.
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

      # Email address of the person to find.
      sig { returns(T.nilable(String)) }
      attr_reader :email

      sig { params(email: String).void }
      attr_writer :email

      # Location context to help identify the person. Provide a city, region, or
      # country.
      sig { returns(T.nilable(ContextDev::PersonEnrichParams::Location)) }
      attr_reader :location

      sig do
        params(location: ContextDev::PersonEnrichParams::Location::OrHash).void
      end
      attr_writer :location

      # Person name. Without an email or person-profile URL, provide both first and last
      # name plus company, education, or location.
      sig { returns(T.nilable(ContextDev::PersonEnrichParams::Name)) }
      attr_reader :name

      sig { params(name: ContextDev::PersonEnrichParams::Name::OrHash).void }
      attr_writer :name

      # Public profile URLs for the person. A person-profile URL can identify the person
      # without a name.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :social_urls

      sig { params(social_urls: T::Array[String]).void }
      attr_writer :social_urls

      # Labels for filtering usage in the dashboard.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Request deadline and what to return when it passes.
      sig { returns(T.nilable(ContextDev::PersonEnrichParams::TimeoutOpts)) }
      attr_reader :timeout_opts

      sig do
        params(
          timeout_opts: ContextDev::PersonEnrichParams::TimeoutOpts::OrHash
        ).void
      end
      attr_writer :timeout_opts

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      sig { returns(T.nilable(ContextDev::PersonEnrichParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::PersonEnrichParams::Zdr::OrSymbol).void }
      attr_writer :zdr

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
          zdr: ContextDev::PersonEnrichParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Company context to help identify the person. Provide a name or domain.
        company: nil,
        # Education history to help distinguish people with similar names.
        education: nil,
        # Email address of the person to find.
        email: nil,
        # Location context to help identify the person. Provide a city, region, or
        # country.
        location: nil,
        # Person name. Without an email or person-profile URL, provide both first and last
        # name plus company, education, or location.
        name: nil,
        # Public profile URLs for the person. A person-profile URL can identify the person
        # without a name.
        social_urls: nil,
        # Labels for filtering usage in the dashboard.
        tags: nil,
        # Request deadline and what to return when it passes.
        timeout_opts: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
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
            zdr: ContextDev::PersonEnrichParams::Zdr::OrSymbol,
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

        # Website domain of a company associated with the person.
        sig { returns(T.nilable(String)) }
        attr_reader :domain

        sig { params(domain: String).void }
        attr_writer :domain

        # Name of a company associated with the person.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Company context to help identify the person. Provide a name or domain.
        sig { params(domain: String, name: String).returns(T.attached_class) }
        def self.new(
          # Website domain of a company associated with the person.
          domain: nil,
          # Name of a company associated with the person.
          name: nil
        )
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

        # Degree or qualification earned.
        sig { returns(T.nilable(String)) }
        attr_reader :degree

        sig { params(degree: String).void }
        attr_writer :degree

        # Subject or major studied.
        sig { returns(T.nilable(String)) }
        attr_reader :field_of_study

        sig { params(field_of_study: String).void }
        attr_writer :field_of_study

        # Four-digit graduation year.
        sig { returns(T.nilable(Integer)) }
        attr_reader :graduation_year

        sig { params(graduation_year: Integer).void }
        attr_writer :graduation_year

        # School or university, identified by name or domain.
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
          # Degree or qualification earned.
          degree: nil,
          # Subject or major studied.
          field_of_study: nil,
          # Four-digit graduation year.
          graduation_year: nil,
          # School or university, identified by name or domain.
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

          # Website domain of the school or university.
          sig { returns(T.nilable(String)) }
          attr_reader :domain

          sig { params(domain: String).void }
          attr_writer :domain

          # Name of the school or university.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # School or university, identified by name or domain.
          sig { params(domain: String, name: String).returns(T.attached_class) }
          def self.new(
            # Website domain of the school or university.
            domain: nil,
            # Name of the school or university.
            name: nil
          )
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

        # City associated with the person.
        sig { returns(T.nilable(String)) }
        attr_reader :city

        sig { params(city: String).void }
        attr_writer :city

        # Country associated with the person.
        sig { returns(T.nilable(String)) }
        attr_reader :country

        sig { params(country: String).void }
        attr_writer :country

        # State, province, or region associated with the person.
        sig { returns(T.nilable(String)) }
        attr_reader :region

        sig { params(region: String).void }
        attr_writer :region

        # Location context to help identify the person. Provide a city, region, or
        # country.
        sig do
          params(city: String, country: String, region: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # City associated with the person.
          city: nil,
          # Country associated with the person.
          country: nil,
          # State, province, or region associated with the person.
          region: nil
        )
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

        # First or given name.
        sig { returns(T.nilable(String)) }
        attr_reader :first

        sig { params(first: String).void }
        attr_writer :first

        # Last or family name.
        sig { returns(T.nilable(String)) }
        attr_reader :last

        sig { params(last: String).void }
        attr_writer :last

        # Person name. Without an email or person-profile URL, provide both first and last
        # name plus company, education, or location.
        sig { params(first: String, last: String).returns(T.attached_class) }
        def self.new(
          # First or given name.
          first: nil,
          # Last or family name.
          last: nil
        )
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

        # Deadline in milliseconds.
        sig { returns(Integer) }
        attr_accessor :milliseconds

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
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

        # Request deadline and what to return when it passes.
        sig do
          params(
            milliseconds: Integer,
            behavior:
              ContextDev::PersonEnrichParams::TimeoutOpts::Behavior::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Deadline in milliseconds.
          milliseconds:,
          # "fail" returns 408 at the deadline. "return-partial" returns available results;
          # inspect the response’s partial flag.
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

        # "fail" returns 408 at the deadline. "return-partial" returns available results;
        # inspect the response’s partial flag.
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

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::PersonEnrichParams::Zdr) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::PersonEnrichParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(:disabled, ContextDev::PersonEnrichParams::Zdr::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::PersonEnrichParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
