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

      sig do
        params(
          query: String,
          results:
            T::Array[ContextDev::Models::WebSearchResponse::Result::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Echo of the original query (useful when fanout was enabled).
        query:,
        results:
      )
      end

      sig do
        override.returns(
          {
            query: String,
            results: T::Array[ContextDev::Models::WebSearchResponse::Result]
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
    end
  end
end
