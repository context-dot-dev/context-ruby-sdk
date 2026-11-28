# typed: strong

module ContextDev
  module Models
    class PersonSearchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::PersonSearchParams, ContextDev::Internal::AnyHash)
        end

      # Plain-language description of the people to find. Up to 500 characters in `fast`
      # mode and 5000 in `ultra` mode.
      sig { returns(String) }
      attr_accessor :query

      # Cursor from the previous page's `next_cursor`. Omit for the first page. Send the
      # same `query`, `mode`, and `filters` with it.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Constraints every result must match, in addition to `query`.
      sig { returns(T.nilable(ContextDev::PersonSearchParams::Filters)) }
      attr_reader :filters

      sig do
        params(filters: ContextDev::PersonSearchParams::Filters::OrHash).void
      end
      attr_writer :filters

      # `fast` matches people on basic criteria such as role, location, or background;
      # `ultra` runs a deeper search, checks every candidate against each criterion in
      # your query, and adds a `match` score. Complex `ultra` searches can take up to 30
      # seconds, so set your client timeout to match.
      sig { returns(T.nilable(ContextDev::PersonSearchParams::Mode::OrSymbol)) }
      attr_reader :mode

      sig { params(mode: ContextDev::PersonSearchParams::Mode::OrSymbol).void }
      attr_writer :mode

      # Labels for this request. Filter usage and request logs by them in the dashboard
      # or with `GET /org/logs`.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      sig { returns(T.nilable(ContextDev::PersonSearchParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::PersonSearchParams::Zdr::OrSymbol).void }
      attr_writer :zdr

      sig do
        params(
          query: String,
          cursor: String,
          filters: ContextDev::PersonSearchParams::Filters::OrHash,
          mode: ContextDev::PersonSearchParams::Mode::OrSymbol,
          tags: T::Array[String],
          zdr: ContextDev::PersonSearchParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Plain-language description of the people to find. Up to 500 characters in `fast`
        # mode and 5000 in `ultra` mode.
        query:,
        # Cursor from the previous page's `next_cursor`. Omit for the first page. Send the
        # same `query`, `mode`, and `filters` with it.
        cursor: nil,
        # Constraints every result must match, in addition to `query`.
        filters: nil,
        # `fast` matches people on basic criteria such as role, location, or background;
        # `ultra` runs a deeper search, checks every candidate against each criterion in
        # your query, and adds a `match` score. Complex `ultra` searches can take up to 30
        # seconds, so set your client timeout to match.
        mode: nil,
        # Labels for this request. Filter usage and request logs by them in the dashboard
        # or with `GET /org/logs`.
        tags: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            query: String,
            cursor: String,
            filters: ContextDev::PersonSearchParams::Filters,
            mode: ContextDev::PersonSearchParams::Mode::OrSymbol,
            tags: T::Array[String],
            zdr: ContextDev::PersonSearchParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Filters < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::PersonSearchParams::Filters,
              ContextDev::Internal::AnyHash
            )
          end

        # Only return people who live in these countries, as ISO 3166-1 alpha-2 codes such
        # as `US`.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :countries

        sig { params(countries: T::Array[String]).void }
        attr_writer :countries

        # Maximum years of professional experience.
        sig { returns(T.nilable(Integer)) }
        attr_reader :years_of_experience_max

        sig { params(years_of_experience_max: Integer).void }
        attr_writer :years_of_experience_max

        # Minimum years of professional experience.
        sig { returns(T.nilable(Integer)) }
        attr_reader :years_of_experience_min

        sig { params(years_of_experience_min: Integer).void }
        attr_writer :years_of_experience_min

        # Constraints every result must match, in addition to `query`.
        sig do
          params(
            countries: T::Array[String],
            years_of_experience_max: Integer,
            years_of_experience_min: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Only return people who live in these countries, as ISO 3166-1 alpha-2 codes such
          # as `US`.
          countries: nil,
          # Maximum years of professional experience.
          years_of_experience_max: nil,
          # Minimum years of professional experience.
          years_of_experience_min: nil
        )
        end

        sig do
          override.returns(
            {
              countries: T::Array[String],
              years_of_experience_max: Integer,
              years_of_experience_min: Integer
            }
          )
        end
        def to_hash
        end
      end

      # `fast` matches people on basic criteria such as role, location, or background;
      # `ultra` runs a deeper search, checks every candidate against each criterion in
      # your query, and adds a `match` score. Complex `ultra` searches can take up to 30
      # seconds, so set your client timeout to match.
      module Mode
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::PersonSearchParams::Mode) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FAST = T.let(:fast, ContextDev::PersonSearchParams::Mode::TaggedSymbol)
        ULTRA =
          T.let(:ultra, ContextDev::PersonSearchParams::Mode::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::PersonSearchParams::Mode::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::PersonSearchParams::Zdr) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::PersonSearchParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(:disabled, ContextDev::PersonSearchParams::Zdr::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::PersonSearchParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
