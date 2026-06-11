# typed: strong

module ContextDev
  module Models
    class WebSearchResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebSearchResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Echo of the original query (useful when fanout was enabled).
      sig { returns(String) }
      attr_accessor :query

      sig { returns(T::Array[ContextDev::Models::WebSearchResponse::Result]) }
      attr_accessor :results

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
      sig do
        returns(T.nilable(ContextDev::Models::WebSearchResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebSearchResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          query: String,
          results:
            T::Array[ContextDev::Models::WebSearchResponse::Result::OrHash],
          key_metadata:
            ContextDev::Models::WebSearchResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Echo of the original query (useful when fanout was enabled).
        query:,
        results:,
        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            query: String,
            results: T::Array[ContextDev::Models::WebSearchResponse::Result],
            key_metadata: ContextDev::Models::WebSearchResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Result < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebSearchResponse::Result,
              ContextDev::Internal::AnyHash
            )
          end

        # Snippet excerpt from the page.
        sig { returns(String) }
        attr_accessor :description

        # Markdown scrape status and content for this result.
        sig { returns(ContextDev::Models::WebSearchResponse::Result::Markdown) }
        attr_reader :markdown

        sig do
          params(
            markdown:
              ContextDev::Models::WebSearchResponse::Result::Markdown::OrHash
          ).void
        end
        attr_writer :markdown

        # Relevance to the original query.
        sig do
          returns(
            ContextDev::Models::WebSearchResponse::Result::Relevance::TaggedSymbol
          )
        end
        attr_accessor :relevance

        # Page title.
        sig { returns(String) }
        attr_accessor :title

        # Canonical result URL.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            description: String,
            markdown:
              ContextDev::Models::WebSearchResponse::Result::Markdown::OrHash,
            relevance:
              ContextDev::Models::WebSearchResponse::Result::Relevance::OrSymbol,
            title: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Snippet excerpt from the page.
          description:,
          # Markdown scrape status and content for this result.
          markdown:,
          # Relevance to the original query.
          relevance:,
          # Page title.
          title:,
          # Canonical result URL.
          url:
        )
        end

        sig do
          override.returns(
            {
              description: String,
              markdown: ContextDev::Models::WebSearchResponse::Result::Markdown,
              relevance:
                ContextDev::Models::WebSearchResponse::Result::Relevance::TaggedSymbol,
              title: String,
              url: String
            }
          )
        end
        def to_hash
        end

        class Markdown < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebSearchResponse::Result::Markdown,
                ContextDev::Internal::AnyHash
              )
            end

          # Per-result scrape outcome. Inspect this before reading `markdown`.
          sig do
            returns(
              ContextDev::Models::WebSearchResponse::Result::Markdown::Code::TaggedSymbol
            )
          end
          attr_accessor :code

          # GFM Markdown of the page. Null unless markdownOptions.enabled is true and
          # scraping succeeded.
          sig { returns(T.nilable(String)) }
          attr_accessor :markdown

          # Markdown scrape status and content for this result.
          sig do
            params(
              code:
                ContextDev::Models::WebSearchResponse::Result::Markdown::Code::OrSymbol,
              markdown: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Per-result scrape outcome. Inspect this before reading `markdown`.
            code:,
            # GFM Markdown of the page. Null unless markdownOptions.enabled is true and
            # scraping succeeded.
            markdown:
          )
          end

          sig do
            override.returns(
              {
                code:
                  ContextDev::Models::WebSearchResponse::Result::Markdown::Code::TaggedSymbol,
                markdown: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Per-result scrape outcome. Inspect this before reading `markdown`.
          module Code
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::WebSearchResponse::Result::Markdown::Code
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUCCESS =
              T.let(
                :SUCCESS,
                ContextDev::Models::WebSearchResponse::Result::Markdown::Code::TaggedSymbol
              )
            NOT_REQUESTED =
              T.let(
                :NOT_REQUESTED,
                ContextDev::Models::WebSearchResponse::Result::Markdown::Code::TaggedSymbol
              )
            TIMEOUT =
              T.let(
                :TIMEOUT,
                ContextDev::Models::WebSearchResponse::Result::Markdown::Code::TaggedSymbol
              )
            WEBSITE_ACCESS_ERROR =
              T.let(
                :WEBSITE_ACCESS_ERROR,
                ContextDev::Models::WebSearchResponse::Result::Markdown::Code::TaggedSymbol
              )
            ERROR =
              T.let(
                :ERROR,
                ContextDev::Models::WebSearchResponse::Result::Markdown::Code::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::WebSearchResponse::Result::Markdown::Code::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # Relevance to the original query.
        module Relevance
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebSearchResponse::Result::Relevance
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIGH =
            T.let(
              :high,
              ContextDev::Models::WebSearchResponse::Result::Relevance::TaggedSymbol
            )
          MEDIUM =
            T.let(
              :medium,
              ContextDev::Models::WebSearchResponse::Result::Relevance::TaggedSymbol
            )
          LOW =
            T.let(
              :low,
              ContextDev::Models::WebSearchResponse::Result::Relevance::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebSearchResponse::Result::Relevance::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebSearchResponse::KeyMetadata,
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
