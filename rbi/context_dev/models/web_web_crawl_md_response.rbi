# typed: strong

module ContextDev
  module Models
    class WebWebCrawlMdResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebWebCrawlMdResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(ContextDev::Models::WebWebCrawlMdResponse::Metadata) }
      attr_reader :metadata

      sig do
        params(
          metadata: ContextDev::Models::WebWebCrawlMdResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      sig do
        returns(T::Array[ContextDev::Models::WebWebCrawlMdResponse::Result])
      end
      attr_accessor :results

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
      sig do
        returns(
          T.nilable(ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          metadata: ContextDev::Models::WebWebCrawlMdResponse::Metadata::OrHash,
          results:
            T::Array[ContextDev::Models::WebWebCrawlMdResponse::Result::OrHash],
          key_metadata:
            ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        metadata:,
        results:,
        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            metadata: ContextDev::Models::WebWebCrawlMdResponse::Metadata,
            results:
              T::Array[ContextDev::Models::WebWebCrawlMdResponse::Result],
            key_metadata: ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Metadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebCrawlMdResponse::Metadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Maximum crawl depth reached during the crawl
        sig { returns(Integer) }
        attr_accessor :max_crawl_depth

        # Number of pages that failed to crawl
        sig { returns(Integer) }
        attr_accessor :num_failed

        # Number of URLs skipped (PDFs when pdf.shouldParse=false, or URLs not matching
        # urlRegex)
        sig { returns(Integer) }
        attr_accessor :num_skipped

        # Number of pages successfully crawled
        sig { returns(Integer) }
        attr_accessor :num_succeeded

        # Total number of URLs crawled
        sig { returns(Integer) }
        attr_accessor :num_urls

        sig do
          params(
            max_crawl_depth: Integer,
            num_failed: Integer,
            num_skipped: Integer,
            num_succeeded: Integer,
            num_urls: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Maximum crawl depth reached during the crawl
          max_crawl_depth:,
          # Number of pages that failed to crawl
          num_failed:,
          # Number of URLs skipped (PDFs when pdf.shouldParse=false, or URLs not matching
          # urlRegex)
          num_skipped:,
          # Number of pages successfully crawled
          num_succeeded:,
          # Total number of URLs crawled
          num_urls:
        )
        end

        sig do
          override.returns(
            {
              max_crawl_depth: Integer,
              num_failed: Integer,
              num_skipped: Integer,
              num_succeeded: Integer,
              num_urls: Integer
            }
          )
        end
        def to_hash
        end
      end

      class Result < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebCrawlMdResponse::Result,
              ContextDev::Internal::AnyHash
            )
          end

        # Extracted page content as Markdown (empty string on failure)
        sig { returns(String) }
        attr_accessor :markdown

        sig do
          returns(ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata)
        end
        attr_reader :metadata

        sig do
          params(
            metadata:
              ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OrHash
          ).void
        end
        attr_writer :metadata

        sig do
          params(
            markdown: String,
            metadata:
              ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Extracted page content as Markdown (empty string on failure)
          markdown:,
          metadata:
        )
        end

        sig do
          override.returns(
            {
              markdown: String,
              metadata:
                ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata
            }
          )
        end
        def to_hash
        end

        class Metadata < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata,
                ContextDev::Internal::AnyHash
              )
            end

          # Depth relative to the start URL. 0 = start URL, 1 = one link away.
          sig { returns(Integer) }
          attr_accessor :crawl_depth

          # Final URL scraped after redirects or scraper fallback, when known. Falls back to
          # sourceUrl when unavailable.
          sig { returns(String) }
          attr_accessor :final_url

          # Original URL requested by the caller.
          sig { returns(String) }
          attr_accessor :source_url

          # HTTP status code of the response
          sig { returns(Integer) }
          attr_accessor :status_code

          # true if the page was fetched and parsed successfully
          sig { returns(T::Boolean) }
          attr_accessor :success

          # Best page title extracted from the page (empty string if unavailable).
          sig { returns(String) }
          attr_accessor :title

          # The crawl URL fetched for this page.
          sig { returns(String) }
          attr_accessor :url

          # Additional non-social meta tags not promoted to top-level metadata fields.
          sig do
            returns(
              T.nilable(
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::AdditionalMeta::Variants
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
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::AdditionalMeta::Variants
                ]
            ).void
          end
          attr_writer :additional_meta

          # Resolved alternate links from link rel=alternate tags.
          sig do
            returns(
              T.nilable(
                T::Array[
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate
                ]
              )
            )
          end
          attr_reader :alternates

          sig do
            params(
              alternates:
                T::Array[
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate::OrHash
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
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OpenGraph::Variants
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
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OpenGraph::Variants
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

          # Twitter card metadata with the twitter: prefix removed and keys camel-cased.
          sig do
            returns(
              T.nilable(
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Twitter::Variants
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
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Twitter::Variants
                ]
            ).void
          end
          attr_writer :twitter

          sig do
            params(
              crawl_depth: Integer,
              final_url: String,
              source_url: String,
              status_code: Integer,
              success: T::Boolean,
              title: String,
              url: String,
              additional_meta:
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::AdditionalMeta::Variants
                ],
              alternates:
                T::Array[
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate::OrHash
                ],
              author: String,
              canonical_url: String,
              description: String,
              favicon: String,
              image: String,
              json_ld: T::Array[T::Hash[Symbol, T.anything]],
              keywords: T::Array[String],
              language: String,
              modified_time: String,
              open_graph:
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OpenGraph::Variants
                ],
              published_time: String,
              robots: String,
              site_name: String,
              twitter:
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Twitter::Variants
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Depth relative to the start URL. 0 = start URL, 1 = one link away.
            crawl_depth:,
            # Final URL scraped after redirects or scraper fallback, when known. Falls back to
            # sourceUrl when unavailable.
            final_url:,
            # Original URL requested by the caller.
            source_url:,
            # HTTP status code of the response
            status_code:,
            # true if the page was fetched and parsed successfully
            success:,
            # Best page title extracted from the page (empty string if unavailable).
            title:,
            # The crawl URL fetched for this page.
            url:,
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
            # Twitter card metadata with the twitter: prefix removed and keys camel-cased.
            twitter: nil
          )
          end

          sig do
            override.returns(
              {
                crawl_depth: Integer,
                final_url: String,
                source_url: String,
                status_code: Integer,
                success: T::Boolean,
                title: String,
                url: String,
                additional_meta:
                  T::Hash[
                    Symbol,
                    ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::AdditionalMeta::Variants
                  ],
                alternates:
                  T::Array[
                    ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate
                  ],
                author: String,
                canonical_url: String,
                description: String,
                favicon: String,
                image: String,
                json_ld: T::Array[T::Hash[Symbol, T.anything]],
                keywords: T::Array[String],
                language: String,
                modified_time: String,
                open_graph:
                  T::Hash[
                    Symbol,
                    ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OpenGraph::Variants
                  ],
                published_time: String,
                robots: String,
                site_name: String,
                twitter:
                  T::Hash[
                    Symbol,
                    ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Twitter::Variants
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
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::AdditionalMeta::Variants
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
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Alternate,
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
                { href: String, hreflang: String, title: String, type: String }
              )
            end
            def to_hash
            end
          end

          module OpenGraph
            extend ContextDev::Internal::Type::Union

            Variants = T.type_alias { T.any(String, T::Array[String]) }

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::OpenGraph::Variants
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
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Twitter::Variants
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

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata,
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
