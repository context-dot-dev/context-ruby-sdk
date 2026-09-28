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

      # Whether this response came from cache.
      sig { returns(ContextDev::Models::WebSearchResponse::CacheMetadata) }
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebSearchResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # Echo of the original query (useful when fanout was enabled).
      sig { returns(String) }
      attr_accessor :query

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      sig { returns(T::Array[ContextDev::Models::WebSearchResponse::Result]) }
      attr_accessor :results

      # Credits this request used and your remaining balance.
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

      # True when timeoutOpts.behavior=return-partial returned the usable results
      # collected before the deadline. Partial collections are not cached as complete
      # results.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :partial

      sig { params(partial: T::Boolean).void }
      attr_writer :partial

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebSearchResponse::CacheMetadata::OrHash,
          query: String,
          request_id: String,
          results:
            T::Array[ContextDev::Models::WebSearchResponse::Result::OrHash],
          key_metadata:
            ContextDev::Models::WebSearchResponse::KeyMetadata::OrHash,
          partial: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether this response came from cache.
        cache_metadata:,
        # Echo of the original query (useful when fanout was enabled).
        query:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        results:,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # True when timeoutOpts.behavior=return-partial returned the usable results
        # collected before the deadline. Partial collections are not cached as complete
        # results.
        partial: nil
      )
      end

      sig do
        override.returns(
          {
            cache_metadata:
              ContextDev::Models::WebSearchResponse::CacheMetadata,
            query: String,
            request_id: String,
            results: T::Array[ContextDev::Models::WebSearchResponse::Result],
            key_metadata: ContextDev::Models::WebSearchResponse::KeyMetadata,
            partial: T::Boolean
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebSearchResponse::CacheMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Age of the cached data in milliseconds. Zero for miss and zdr responses.
        sig { returns(Integer) }
        attr_accessor :age_ms

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        sig do
          returns(
            ContextDev::Models::WebSearchResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Whether this response came from cache.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::WebSearchResponse::CacheMetadata::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Age of the cached data in milliseconds. Zero for miss and zdr responses.
          age_ms:,
          # Whether the response was served from cache, required fresh work, or honored
          # zero-data-retention cache bypass.
          status:
        )
        end

        sig do
          override.returns(
            {
              age_ms: Integer,
              status:
                ContextDev::Models::WebSearchResponse::CacheMetadata::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebSearchResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::WebSearchResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::WebSearchResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::WebSearchResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebSearchResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Result < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebSearchResponse::Result,
              ContextDev::Internal::AnyHash
            )
          end

        # Snippet excerpt from the page. Empty string when the search provider does not
        # supply a snippet.
        sig { returns(String) }
        attr_accessor :description

        # Highlights status and passages for this result.
        sig do
          returns(ContextDev::Models::WebSearchResponse::Result::Highlights)
        end
        attr_reader :highlights

        sig do
          params(
            highlights:
              ContextDev::Models::WebSearchResponse::Result::Highlights::OrHash
          ).void
        end
        attr_writer :highlights

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
            highlights:
              ContextDev::Models::WebSearchResponse::Result::Highlights::OrHash,
            markdown:
              ContextDev::Models::WebSearchResponse::Result::Markdown::OrHash,
            relevance:
              ContextDev::Models::WebSearchResponse::Result::Relevance::OrSymbol,
            title: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Snippet excerpt from the page. Empty string when the search provider does not
          # supply a snippet.
          description:,
          # Highlights status and passages for this result.
          highlights:,
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
              highlights:
                ContextDev::Models::WebSearchResponse::Result::Highlights,
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

        class Highlights < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebSearchResponse::Result::Highlights,
                ContextDev::Internal::AnyHash
              )
            end

          # Per-result highlights outcome. Inspect this before reading `highlights`.
          sig do
            returns(
              ContextDev::Models::WebSearchResponse::Result::Highlights::Code::TaggedSymbol
            )
          end
          attr_accessor :code

          # Passages relevant to the query, in page order. Null unless
          # highlightsOptions.enabled is true and the page was read.
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :highlights

          # Highlights status and passages for this result.
          sig do
            params(
              code:
                ContextDev::Models::WebSearchResponse::Result::Highlights::Code::OrSymbol,
              highlights: T.nilable(T::Array[String])
            ).returns(T.attached_class)
          end
          def self.new(
            # Per-result highlights outcome. Inspect this before reading `highlights`.
            code:,
            # Passages relevant to the query, in page order. Null unless
            # highlightsOptions.enabled is true and the page was read.
            highlights:
          )
          end

          sig do
            override.returns(
              {
                code:
                  ContextDev::Models::WebSearchResponse::Result::Highlights::Code::TaggedSymbol,
                highlights: T.nilable(T::Array[String])
              }
            )
          end
          def to_hash
          end

          # Per-result highlights outcome. Inspect this before reading `highlights`.
          module Code
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::WebSearchResponse::Result::Highlights::Code
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SUCCESS =
              T.let(
                :SUCCESS,
                ContextDev::Models::WebSearchResponse::Result::Highlights::Code::TaggedSymbol
              )
            NOT_REQUESTED =
              T.let(
                :NOT_REQUESTED,
                ContextDev::Models::WebSearchResponse::Result::Highlights::Code::TaggedSymbol
              )
            TIMEOUT =
              T.let(
                :TIMEOUT,
                ContextDev::Models::WebSearchResponse::Result::Highlights::Code::TaggedSymbol
              )
            CONTENT_TOO_LARGE =
              T.let(
                :CONTENT_TOO_LARGE,
                ContextDev::Models::WebSearchResponse::Result::Highlights::Code::TaggedSymbol
              )
            WEBSITE_ACCESS_ERROR =
              T.let(
                :WEBSITE_ACCESS_ERROR,
                ContextDev::Models::WebSearchResponse::Result::Highlights::Code::TaggedSymbol
              )
            ERROR =
              T.let(
                :ERROR,
                ContextDev::Models::WebSearchResponse::Result::Highlights::Code::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::WebSearchResponse::Result::Highlights::Code::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
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

          # `loaded`, or `still-loading` when capture ended before the page finished
          # loading.
          sig do
            returns(
              T.nilable(
                ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState::TaggedSymbol
              )
            )
          end
          attr_reader :final_dom_state

          sig do
            params(
              final_dom_state:
                ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState::OrSymbol
            ).void
          end
          attr_writer :final_dom_state

          # Markdown scrape status and content for this result.
          sig do
            params(
              code:
                ContextDev::Models::WebSearchResponse::Result::Markdown::Code::OrSymbol,
              markdown: T.nilable(String),
              final_dom_state:
                ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Per-result scrape outcome. Inspect this before reading `markdown`.
            code:,
            # GFM Markdown of the page. Null unless markdownOptions.enabled is true and
            # scraping succeeded.
            markdown:,
            # `loaded`, or `still-loading` when capture ended before the page finished
            # loading.
            final_dom_state: nil
          )
          end

          sig do
            override.returns(
              {
                code:
                  ContextDev::Models::WebSearchResponse::Result::Markdown::Code::TaggedSymbol,
                markdown: T.nilable(String),
                final_dom_state:
                  ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState::TaggedSymbol
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
            CONTENT_TOO_LARGE =
              T.let(
                :CONTENT_TOO_LARGE,
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

          # `loaded`, or `still-loading` when capture ended before the page finished
          # loading.
          module FinalDomState
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LOADED =
              T.let(
                :loaded,
                ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState::TaggedSymbol
              )
            STILL_LOADING =
              T.let(
                :"still-loading",
                ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::WebSearchResponse::Result::Markdown::FinalDomState::TaggedSymbol
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
