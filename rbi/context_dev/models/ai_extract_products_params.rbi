# typed: strong

module ContextDev
  module Models
    class AIExtractProductsParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::AIExtractProductsParams,
            ContextDev::Internal::AnyHash
          )
        end

      sig do
        returns(
          T.any(
            ContextDev::AIExtractProductsParams::Body::ByDomain,
            ContextDev::AIExtractProductsParams::Body::ByDirectURL
          )
        )
      end
      attr_accessor :body

      sig do
        params(
          body:
            T.any(
              ContextDev::AIExtractProductsParams::Body::ByDomain::OrHash,
              ContextDev::AIExtractProductsParams::Body::ByDirectURL::OrHash
            ),
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(body:, request_options: {})
      end

      sig do
        override.returns(
          {
            body:
              T.any(
                ContextDev::AIExtractProductsParams::Body::ByDomain,
                ContextDev::AIExtractProductsParams::Body::ByDirectURL
              ),
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Body
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::AIExtractProductsParams::Body::ByDomain,
              ContextDev::AIExtractProductsParams::Body::ByDirectURL
            )
          end

        class ByDomain < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::AIExtractProductsParams::Body::ByDomain,
                ContextDev::Internal::AnyHash
              )
            end

          # The domain name to analyze.
          sig { returns(String) }
          attr_accessor :domain

          # Return a cached result if a prior scrape for the same parameters exists and is
          # younger than this many milliseconds. Defaults to 7 days (604800000 ms) when
          # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_age_ms

          sig { params(max_age_ms: Integer).void }
          attr_writer :max_age_ms

          # Maximum number of products to extract.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_products

          sig { params(max_products: Integer).void }
          attr_writer :max_products

          # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          # Optional request deadline and behavior on timeout. For GET requests, use
          # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
          # timeoutOpts object.
          sig do
            returns(
              T.nilable(
                ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts
              )
            )
          end
          attr_reader :timeout_opts

          sig do
            params(
              timeout_opts:
                ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::OrHash
            ).void
          end
          attr_writer :timeout_opts

          sig do
            params(
              domain: String,
              max_age_ms: Integer,
              max_products: Integer,
              tags: T::Array[String],
              timeout_opts:
                ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The domain name to analyze.
            domain:,
            # Return a cached result if a prior scrape for the same parameters exists and is
            # younger than this many milliseconds. Defaults to 7 days (604800000 ms) when
            # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
            max_age_ms: nil,
            # Maximum number of products to extract.
            max_products: nil,
            # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
            tags: nil,
            # Optional request deadline and behavior on timeout. For GET requests, use
            # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
            # timeoutOpts object.
            timeout_opts: nil
          )
          end

          sig do
            override.returns(
              {
                domain: String,
                max_age_ms: Integer,
                max_products: Integer,
                tags: T::Array[String],
                timeout_opts:
                  ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts
              }
            )
          end
          def to_hash
          end

          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts,
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
                  ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior::OrSymbol
                )
              )
            end
            attr_reader :behavior

            sig do
              params(
                behavior:
                  ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior::OrSymbol
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
                  ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior::OrSymbol
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
                    ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior::OrSymbol
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
                    ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FAIL =
                T.let(
                  :fail,
                  ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior::TaggedSymbol
                )
              RETURN_PARTIAL =
                T.let(
                  :"return-partial",
                  ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::AIExtractProductsParams::Body::ByDomain::TimeoutOpts::Behavior::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ByDirectURL < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::AIExtractProductsParams::Body::ByDirectURL,
                ContextDev::Internal::AnyHash
              )
            end

          # A specific URL to use directly as the starting point for extraction without
          # domain resolution.
          sig { returns(String) }
          attr_accessor :direct_url

          # Return a cached result if a prior scrape for the same parameters exists and is
          # younger than this many milliseconds. Defaults to 7 days (604800000 ms) when
          # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_age_ms

          sig { params(max_age_ms: Integer).void }
          attr_writer :max_age_ms

          # Maximum number of products to extract.
          sig { returns(T.nilable(Integer)) }
          attr_reader :max_products

          sig { params(max_products: Integer).void }
          attr_writer :max_products

          # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :tags

          sig { params(tags: T::Array[String]).void }
          attr_writer :tags

          # Optional request deadline and behavior on timeout. For GET requests, use
          # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
          # timeoutOpts object.
          sig do
            returns(
              T.nilable(
                ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts
              )
            )
          end
          attr_reader :timeout_opts

          sig do
            params(
              timeout_opts:
                ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::OrHash
            ).void
          end
          attr_writer :timeout_opts

          sig do
            params(
              direct_url: String,
              max_age_ms: Integer,
              max_products: Integer,
              tags: T::Array[String],
              timeout_opts:
                ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # A specific URL to use directly as the starting point for extraction without
            # domain resolution.
            direct_url:,
            # Return a cached result if a prior scrape for the same parameters exists and is
            # younger than this many milliseconds. Defaults to 7 days (604800000 ms) when
            # omitted. Max is 30 days (2592000000 ms). Set to 0 to always scrape fresh.
            max_age_ms: nil,
            # Maximum number of products to extract.
            max_products: nil,
            # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
            tags: nil,
            # Optional request deadline and behavior on timeout. For GET requests, use
            # timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
            # timeoutOpts object.
            timeout_opts: nil
          )
          end

          sig do
            override.returns(
              {
                direct_url: String,
                max_age_ms: Integer,
                max_products: Integer,
                tags: T::Array[String],
                timeout_opts:
                  ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts
              }
            )
          end
          def to_hash
          end

          class TimeoutOpts < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts,
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
                  ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior::OrSymbol
                )
              )
            end
            attr_reader :behavior

            sig do
              params(
                behavior:
                  ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior::OrSymbol
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
                  ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior::OrSymbol
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
                    ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior::OrSymbol
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
                    ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              FAIL =
                T.let(
                  :fail,
                  ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior::TaggedSymbol
                )
              RETURN_PARTIAL =
                T.let(
                  :"return-partial",
                  ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::AIExtractProductsParams::Body::ByDirectURL::TimeoutOpts::Behavior::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::AIExtractProductsParams::Body::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
