# typed: strong

module ContextDev
  module Models
    class WebExtractParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::WebExtractParams, ContextDev::Internal::AnyHash)
        end

      # JSON Schema for the returned data object. TypeScript Zod users can pass a JSON
      # Schema generated from a Zod object; Python users can pass the equivalent JSON
      # Schema object.
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :schema

      # The starting website URL to crawl and extract from. Must include http:// or
      # https://.
      sig { returns(String) }
      attr_accessor :url

      # When true, every returned value must be grounded in facts stated on the page;
      # fields that cannot be supported by the page are returned as null/empty. When
      # false (default), the model may make reasonable inferences and derivations from
      # the page content (e.g. ideal customer, competitor analysis, recommendations)
      # while keeping verifiable specifics (names, quotes, URLs, dates, metrics)
      # faithful to the source.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :fact_check

      sig { params(fact_check: T::Boolean).void }
      attr_writer :fact_check

      # When true, follow links on subdomains of the starting URL's domain.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :follow_subdomains

      sig { params(follow_subdomains: T::Boolean).void }
      attr_writer :follow_subdomains

      # When true, iframe contents are included in Markdown before extraction.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_frames

      sig { params(include_frames: T::Boolean).void }
      attr_writer :include_frames

      # Optional extraction guidance, such as which facts to prioritize or how to
      # interpret fields in the schema.
      sig { returns(T.nilable(String)) }
      attr_reader :instructions

      sig { params(instructions: String).void }
      attr_writer :instructions

      # Return cached scrape results if a prior scrape for the same parameters is
      # younger than this many milliseconds.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_age_ms

      sig { params(max_age_ms: Integer).void }
      attr_writer :max_age_ms

      sig { returns(T.nilable(ContextDev::WebExtractParams::Pdf)) }
      attr_reader :pdf

      sig { params(pdf: ContextDev::WebExtractParams::Pdf::OrHash).void }
      attr_writer :pdf

      # Soft time budget for the crawl in milliseconds.
      sig { returns(T.nilable(Integer)) }
      attr_reader :stop_after_ms

      sig { params(stop_after_ms: Integer).void }
      attr_writer :stop_after_ms

      # Optional timeout in milliseconds for the request. If the request takes longer
      # than this value, it will be aborted with a 408 status code. Maximum allowed
      # value is 300000ms (5 minutes).
      sig { returns(T.nilable(Integer)) }
      attr_reader :timeout_ms

      sig { params(timeout_ms: Integer).void }
      attr_writer :timeout_ms

      # Optional browser wait time in milliseconds after initial page load for each
      # crawled page.
      sig { returns(T.nilable(Integer)) }
      attr_reader :wait_for_ms

      sig { params(wait_for_ms: Integer).void }
      attr_writer :wait_for_ms

      sig do
        params(
          schema: T::Hash[Symbol, T.anything],
          url: String,
          fact_check: T::Boolean,
          follow_subdomains: T::Boolean,
          include_frames: T::Boolean,
          instructions: String,
          max_age_ms: Integer,
          pdf: ContextDev::WebExtractParams::Pdf::OrHash,
          stop_after_ms: Integer,
          timeout_ms: Integer,
          wait_for_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # JSON Schema for the returned data object. TypeScript Zod users can pass a JSON
        # Schema generated from a Zod object; Python users can pass the equivalent JSON
        # Schema object.
        schema:,
        # The starting website URL to crawl and extract from. Must include http:// or
        # https://.
        url:,
        # When true, every returned value must be grounded in facts stated on the page;
        # fields that cannot be supported by the page are returned as null/empty. When
        # false (default), the model may make reasonable inferences and derivations from
        # the page content (e.g. ideal customer, competitor analysis, recommendations)
        # while keeping verifiable specifics (names, quotes, URLs, dates, metrics)
        # faithful to the source.
        fact_check: nil,
        # When true, follow links on subdomains of the starting URL's domain.
        follow_subdomains: nil,
        # When true, iframe contents are included in Markdown before extraction.
        include_frames: nil,
        # Optional extraction guidance, such as which facts to prioritize or how to
        # interpret fields in the schema.
        instructions: nil,
        # Return cached scrape results if a prior scrape for the same parameters is
        # younger than this many milliseconds.
        max_age_ms: nil,
        pdf: nil,
        # Soft time budget for the crawl in milliseconds.
        stop_after_ms: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
        # Optional browser wait time in milliseconds after initial page load for each
        # crawled page.
        wait_for_ms: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            schema: T::Hash[Symbol, T.anything],
            url: String,
            fact_check: T::Boolean,
            follow_subdomains: T::Boolean,
            include_frames: T::Boolean,
            instructions: String,
            max_age_ms: Integer,
            pdf: ContextDev::WebExtractParams::Pdf,
            stop_after_ms: Integer,
            timeout_ms: Integer,
            wait_for_ms: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebExtractParams::Pdf,
              ContextDev::Internal::AnyHash
            )
          end

        # Last 1-based PDF page to parse. Must be greater than or equal to start when both
        # are provided.
        sig { returns(T.nilable(Integer)) }
        attr_reader :end_

        sig { params(end_: Integer).void }
        attr_writer :end_

        # When true, PDF pages are fetched and parsed. When false, PDF pages are skipped.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :should_parse

        sig { params(should_parse: T::Boolean).void }
        attr_writer :should_parse

        # First 1-based PDF page to parse.
        sig { returns(T.nilable(Integer)) }
        attr_reader :start

        sig { params(start: Integer).void }
        attr_writer :start

        sig do
          params(
            end_: Integer,
            should_parse: T::Boolean,
            start: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Last 1-based PDF page to parse. Must be greater than or equal to start when both
          # are provided.
          end_: nil,
          # When true, PDF pages are fetched and parsed. When false, PDF pages are skipped.
          should_parse: nil,
          # First 1-based PDF page to parse.
          start: nil
        )
        end

        sig do
          override.returns(
            { end_: Integer, should_parse: T::Boolean, start: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
