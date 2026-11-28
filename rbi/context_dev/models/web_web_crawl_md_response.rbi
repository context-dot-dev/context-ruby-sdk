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

      # Cache status of this response.
      sig { returns(ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata) }
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      sig { returns(ContextDev::Models::WebWebCrawlMdResponse::Metadata) }
      attr_reader :metadata

      sig do
        params(
          metadata: ContextDev::Models::WebWebCrawlMdResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      sig do
        returns(T::Array[ContextDev::Models::WebWebCrawlMdResponse::Result])
      end
      attr_accessor :results

      # Credits this request used and your remaining balance.
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

      # `true` when the deadline passed with `timeoutOpts.behavior` set to
      # `return-partial`. Only results finished in time are included. Partial results
      # are not cached.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :partial

      sig { params(partial: T::Boolean).void }
      attr_writer :partial

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::OrHash,
          metadata: ContextDev::Models::WebWebCrawlMdResponse::Metadata::OrHash,
          request_id: String,
          results:
            T::Array[ContextDev::Models::WebWebCrawlMdResponse::Result::OrHash],
          key_metadata:
            ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata::OrHash,
          partial: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Cache status of this response.
        cache_metadata:,
        metadata:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        results:,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # `true` when the deadline passed with `timeoutOpts.behavior` set to
        # `return-partial`. Only results finished in time are included. Partial results
        # are not cached.
        partial: nil
      )
      end

      sig do
        override.returns(
          {
            cache_metadata:
              ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata,
            metadata: ContextDev::Models::WebWebCrawlMdResponse::Metadata,
            request_id: String,
            results:
              T::Array[ContextDev::Models::WebWebCrawlMdResponse::Result],
            key_metadata:
              ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata,
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
              ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        sig { returns(Integer) }
        attr_accessor :age_ms

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
        sig do
          returns(
            ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Cache status of this response.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
          age_ms:,
          # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
          # retention bypassed the cache.
          status:
        )
        end

        sig do
          override.returns(
            {
              age_ms: Integer,
              status:
                ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Metadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebCrawlMdResponse::Metadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Deepest link depth reached.
        sig { returns(Integer) }
        attr_accessor :max_crawl_depth

        # Number of pages that failed.
        sig { returns(Integer) }
        attr_accessor :num_failed

        # Number of URLs skipped: PDFs when `pdf.shouldParse` is `false`, URLs that do not
        # match `urlRegex`, and URLs that match `excludeUrlRegex`.
        sig { returns(Integer) }
        attr_accessor :num_skipped

        # Number of pages crawled successfully.
        sig { returns(Integer) }
        attr_accessor :num_succeeded

        # Number of URLs crawled.
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
          # Deepest link depth reached.
          max_crawl_depth:,
          # Number of pages that failed.
          num_failed:,
          # Number of URLs skipped: PDFs when `pdf.shouldParse` is `false`, URLs that do not
          # match `urlRegex`, and URLs that match `excludeUrlRegex`.
          num_skipped:,
          # Number of pages crawled successfully.
          num_succeeded:,
          # Number of URLs crawled.
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

        # Page content as Markdown. Empty string when the page failed.
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
          # Page content as Markdown. Empty string when the page failed.
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

          # Link depth from the start URL. `0` is the start URL, `1` is one link away.
          sig { returns(Integer) }
          attr_accessor :crawl_depth

          # URL that was scraped, after redirects. Same as `sourceUrl` when unknown.
          sig { returns(String) }
          attr_accessor :final_url

          # URL that was requested, before redirects.
          sig { returns(String) }
          attr_accessor :source_url

          # HTTP status code of the page. `0` when the page could not be retrieved.
          sig { returns(Integer) }
          attr_accessor :status_code

          # Whether the page was fetched and parsed.
          sig { returns(T::Boolean) }
          attr_accessor :success

          # Page title. Empty string when unavailable.
          sig { returns(String) }
          attr_accessor :title

          # URL fetched for this page.
          sig { returns(String) }
          attr_accessor :url

          # Other non-social meta tags that don't have their own field.
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

          # Alternate links from `link rel="alternate"` tags, as absolute URLs.
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

          # Author, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :author

          sig { params(author: String).void }
          attr_writer :author

          # Absolute canonical URL, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :canonical_url

          sig { params(canonical_url: String).void }
          attr_writer :canonical_url

          # Best available description, from standard, Open Graph, or Twitter meta tags.
          sig { returns(T.nilable(String)) }
          attr_reader :description

          sig { params(description: String).void }
          attr_writer :description

          # Why the page failed. Present only when `success` is `false`: `WEBSITE_BLOCKED`
          # (the site served an anti-bot challenge or access wall), `WEBSITE_ACCESS_ERROR`
          # (the page could not be retrieved or had no usable content), `NOT_FOUND`,
          # `UNSUPPORTED_CONTENT`, `NO_PUBLISHED_MARKDOWN`, or `INTERNAL_ERROR`.
          sig { returns(T.nilable(String)) }
          attr_reader :error_code

          sig { params(error_code: String).void }
          attr_writer :error_code

          # Absolute favicon URL, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :favicon

          sig { params(favicon: String).void }
          attr_writer :favicon

          # Headings (`h1` to `h6`) in document order, from the full page before any
          # filtering. Up to 500. Omitted when the page has none.
          sig do
            returns(
              T.nilable(
                T::Array[
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading
                ]
              )
            )
          end
          attr_reader :headings

          sig do
            params(
              headings:
                T::Array[
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading::OrHash
                ]
            ).void
          end
          attr_writer :headings

          # Main preview image URL, from Open Graph, Twitter, or image meta tags.
          sig { returns(T.nilable(String)) }
          attr_reader :image

          sig { params(image: String).void }
          attr_writer :image

          # JSON-LD structured data blocks parsed from the page.
          sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
          attr_reader :json_ld

          sig { params(json_ld: T::Array[T::Hash[Symbol, T.anything]]).void }
          attr_writer :json_ld

          # Keywords from the page's `keywords` meta tag.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :keywords

          sig { params(keywords: T::Array[String]).void }
          attr_writer :keywords

          # Page language, from the `html` `lang` attribute or language meta tags.
          sig { returns(T.nilable(String)) }
          attr_reader :language

          sig { params(language: String).void }
          attr_writer :language

          # Last-modified date or timestamp from page metadata, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :modified_time

          sig { params(modified_time: String).void }
          attr_writer :modified_time

          # Open Graph tags, with the `og:` prefix removed and keys in camelCase.
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

          # Publish date or timestamp from page metadata, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :published_time

          sig { params(published_time: String).void }
          attr_writer :published_time

          # `robots` meta directive, when present.
          sig { returns(T.nilable(String)) }
          attr_reader :robots

          sig { params(robots: String).void }
          attr_writer :robots

          # Site or app name from page metadata.
          sig { returns(T.nilable(String)) }
          attr_reader :site_name

          sig { params(site_name: String).void }
          attr_writer :site_name

          # Twitter card tags, with the `twitter:` prefix removed and keys in camelCase.
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
              error_code: String,
              favicon: String,
              headings:
                T::Array[
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading::OrHash
                ],
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
            # Link depth from the start URL. `0` is the start URL, `1` is one link away.
            crawl_depth:,
            # URL that was scraped, after redirects. Same as `sourceUrl` when unknown.
            final_url:,
            # URL that was requested, before redirects.
            source_url:,
            # HTTP status code of the page. `0` when the page could not be retrieved.
            status_code:,
            # Whether the page was fetched and parsed.
            success:,
            # Page title. Empty string when unavailable.
            title:,
            # URL fetched for this page.
            url:,
            # Other non-social meta tags that don't have their own field.
            additional_meta: nil,
            # Alternate links from `link rel="alternate"` tags, as absolute URLs.
            alternates: nil,
            # Author, when present.
            author: nil,
            # Absolute canonical URL, when present.
            canonical_url: nil,
            # Best available description, from standard, Open Graph, or Twitter meta tags.
            description: nil,
            # Why the page failed. Present only when `success` is `false`: `WEBSITE_BLOCKED`
            # (the site served an anti-bot challenge or access wall), `WEBSITE_ACCESS_ERROR`
            # (the page could not be retrieved or had no usable content), `NOT_FOUND`,
            # `UNSUPPORTED_CONTENT`, `NO_PUBLISHED_MARKDOWN`, or `INTERNAL_ERROR`.
            error_code: nil,
            # Absolute favicon URL, when present.
            favicon: nil,
            # Headings (`h1` to `h6`) in document order, from the full page before any
            # filtering. Up to 500. Omitted when the page has none.
            headings: nil,
            # Main preview image URL, from Open Graph, Twitter, or image meta tags.
            image: nil,
            # JSON-LD structured data blocks parsed from the page.
            json_ld: nil,
            # Keywords from the page's `keywords` meta tag.
            keywords: nil,
            # Page language, from the `html` `lang` attribute or language meta tags.
            language: nil,
            # Last-modified date or timestamp from page metadata, when present.
            modified_time: nil,
            # Open Graph tags, with the `og:` prefix removed and keys in camelCase.
            open_graph: nil,
            # Publish date or timestamp from page metadata, when present.
            published_time: nil,
            # `robots` meta directive, when present.
            robots: nil,
            # Site or app name from page metadata.
            site_name: nil,
            # Twitter card tags, with the `twitter:` prefix removed and keys in camelCase.
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
                error_code: String,
                favicon: String,
                headings:
                  T::Array[
                    ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading
                  ],
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

            # Absolute URL of the alternate version.
            sig { returns(String) }
            attr_accessor :href

            # Language or locale of the alternate version, when present.
            sig { returns(T.nilable(String)) }
            attr_reader :hreflang

            sig { params(hreflang: String).void }
            attr_writer :hreflang

            # Title of the alternate version, when present.
            sig { returns(T.nilable(String)) }
            attr_reader :title

            sig { params(title: String).void }
            attr_writer :title

            # MIME type of the alternate version, when present.
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
              # Absolute URL of the alternate version.
              href:,
              # Language or locale of the alternate version, when present.
              hreflang: nil,
              # Title of the alternate version, when present.
              title: nil,
              # MIME type of the alternate version, when present.
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

          class Heading < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::WebWebCrawlMdResponse::Result::Metadata::Heading,
                  ContextDev::Internal::AnyHash
                )
              end

            # Heading level, from 1 (`h1`) to 6 (`h6`).
            sig { returns(Integer) }
            attr_accessor :level

            # Heading text with whitespace collapsed, truncated to 1000 characters.
            sig { returns(String) }
            attr_accessor :text

            sig do
              params(level: Integer, text: String).returns(T.attached_class)
            end
            def self.new(
              # Heading level, from 1 (`h1`) to 6 (`h6`).
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

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits your organization has left after this request.
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
          # Credits your organization has left after this request.
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
