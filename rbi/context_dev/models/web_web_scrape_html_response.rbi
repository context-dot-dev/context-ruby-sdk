# typed: strong

module ContextDev
  module Models
    class WebWebScrapeHTMLResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebWebScrapeHTMLResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Cache outcome for this response. Composite responses are hits only when every
      # cache-controlled fetch contributing to the output was a hit; age_ms is the
      # oldest contributing hit.
      sig do
        returns(ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata)
      end
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # How complete the returned content is. `loaded` means the page finished the waits
      # the request asked for. `still-loading` only occurs with
      # timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
      # reached first, so the content reflects the DOM at that moment and late-rendering
      # parts may be missing. Partial results are billed at the base request cost.
      sig do
        returns(
          ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState::TaggedSymbol
        )
      end
      attr_accessor :final_dom_state

      # The scraped content of the page. For normal pages this is the raw HTML. When the
      # page is a sitemap or feed served behind an XSL stylesheet (which browsers render
      # into HTML), this is the underlying XML instead — see the `type` field.
      sig { returns(String) }
      attr_accessor :html

      # Metadata extracted from the scraped page HTML.
      sig { returns(ContextDev::Models::WebWebScrapeHTMLResponse::Metadata) }
      attr_reader :metadata

      sig do
        params(
          metadata:
            ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      # Unique id of this API call, also sent in the X-Request-Id response header. Quote
      # it when contacting support about a failed request.
      sig { returns(String) }
      attr_accessor :request_id

      # Indicates success
      sig do
        returns(
          ContextDev::Models::WebWebScrapeHTMLResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      # Detected content type of the returned `html` field. Sitemaps and feeds are
      # surfaced as `xml`; ordinary pages are `html`. Excel workbooks are surfaced as
      # `xlsx`/`xls` with the extracted sheets as HTML tables; PowerPoint presentations
      # are surfaced as `pptx`/`ppt` with the extracted slides as HTML.
      sig do
        returns(
          ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
        )
      end
      attr_accessor :type

      # The URL that was scraped
      sig { returns(String) }
      attr_accessor :url

      # One verified outcome per requested browser action, in request order.
      sig do
        returns(
          T.nilable(
            T::Array[
              ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied
            ]
          )
        )
      end
      attr_reader :actions_applied

      sig do
        params(
          actions_applied:
            T::Array[
              ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::OrHash
            ]
        ).void
      end
      attr_writer :actions_applied

      # True when an action was applied but the returned content could not be refreshed
      # afterward.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :actions_html_stale

      sig { params(actions_html_stale: T::Boolean).void }
      attr_writer :actions_html_stale

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(
          T.nilable(ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::OrHash,
          final_dom_state:
            ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState::OrSymbol,
          html: String,
          metadata:
            ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::OrHash,
          request_id: String,
          success:
            ContextDev::Models::WebWebScrapeHTMLResponse::Success::OrBoolean,
          type: ContextDev::Models::WebWebScrapeHTMLResponse::Type::OrSymbol,
          url: String,
          actions_applied:
            T::Array[
              ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::OrHash
            ],
          actions_html_stale: T::Boolean,
          key_metadata:
            ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        cache_metadata:,
        # How complete the returned content is. `loaded` means the page finished the waits
        # the request asked for. `still-loading` only occurs with
        # timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
        # reached first, so the content reflects the DOM at that moment and late-rendering
        # parts may be missing. Partial results are billed at the base request cost.
        final_dom_state:,
        # The scraped content of the page. For normal pages this is the raw HTML. When the
        # page is a sitemap or feed served behind an XSL stylesheet (which browsers render
        # into HTML), this is the underlying XML instead — see the `type` field.
        html:,
        # Metadata extracted from the scraped page HTML.
        metadata:,
        # Unique id of this API call, also sent in the X-Request-Id response header. Quote
        # it when contacting support about a failed request.
        request_id:,
        # Indicates success
        success:,
        # Detected content type of the returned `html` field. Sitemaps and feeds are
        # surfaced as `xml`; ordinary pages are `html`. Excel workbooks are surfaced as
        # `xlsx`/`xls` with the extracted sheets as HTML tables; PowerPoint presentations
        # are surfaced as `pptx`/`ppt` with the extracted slides as HTML.
        type:,
        # The URL that was scraped
        url:,
        # One verified outcome per requested browser action, in request order.
        actions_applied: nil,
        # True when an action was applied but the returned content could not be refreshed
        # afterward.
        actions_html_stale: nil,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            cache_metadata:
              ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata,
            final_dom_state:
              ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState::TaggedSymbol,
            html: String,
            metadata: ContextDev::Models::WebWebScrapeHTMLResponse::Metadata,
            request_id: String,
            success:
              ContextDev::Models::WebWebScrapeHTMLResponse::Success::TaggedBoolean,
            type:
              ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol,
            url: String,
            actions_applied:
              T::Array[
                ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied
              ],
            actions_html_stale: T::Boolean,
            key_metadata:
              ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata,
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
            ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status::OrSymbol
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
                ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status::TaggedSymbol
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
                ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # How complete the returned content is. `loaded` means the page finished the waits
      # the request asked for. `still-loading` only occurs with
      # timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
      # reached first, so the content reflects the DOM at that moment and late-rendering
      # parts may be missing. Partial results are billed at the base request cost.
      module FinalDomState
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOADED =
          T.let(
            :loaded,
            ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState::TaggedSymbol
          )
        STILL_LOADING =
          T.let(
            :"still-loading",
            ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Metadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebScrapeHTMLResponse::Metadata,
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::AdditionalMeta::Variants
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::AdditionalMeta::Variants
              ]
          ).void
        end
        attr_writer :additional_meta

        # Resolved alternate links from link rel=alternate tags.
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Alternate
              ]
            )
          )
        end
        attr_reader :alternates

        sig do
          params(
            alternates:
              T::Array[
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Alternate::OrHash
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Heading
              ]
            )
          )
        end
        attr_reader :headings

        sig do
          params(
            headings:
              T::Array[
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Heading::OrHash
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::OpenGraph::Variants
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::OpenGraph::Variants
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Twitter::Variants
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Twitter::Variants
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::AdditionalMeta::Variants
              ],
            alternates:
              T::Array[
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Alternate::OrHash
              ],
            author: String,
            canonical_url: String,
            description: String,
            favicon: String,
            headings:
              T::Array[
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Heading::OrHash
              ],
            image: String,
            json_ld: T::Array[T::Hash[Symbol, T.anything]],
            keywords: T::Array[String],
            language: String,
            modified_time: String,
            open_graph:
              T::Hash[
                Symbol,
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::OpenGraph::Variants
              ],
            published_time: String,
            robots: String,
            site_name: String,
            title: String,
            twitter:
              T::Hash[
                Symbol,
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Twitter::Variants
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
                  ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::AdditionalMeta::Variants
                ],
              alternates:
                T::Array[
                  ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Alternate
                ],
              author: String,
              canonical_url: String,
              description: String,
              favicon: String,
              headings:
                T::Array[
                  ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Heading
                ],
              image: String,
              json_ld: T::Array[T::Hash[Symbol, T.anything]],
              keywords: T::Array[String],
              language: String,
              modified_time: String,
              open_graph:
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::OpenGraph::Variants
                ],
              published_time: String,
              robots: String,
              site_name: String,
              title: String,
              twitter:
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Twitter::Variants
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::AdditionalMeta::Variants
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Alternate,
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

        class Heading < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Heading,
                ContextDev::Internal::AnyHash
              )
            end

          # Heading level, 1–6 (from h1–h6).
          sig { returns(Integer) }
          attr_accessor :level

          # Heading text with whitespace collapsed, truncated to 1000 characters.
          sig { returns(String) }
          attr_accessor :text

          sig { params(level: Integer, text: String).returns(T.attached_class) }
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::OpenGraph::Variants
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
                ContextDev::Models::WebWebScrapeHTMLResponse::Metadata::Twitter::Variants
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

      # Indicates success
      module Success
        extend ContextDev::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              ContextDev::Models::WebWebScrapeHTMLResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            ContextDev::Models::WebWebScrapeHTMLResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeHTMLResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end

      # Detected content type of the returned `html` field. Sitemaps and feeds are
      # surfaced as `xml`; ordinary pages are `html`. Excel workbooks are surfaced as
      # `xlsx`/`xls` with the extracted sheets as HTML tables; PowerPoint presentations
      # are surfaced as `pptx`/`ppt` with the extracted slides as HTML.
      module Type
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::WebWebScrapeHTMLResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HTML =
          T.let(
            :html,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        XML =
          T.let(
            :xml,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        JSON =
          T.let(
            :json,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        TEXT =
          T.let(
            :text,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        CSV =
          T.let(
            :csv,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        MARKDOWN =
          T.let(
            :markdown,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        SVG =
          T.let(
            :svg,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        PDF =
          T.let(
            :pdf,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        DOCX =
          T.let(
            :docx,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        DOC =
          T.let(
            :doc,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        XLSX =
          T.let(
            :xlsx,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        XLS =
          T.let(
            :xls,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        PPTX =
          T.let(
            :pptx,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )
        PPT =
          T.let(
            :ppt,
            ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeHTMLResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class ActionsApplied < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :instruction

        # Applied means the requested page state was visibly verified. Failed means it was
        # not verified. Skipped means it was not attempted.
        sig do
          returns(
            ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Visible page evidence used to verify an applied action.
        sig { returns(T.nilable(String)) }
        attr_reader :completion_evidence

        sig { params(completion_evidence: String).void }
        attr_writer :completion_evidence

        sig { returns(T.nilable(Float)) }
        attr_reader :duration_ms

        sig { params(duration_ms: Float).void }
        attr_writer :duration_ms

        sig { returns(T.nilable(String)) }
        attr_reader :error

        sig { params(error: String).void }
        attr_writer :error

        sig { returns(T.nilable(String)) }
        attr_reader :method_

        sig { params(method_: String).void }
        attr_writer :method_

        sig { returns(T.nilable(String)) }
        attr_reader :target_description

        sig { params(target_description: String).void }
        attr_writer :target_description

        sig do
          params(
            instruction: String,
            status:
              ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status::OrSymbol,
            completion_evidence: String,
            duration_ms: Float,
            error: String,
            method_: String,
            target_description: String
          ).returns(T.attached_class)
        end
        def self.new(
          instruction:,
          # Applied means the requested page state was visibly verified. Failed means it was
          # not verified. Skipped means it was not attempted.
          status:,
          # Visible page evidence used to verify an applied action.
          completion_evidence: nil,
          duration_ms: nil,
          error: nil,
          method_: nil,
          target_description: nil
        )
        end

        sig do
          override.returns(
            {
              instruction: String,
              status:
                ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status::TaggedSymbol,
              completion_evidence: String,
              duration_ms: Float,
              error: String,
              method_: String,
              target_description: String
            }
          )
        end
        def to_hash
        end

        # Applied means the requested page state was visibly verified. Failed means it was
        # not verified. Skipped means it was not attempted.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          APPLIED =
            T.let(
              :applied,
              ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status::TaggedSymbol
            )
          SKIPPED =
            T.let(
              :skipped,
              ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied::Status::TaggedSymbol
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
              ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits used by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credit usage, included whenever a valid API key is provided.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits used by this request.
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
