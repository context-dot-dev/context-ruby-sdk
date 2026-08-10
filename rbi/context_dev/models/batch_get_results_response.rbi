# typed: strong

module ContextDev
  module Models
    class BatchGetResultsResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BatchGetResultsResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Result records on this page.
      sig do
        returns(
          T.nilable(
            T::Array[
              ContextDev::Models::BatchGetResultsResponse::Data::Variants
            ]
          )
        )
      end
      attr_reader :data

      sig do
        params(
          data:
            T::Array[
              T.any(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::OrHash,
                ContextDev::Models::BatchGetResultsResponse::Data::Error::OrHash
              )
            ]
        ).void
      end
      attr_writer :data

      # Whether another page is available.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_more

      sig { params(has_more: T::Boolean).void }
      attr_writer :has_more

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
      sig do
        returns(
          T.nilable(ContextDev::Models::BatchGetResultsResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BatchGetResultsResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Cursor for the next page.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      sig do
        params(
          data:
            T::Array[
              T.any(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::OrHash,
                ContextDev::Models::BatchGetResultsResponse::Data::Error::OrHash
              )
            ],
          has_more: T::Boolean,
          key_metadata:
            ContextDev::Models::BatchGetResultsResponse::KeyMetadata::OrHash,
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Result records on this page.
        data: nil,
        # Whether another page is available.
        has_more: nil,
        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        key_metadata: nil,
        # Cursor for the next page.
        next_cursor: nil
      )
      end

      sig do
        override.returns(
          {
            data:
              T::Array[
                ContextDev::Models::BatchGetResultsResponse::Data::Variants
              ],
            has_more: T::Boolean,
            key_metadata:
              ContextDev::Models::BatchGetResultsResponse::KeyMetadata,
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # One page outcome from a finished batch.
      module Data
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchGetResultsResponse::Data::Ok,
              ContextDev::Models::BatchGetResultsResponse::Data::Error
            )
          end

        class Ok < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok,
                ContextDev::Internal::AnyHash
              )
            end

          # URL the content was read from, after redirects.
          sig { returns(String) }
          attr_accessor :final_url

          # HTTP status of the final response, when known.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :http_status

          # Metadata extracted from the scraped page HTML.
          sig do
            returns(
              ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata
            )
          end
          attr_reader :metadata

          sig do
            params(
              metadata:
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::OrHash
            ).void
          end
          attr_writer :metadata

          # The page was scraped.
          sig { returns(Symbol) }
          attr_accessor :status

          # URL as submitted, or as discovered by the crawl.
          sig { returns(String) }
          attr_accessor :url

          # Page HTML. Present on html batches, and on markdown batches submitted with
          # `options.includeHTML`.
          sig { returns(T.nilable(String)) }
          attr_reader :html

          sig { params(html: String).void }
          attr_writer :html

          # Caller-supplied identifier echoed from submission.
          sig { returns(T.nilable(String)) }
          attr_reader :item_id

          sig { params(item_id: String).void }
          attr_writer :item_id

          # Page content as Markdown. Present on markdown batches.
          sig { returns(T.nilable(String)) }
          attr_reader :markdown

          sig { params(markdown: String).void }
          attr_writer :markdown

          # Caller-supplied metadata echoed from submission.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :meta

          sig { params(meta: T::Hash[Symbol, T.anything]).void }
          attr_writer :meta

          # PDF pages of this document recovered by OCR (pdf.ocr=true). Each recovered page
          # bills 1 credit on top of the page base credit; absent when no OCR ran.
          sig { returns(T.nilable(Integer)) }
          attr_reader :ocr_pages

          sig { params(ocr_pages: Integer).void }
          attr_writer :ocr_pages

          # A page the batch fetched successfully.
          sig do
            params(
              final_url: String,
              http_status: T.nilable(Integer),
              metadata:
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::OrHash,
              url: String,
              html: String,
              item_id: String,
              markdown: String,
              meta: T::Hash[Symbol, T.anything],
              ocr_pages: Integer,
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # URL the content was read from, after redirects.
            final_url:,
            # HTTP status of the final response, when known.
            http_status:,
            # Metadata extracted from the scraped page HTML.
            metadata:,
            # URL as submitted, or as discovered by the crawl.
            url:,
            # Page HTML. Present on html batches, and on markdown batches submitted with
            # `options.includeHTML`.
            html: nil,
            # Caller-supplied identifier echoed from submission.
            item_id: nil,
            # Page content as Markdown. Present on markdown batches.
            markdown: nil,
            # Caller-supplied metadata echoed from submission.
            meta: nil,
            # PDF pages of this document recovered by OCR (pdf.ocr=true). Each recovered page
            # bills 1 credit on top of the page base credit; absent when no OCR ran.
            ocr_pages: nil,
            # The page was scraped.
            status: :ok
          )
          end

          sig do
            override.returns(
              {
                final_url: String,
                http_status: T.nilable(Integer),
                metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata,
                status: Symbol,
                url: String,
                html: String,
                item_id: String,
                markdown: String,
                meta: T::Hash[Symbol, T.anything],
                ocr_pages: Integer
              }
            )
          end
          def to_hash
          end

          class Metadata < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata,
                  ContextDev::Internal::AnyHash
                )
              end

            # Final URL scraped after redirects or scraper fallback, when known. Falls back to
            # sourceUrl when unavailable.
            sig { returns(String) }
            attr_accessor :final_url

            # Original URL requested by the caller.
            sig { returns(String) }
            attr_accessor :source_url

            # Additional non-social meta tags not promoted to top-level metadata fields.
            sig do
              returns(
                T.nilable(
                  T::Hash[
                    Symbol,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::AdditionalMeta::Variants
                  ]
                )
              )
            end
            attr_reader :additional_meta

            sig do
              params(
                additional_meta:
                  T::Hash[
                    Symbol,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::AdditionalMeta::Variants
                  ]
              ).void
            end
            attr_writer :additional_meta

            # Resolved alternate links from link rel=alternate tags.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Alternate
                  ]
                )
              )
            end
            attr_reader :alternates

            sig do
              params(
                alternates:
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Alternate::OrHash
                  ]
              ).void
            end
            attr_writer :alternates

            # Author metadata, when present.
            sig { returns(T.nilable(String)) }
            attr_reader :author

            sig { params(author: String).void }
            attr_writer :author

            # Resolved canonical URL, when present.
            sig { returns(T.nilable(String)) }
            attr_reader :canonical_url

            sig { params(canonical_url: String).void }
            attr_writer :canonical_url

            # Best description extracted from standard, Open Graph, or Twitter metadata.
            sig { returns(T.nilable(String)) }
            attr_reader :description

            sig { params(description: String).void }
            attr_writer :description

            # Resolved favicon URL, when present.
            sig { returns(T.nilable(String)) }
            attr_reader :favicon

            sig { params(favicon: String).void }
            attr_writer :favicon

            # Page headings (h1–h6) in document order, extracted from the unfiltered document.
            # Capped at the first 500 headings. Omitted when the page has none.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Heading
                  ]
                )
              )
            end
            attr_reader :headings

            sig do
              params(
                headings:
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Heading::OrHash
                  ]
              ).void
            end
            attr_writer :headings

            # Primary resolved preview image from Open Graph, Twitter, or image metadata.
            sig { returns(T.nilable(String)) }
            attr_reader :image

            sig { params(image: String).void }
            attr_writer :image

            # JSON-LD structured data blocks parsed from the page.
            sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
            attr_reader :json_ld

            sig { params(json_ld: T::Array[T::Hash[Symbol, T.anything]]).void }
            attr_writer :json_ld

            # Keywords extracted from the page's keywords meta tag.
            sig { returns(T.nilable(T::Array[String])) }
            attr_reader :keywords

            sig { params(keywords: T::Array[String]).void }
            attr_writer :keywords

            # Language extracted from html lang or language meta tags.
            sig { returns(T.nilable(String)) }
            attr_reader :language

            sig { params(language: String).void }
            attr_writer :language

            # Modified timestamp/date from page metadata, when present.
            sig { returns(T.nilable(String)) }
            attr_reader :modified_time

            sig { params(modified_time: String).void }
            attr_writer :modified_time

            # Open Graph metadata with the og: prefix removed and keys camel-cased.
            sig do
              returns(
                T.nilable(
                  T::Hash[
                    Symbol,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::OpenGraph::Variants
                  ]
                )
              )
            end
            attr_reader :open_graph

            sig do
              params(
                open_graph:
                  T::Hash[
                    Symbol,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::OpenGraph::Variants
                  ]
              ).void
            end
            attr_writer :open_graph

            # Published timestamp/date from page metadata, when present.
            sig { returns(T.nilable(String)) }
            attr_reader :published_time

            sig { params(published_time: String).void }
            attr_writer :published_time

            # Robots meta directive, when present.
            sig { returns(T.nilable(String)) }
            attr_reader :robots

            sig { params(robots: String).void }
            attr_writer :robots

            # Site or application name from page metadata.
            sig { returns(T.nilable(String)) }
            attr_reader :site_name

            sig { params(site_name: String).void }
            attr_writer :site_name

            # Best title extracted from the page.
            sig { returns(T.nilable(String)) }
            attr_reader :title

            sig { params(title: String).void }
            attr_writer :title

            # Twitter card metadata with the twitter: prefix removed and keys camel-cased.
            sig do
              returns(
                T.nilable(
                  T::Hash[
                    Symbol,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Twitter::Variants
                  ]
                )
              )
            end
            attr_reader :twitter

            sig do
              params(
                twitter:
                  T::Hash[
                    Symbol,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Twitter::Variants
                  ]
              ).void
            end
            attr_writer :twitter

            # Metadata extracted from the scraped page HTML.
            sig do
              params(
                final_url: String,
                source_url: String,
                additional_meta:
                  T::Hash[
                    Symbol,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::AdditionalMeta::Variants
                  ],
                alternates:
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Alternate::OrHash
                  ],
                author: String,
                canonical_url: String,
                description: String,
                favicon: String,
                headings:
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Heading::OrHash
                  ],
                image: String,
                json_ld: T::Array[T::Hash[Symbol, T.anything]],
                keywords: T::Array[String],
                language: String,
                modified_time: String,
                open_graph:
                  T::Hash[
                    Symbol,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::OpenGraph::Variants
                  ],
                published_time: String,
                robots: String,
                site_name: String,
                title: String,
                twitter:
                  T::Hash[
                    Symbol,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Twitter::Variants
                  ]
              ).returns(T.attached_class)
            end
            def self.new(
              # Final URL scraped after redirects or scraper fallback, when known. Falls back to
              # sourceUrl when unavailable.
              final_url:,
              # Original URL requested by the caller.
              source_url:,
              # Additional non-social meta tags not promoted to top-level metadata fields.
              additional_meta: nil,
              # Resolved alternate links from link rel=alternate tags.
              alternates: nil,
              # Author metadata, when present.
              author: nil,
              # Resolved canonical URL, when present.
              canonical_url: nil,
              # Best description extracted from standard, Open Graph, or Twitter metadata.
              description: nil,
              # Resolved favicon URL, when present.
              favicon: nil,
              # Page headings (h1–h6) in document order, extracted from the unfiltered document.
              # Capped at the first 500 headings. Omitted when the page has none.
              headings: nil,
              # Primary resolved preview image from Open Graph, Twitter, or image metadata.
              image: nil,
              # JSON-LD structured data blocks parsed from the page.
              json_ld: nil,
              # Keywords extracted from the page's keywords meta tag.
              keywords: nil,
              # Language extracted from html lang or language meta tags.
              language: nil,
              # Modified timestamp/date from page metadata, when present.
              modified_time: nil,
              # Open Graph metadata with the og: prefix removed and keys camel-cased.
              open_graph: nil,
              # Published timestamp/date from page metadata, when present.
              published_time: nil,
              # Robots meta directive, when present.
              robots: nil,
              # Site or application name from page metadata.
              site_name: nil,
              # Best title extracted from the page.
              title: nil,
              # Twitter card metadata with the twitter: prefix removed and keys camel-cased.
              twitter: nil
            )
            end

            sig do
              override.returns(
                {
                  final_url: String,
                  source_url: String,
                  additional_meta:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::AdditionalMeta::Variants
                    ],
                  alternates:
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Alternate
                    ],
                  author: String,
                  canonical_url: String,
                  description: String,
                  favicon: String,
                  headings:
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Heading
                    ],
                  image: String,
                  json_ld: T::Array[T::Hash[Symbol, T.anything]],
                  keywords: T::Array[String],
                  language: String,
                  modified_time: String,
                  open_graph:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::OpenGraph::Variants
                    ],
                  published_time: String,
                  robots: String,
                  site_name: String,
                  title: String,
                  twitter:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Twitter::Variants
                    ]
                }
              )
            end
            def to_hash
            end

            module AdditionalMeta
              extend ContextDev::Internal::Type::Union

              Variants = T.type_alias { T.any(String, T::Array[String]) }

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::AdditionalMeta::Variants
                  ]
                )
              end
              def self.variants
              end

              StringArray =
                T.let(
                  ContextDev::Internal::Type::ArrayOf[String],
                  ContextDev::Internal::Type::Converter
                )
            end

            class Alternate < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Alternate,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Resolved alternate URL.
              sig { returns(String) }
              attr_accessor :href

              # Language or locale for the alternate URL, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :hreflang

              sig { params(hreflang: String).void }
              attr_writer :hreflang

              # Alternate resource title, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :title

              sig { params(title: String).void }
              attr_writer :title

              # Alternate resource MIME type, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :type

              sig { params(type: String).void }
              attr_writer :type

              sig do
                params(
                  href: String,
                  hreflang: String,
                  title: String,
                  type: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Resolved alternate URL.
                href:,
                # Language or locale for the alternate URL, when present.
                hreflang: nil,
                # Alternate resource title, when present.
                title: nil,
                # Alternate resource MIME type, when present.
                type: nil
              )
              end

              sig do
                override.returns(
                  {
                    href: String,
                    hreflang: String,
                    title: String,
                    type: String
                  }
                )
              end
              def to_hash
              end
            end

            class Heading < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Heading,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Heading level, 1–6 (from h1–h6).
              sig { returns(Integer) }
              attr_accessor :level

              # Heading text with whitespace collapsed, truncated to 1000 characters.
              sig { returns(String) }
              attr_accessor :text

              sig do
                params(level: Integer, text: String).returns(T.attached_class)
              end
              def self.new(
                # Heading level, 1–6 (from h1–h6).
                level:,
                # Heading text with whitespace collapsed, truncated to 1000 characters.
                text:
              )
              end

              sig { override.returns({ level: Integer, text: String }) }
              def to_hash
              end
            end

            module OpenGraph
              extend ContextDev::Internal::Type::Union

              Variants = T.type_alias { T.any(String, T::Array[String]) }

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::OpenGraph::Variants
                  ]
                )
              end
              def self.variants
              end

              StringArray =
                T.let(
                  ContextDev::Internal::Type::ArrayOf[String],
                  ContextDev::Internal::Type::Converter
                )
            end

            module Twitter
              extend ContextDev::Internal::Type::Union

              Variants = T.type_alias { T.any(String, T::Array[String]) }

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Metadata::Twitter::Variants
                  ]
                )
              end
              def self.variants
              end

              StringArray =
                T.let(
                  ContextDev::Internal::Type::ArrayOf[String],
                  ContextDev::Internal::Type::Converter
                )
            end
          end
        end

        class Error < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchGetResultsResponse::Data::Error,
                ContextDev::Internal::AnyHash
              )
            end

          # Why the page failed.
          sig { returns(String) }
          attr_accessor :error_code

          # Human-readable failure detail.
          sig { returns(String) }
          attr_accessor :message

          # The page could not be scraped.
          sig { returns(Symbol) }
          attr_accessor :status

          # URL as submitted, or as discovered by the crawl.
          sig { returns(String) }
          attr_accessor :url

          # Caller-supplied identifier echoed from submission.
          sig { returns(T.nilable(String)) }
          attr_reader :item_id

          sig { params(item_id: String).void }
          attr_writer :item_id

          # Caller-supplied metadata echoed from submission.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :meta

          sig { params(meta: T::Hash[Symbol, T.anything]).void }
          attr_writer :meta

          # A page the batch could not fetch.
          sig do
            params(
              error_code: String,
              message: String,
              url: String,
              item_id: String,
              meta: T::Hash[Symbol, T.anything],
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Why the page failed.
            error_code:,
            # Human-readable failure detail.
            message:,
            # URL as submitted, or as discovered by the crawl.
            url:,
            # Caller-supplied identifier echoed from submission.
            item_id: nil,
            # Caller-supplied metadata echoed from submission.
            meta: nil,
            # The page could not be scraped.
            status: :error
          )
          end

          sig do
            override.returns(
              {
                error_code: String,
                message: String,
                status: Symbol,
                url: String,
                item_id: String,
                meta: T::Hash[Symbol, T.anything]
              }
            )
          end
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchGetResultsResponse::Data::Variants
            ]
          )
        end
        def self.variants
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchGetResultsResponse::KeyMetadata,
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
