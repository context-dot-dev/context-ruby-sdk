# typed: strong

module ContextDev
  module Models
    class BatchSubmitParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::BatchSubmitParams, ContextDev::Internal::AnyHash)
        end

      # Choose a URL list or a site crawl.
      sig do
        returns(
          T.any(
            ContextDev::BatchSubmitParams::Input::Scrape,
            ContextDev::BatchSubmitParams::Input::Crawl
          )
        )
      end
      attr_accessor :input

      # Access policy IDs to apply to every page. A URL must pass every policy.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :policies

      sig { params(policies: T::Array[String]).void }
      attr_writer :policies

      # Tags stored on the batch. Filter the batch list by them later.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Where to send the batch's final-status event. Omit `retry` for one attempt; `{}`
      # uses the default retry schedule.
      sig { returns(T.nilable(ContextDev::BatchSubmitParams::Webhook)) }
      attr_reader :webhook

      sig do
        params(webhook: ContextDev::BatchSubmitParams::Webhook::OrHash).void
      end
      attr_writer :webhook

      # Legacy URL notified when the batch finishes. Preserves one best-effort attempt.
      # Cannot be combined with webhook.
      sig { returns(T.nilable(String)) }
      attr_reader :webhook_url

      sig { params(webhook_url: String).void }
      attr_writer :webhook_url

      # Unique key per submission. Retrying with the same key and body returns the
      # original batch; a different body returns `409`.
      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      sig do
        params(
          input:
            T.any(
              ContextDev::BatchSubmitParams::Input::Scrape::OrHash,
              ContextDev::BatchSubmitParams::Input::Crawl::OrHash
            ),
          policies: T::Array[String],
          tags: T::Array[String],
          webhook: ContextDev::BatchSubmitParams::Webhook::OrHash,
          webhook_url: String,
          idempotency_key: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Choose a URL list or a site crawl.
        input:,
        # Access policy IDs to apply to every page. A URL must pass every policy.
        policies: nil,
        # Tags stored on the batch. Filter the batch list by them later.
        tags: nil,
        # Where to send the batch's final-status event. Omit `retry` for one attempt; `{}`
        # uses the default retry schedule.
        webhook: nil,
        # Legacy URL notified when the batch finishes. Preserves one best-effort attempt.
        # Cannot be combined with webhook.
        webhook_url: nil,
        # Unique key per submission. Retrying with the same key and body returns the
        # original batch; a different body returns `409`.
        idempotency_key: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            input:
              T.any(
                ContextDev::BatchSubmitParams::Input::Scrape,
                ContextDev::BatchSubmitParams::Input::Crawl
              ),
            policies: T::Array[String],
            tags: T::Array[String],
            webhook: ContextDev::BatchSubmitParams::Webhook,
            webhook_url: String,
            idempotency_key: String,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Choose a URL list or a site crawl.
      module Input
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::BatchSubmitParams::Input::Scrape,
              ContextDev::BatchSubmitParams::Input::Crawl
            )
          end

        class Scrape < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BatchSubmitParams::Input::Scrape,
                ContextDev::Internal::AnyHash
              )
            end

          # Pages to scrape and their output format.
          sig do
            returns(
              T.any(
                ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown,
                ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML,
                ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData
              )
            )
          end
          attr_accessor :data

          # Scrape the pages in `data.urls`.
          sig { returns(Symbol) }
          attr_accessor :mode

          # Scrape a list of up to 100,000 URLs.
          sig do
            params(
              data:
                T.any(
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::OrHash,
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::OrHash,
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::OrHash
                ),
              mode: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Pages to scrape and their output format.
            data:,
            # Scrape the pages in `data.urls`.
            mode: :scrape
          )
          end

          sig do
            override.returns(
              {
                data:
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown,
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML,
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData
                  ),
                mode: Symbol
              }
            )
          end
          def to_hash
          end

          # Pages to scrape and their output format.
          module Data
            extend ContextDev::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown,
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML,
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData
                )
              end

            class Markdown < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Return page content as Markdown.
              sig do
                returns(
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Format::OrSymbol
                )
              end
              attr_accessor :format_

              # Pages to scrape. Maximum 100000.
              sig do
                returns(
                  T::Array[
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::URL
                  ]
                )
              end
              attr_accessor :urls

              # Options for Markdown output.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options
                  )
                )
              end
              attr_reader :options

              sig do
                params(
                  options:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::OrHash
                ).void
              end
              attr_writer :options

              # Scrape the listed pages as Markdown.
              sig do
                params(
                  format_:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Format::OrSymbol,
                  urls:
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::URL::OrHash
                    ],
                  options:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # Return page content as Markdown.
                format_:,
                # Pages to scrape. Maximum 100000.
                urls:,
                # Options for Markdown output.
                options: nil
              )
              end

              sig do
                override.returns(
                  {
                    format_:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Format::OrSymbol,
                    urls:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::URL
                      ],
                    options:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options
                  }
                )
              end
              def to_hash
              end

              # Return page content as Markdown.
              module Format
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Format
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                MARKDOWN =
                  T.let(
                    :markdown,
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Format::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Format::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class URL < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::URL,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Page URL to scrape.
                sig { returns(String) }
                attr_accessor :url

                # Your ID for this page, returned with its result. The same URL can use different
                # IDs.
                sig { returns(T.nilable(String)) }
                attr_reader :item_id

                sig { params(item_id: String).void }
                attr_writer :item_id

                # Custom JSON returned unchanged with this page result.
                sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
                attr_reader :meta

                sig { params(meta: T::Hash[Symbol, T.anything]).void }
                attr_writer :meta

                # A page to scrape, with optional data for matching results.
                sig do
                  params(
                    url: String,
                    item_id: String,
                    meta: T::Hash[Symbol, T.anything]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Page URL to scrape.
                  url:,
                  # Your ID for this page, returned with its result. The same URL can use different
                  # IDs.
                  item_id: nil,
                  # Custom JSON returned unchanged with this page result.
                  meta: nil
                )
                end

                sig do
                  override.returns(
                    {
                      url: String,
                      item_id: String,
                      meta: T::Hash[Symbol, T.anything]
                    }
                  )
                end
                def to_hash
                end
              end

              class Options < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Fetch from this country (ISO 3166-1 alpha-2).
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::OrSymbol
                    )
                  )
                end
                attr_reader :country

                sig do
                  params(
                    country:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::OrSymbol
                  ).void
                end
                attr_writer :country

                # Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                # so an element matching both is removed.
                sig { returns(T.nilable(T::Array[String])) }
                attr_accessor :exclude_selectors

                # Also return each page's HTML in `html`.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_html

                sig { params(include_html: T::Boolean).void }
                attr_writer :include_html

                # Include image references in the Markdown (`html-conversion` only).
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_images

                sig { params(include_images: T::Boolean).void }
                attr_writer :include_images

                # Include links in the Markdown (`html-conversion` only).
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_links

                sig { params(include_links: T::Boolean).void }
                attr_writer :include_links

                # Keep only elements matching these CSS selectors. Filtered pages ignore
                # `maxAgeMs`.
                sig { returns(T.nilable(T::Array[String])) }
                attr_accessor :include_selectors

                # Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                # year (31536000000 ms). `0` fetches fresh.
                sig { returns(T.nilable(Integer)) }
                attr_accessor :max_age_ms

                # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf
                    )
                  )
                end
                attr_reader :pdf

                sig do
                  params(
                    pdf:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::OrHash
                  ).void
                end
                attr_writer :pdf

                # Wait for CSS animations to finish before extracting, on browser-rendered pages.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :settle_animations

                sig { params(settle_animations: T::Boolean).void }
                attr_writer :settle_animations

                # Shorten inline base64 image data (`html-conversion` only).
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :shorten_base64_images

                sig { params(shorten_base64_images: T::Boolean).void }
                attr_writer :shorten_base64_images

                # Markdown sources in order of preference: `html-conversion` converts the page
                # HTML, `markdown-direct` uses Markdown the site publishes.
                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference::OrSymbol
                      ]
                    )
                  )
                end
                attr_reader :source_preference

                sig do
                  params(
                    source_preference:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference::OrSymbol
                      ]
                  ).void
                end
                attr_writer :source_preference

                # Return the main content without navigation or footers.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :use_main_content_only

                sig { params(use_main_content_only: T::Boolean).void }
                attr_writer :use_main_content_only

                # How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                sig { returns(T.nilable(Integer)) }
                attr_reader :wait_for_ms

                sig { params(wait_for_ms: Integer).void }
                attr_writer :wait_for_ms

                # Options for Markdown output.
                sig do
                  params(
                    country:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::OrSymbol,
                    exclude_selectors: T.nilable(T::Array[String]),
                    include_html: T::Boolean,
                    include_images: T::Boolean,
                    include_links: T::Boolean,
                    include_selectors: T.nilable(T::Array[String]),
                    max_age_ms: T.nilable(Integer),
                    pdf:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf::OrHash,
                    settle_animations: T::Boolean,
                    shorten_base64_images: T::Boolean,
                    source_preference:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference::OrSymbol
                      ],
                    use_main_content_only: T::Boolean,
                    wait_for_ms: Integer
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Fetch from this country (ISO 3166-1 alpha-2).
                  country: nil,
                  # Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                  # so an element matching both is removed.
                  exclude_selectors: nil,
                  # Also return each page's HTML in `html`.
                  include_html: nil,
                  # Include image references in the Markdown (`html-conversion` only).
                  include_images: nil,
                  # Include links in the Markdown (`html-conversion` only).
                  include_links: nil,
                  # Keep only elements matching these CSS selectors. Filtered pages ignore
                  # `maxAgeMs`.
                  include_selectors: nil,
                  # Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                  # year (31536000000 ms). `0` fetches fresh.
                  max_age_ms: nil,
                  # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  pdf: nil,
                  # Wait for CSS animations to finish before extracting, on browser-rendered pages.
                  settle_animations: nil,
                  # Shorten inline base64 image data (`html-conversion` only).
                  shorten_base64_images: nil,
                  # Markdown sources in order of preference: `html-conversion` converts the page
                  # HTML, `markdown-direct` uses Markdown the site publishes.
                  source_preference: nil,
                  # Return the main content without navigation or footers.
                  use_main_content_only: nil,
                  # How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                  wait_for_ms: nil
                )
                end

                sig do
                  override.returns(
                    {
                      country:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::OrSymbol,
                      exclude_selectors: T.nilable(T::Array[String]),
                      include_html: T::Boolean,
                      include_images: T::Boolean,
                      include_links: T::Boolean,
                      include_selectors: T.nilable(T::Array[String]),
                      max_age_ms: T.nilable(Integer),
                      pdf:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf,
                      settle_animations: T::Boolean,
                      shorten_base64_images: T::Boolean,
                      source_preference:
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference::OrSymbol
                        ],
                      use_main_content_only: T::Boolean,
                      wait_for_ms: Integer
                    }
                  )
                end
                def to_hash
                end

                # Fetch from this country (ISO 3166-1 alpha-2).
                module Country
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  AD =
                    T.let(
                      :ad,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AE =
                    T.let(
                      :ae,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AF =
                    T.let(
                      :af,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AG =
                    T.let(
                      :ag,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AI =
                    T.let(
                      :ai,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AL =
                    T.let(
                      :al,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AM =
                    T.let(
                      :am,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AO =
                    T.let(
                      :ao,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AR =
                    T.let(
                      :ar,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AT =
                    T.let(
                      :at,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AU =
                    T.let(
                      :au,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AW =
                    T.let(
                      :aw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AZ =
                    T.let(
                      :az,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BA =
                    T.let(
                      :ba,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BB =
                    T.let(
                      :bb,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BD =
                    T.let(
                      :bd,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BE =
                    T.let(
                      :be,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BF =
                    T.let(
                      :bf,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BG =
                    T.let(
                      :bg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BH =
                    T.let(
                      :bh,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BI =
                    T.let(
                      :bi,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BJ =
                    T.let(
                      :bj,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BM =
                    T.let(
                      :bm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BN =
                    T.let(
                      :bn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BO =
                    T.let(
                      :bo,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BQ =
                    T.let(
                      :bq,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BR =
                    T.let(
                      :br,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BS =
                    T.let(
                      :bs,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BW =
                    T.let(
                      :bw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BY =
                    T.let(
                      :by,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BZ =
                    T.let(
                      :bz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CA =
                    T.let(
                      :ca,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CD =
                    T.let(
                      :cd,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CF =
                    T.let(
                      :cf,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CG =
                    T.let(
                      :cg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CH =
                    T.let(
                      :ch,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CI =
                    T.let(
                      :ci,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CL =
                    T.let(
                      :cl,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CM =
                    T.let(
                      :cm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CN =
                    T.let(
                      :cn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CO =
                    T.let(
                      :co,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CR =
                    T.let(
                      :cr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CV =
                    T.let(
                      :cv,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CW =
                    T.let(
                      :cw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CY =
                    T.let(
                      :cy,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CZ =
                    T.let(
                      :cz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DE =
                    T.let(
                      :de,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DJ =
                    T.let(
                      :dj,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DK =
                    T.let(
                      :dk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DM =
                    T.let(
                      :dm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DO =
                    T.let(
                      :do,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DZ =
                    T.let(
                      :dz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  EC =
                    T.let(
                      :ec,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  EE =
                    T.let(
                      :ee,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  EG =
                    T.let(
                      :eg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ES =
                    T.let(
                      :es,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ET =
                    T.let(
                      :et,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  FI =
                    T.let(
                      :fi,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  FJ =
                    T.let(
                      :fj,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  FR =
                    T.let(
                      :fr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GA =
                    T.let(
                      :ga,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GB =
                    T.let(
                      :gb,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GD =
                    T.let(
                      :gd,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GE =
                    T.let(
                      :ge,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GF =
                    T.let(
                      :gf,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GG =
                    T.let(
                      :gg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GH =
                    T.let(
                      :gh,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GM =
                    T.let(
                      :gm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GN =
                    T.let(
                      :gn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GP =
                    T.let(
                      :gp,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GQ =
                    T.let(
                      :gq,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GR =
                    T.let(
                      :gr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GT =
                    T.let(
                      :gt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GU =
                    T.let(
                      :gu,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GW =
                    T.let(
                      :gw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GY =
                    T.let(
                      :gy,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  HK =
                    T.let(
                      :hk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  HN =
                    T.let(
                      :hn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  HR =
                    T.let(
                      :hr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  HT =
                    T.let(
                      :ht,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  HU =
                    T.let(
                      :hu,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ID =
                    T.let(
                      :id,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IE =
                    T.let(
                      :ie,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IL =
                    T.let(
                      :il,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IM =
                    T.let(
                      :im,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IN =
                    T.let(
                      :in,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IQ =
                    T.let(
                      :iq,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IR =
                    T.let(
                      :ir,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IS =
                    T.let(
                      :is,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IT =
                    T.let(
                      :it,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  JE =
                    T.let(
                      :je,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  JM =
                    T.let(
                      :jm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  JO =
                    T.let(
                      :jo,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  JP =
                    T.let(
                      :jp,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KE =
                    T.let(
                      :ke,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KG =
                    T.let(
                      :kg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KH =
                    T.let(
                      :kh,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KN =
                    T.let(
                      :kn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KR =
                    T.let(
                      :kr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KW =
                    T.let(
                      :kw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KY =
                    T.let(
                      :ky,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KZ =
                    T.let(
                      :kz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LA =
                    T.let(
                      :la,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LB =
                    T.let(
                      :lb,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LC =
                    T.let(
                      :lc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LK =
                    T.let(
                      :lk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LR =
                    T.let(
                      :lr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LS =
                    T.let(
                      :ls,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LT =
                    T.let(
                      :lt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LU =
                    T.let(
                      :lu,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LV =
                    T.let(
                      :lv,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LY =
                    T.let(
                      :ly,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MA =
                    T.let(
                      :ma,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MC =
                    T.let(
                      :mc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MD =
                    T.let(
                      :md,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ME =
                    T.let(
                      :me,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MF =
                    T.let(
                      :mf,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MG =
                    T.let(
                      :mg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MK =
                    T.let(
                      :mk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ML =
                    T.let(
                      :ml,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MM =
                    T.let(
                      :mm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MN =
                    T.let(
                      :mn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MO =
                    T.let(
                      :mo,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MQ =
                    T.let(
                      :mq,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MR =
                    T.let(
                      :mr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MT =
                    T.let(
                      :mt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MU =
                    T.let(
                      :mu,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MV =
                    T.let(
                      :mv,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MW =
                    T.let(
                      :mw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MX =
                    T.let(
                      :mx,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MY =
                    T.let(
                      :my,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MZ =
                    T.let(
                      :mz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NA =
                    T.let(
                      :na,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NC =
                    T.let(
                      :nc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NE =
                    T.let(
                      :ne,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NG =
                    T.let(
                      :ng,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NI =
                    T.let(
                      :ni,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NL =
                    T.let(
                      :nl,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NO =
                    T.let(
                      :no,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NP =
                    T.let(
                      :np,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NZ =
                    T.let(
                      :nz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  OM =
                    T.let(
                      :om,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PA =
                    T.let(
                      :pa,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PE =
                    T.let(
                      :pe,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PF =
                    T.let(
                      :pf,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PG =
                    T.let(
                      :pg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PH =
                    T.let(
                      :ph,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PK =
                    T.let(
                      :pk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PL =
                    T.let(
                      :pl,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PR =
                    T.let(
                      :pr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PS =
                    T.let(
                      :ps,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PT =
                    T.let(
                      :pt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PY =
                    T.let(
                      :py,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  QA =
                    T.let(
                      :qa,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  RE =
                    T.let(
                      :re,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  RO =
                    T.let(
                      :ro,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  RS =
                    T.let(
                      :rs,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  RU =
                    T.let(
                      :ru,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  RW =
                    T.let(
                      :rw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SA =
                    T.let(
                      :sa,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SC =
                    T.let(
                      :sc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SD =
                    T.let(
                      :sd,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SE =
                    T.let(
                      :se,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SG =
                    T.let(
                      :sg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SI =
                    T.let(
                      :si,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SK =
                    T.let(
                      :sk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SL =
                    T.let(
                      :sl,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SM =
                    T.let(
                      :sm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SN =
                    T.let(
                      :sn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SO =
                    T.let(
                      :so,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SR =
                    T.let(
                      :sr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SS =
                    T.let(
                      :ss,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ST =
                    T.let(
                      :st,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SV =
                    T.let(
                      :sv,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SX =
                    T.let(
                      :sx,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SY =
                    T.let(
                      :sy,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SZ =
                    T.let(
                      :sz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TC =
                    T.let(
                      :tc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TD =
                    T.let(
                      :td,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TG =
                    T.let(
                      :tg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TH =
                    T.let(
                      :th,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TJ =
                    T.let(
                      :tj,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TL =
                    T.let(
                      :tl,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TM =
                    T.let(
                      :tm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TN =
                    T.let(
                      :tn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TR =
                    T.let(
                      :tr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TT =
                    T.let(
                      :tt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TW =
                    T.let(
                      :tw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TZ =
                    T.let(
                      :tz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  UA =
                    T.let(
                      :ua,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  UG =
                    T.let(
                      :ug,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  US =
                    T.let(
                      :us,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  UY =
                    T.let(
                      :uy,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  UZ =
                    T.let(
                      :uz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  VC =
                    T.let(
                      :vc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  VE =
                    T.let(
                      :ve,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  VG =
                    T.let(
                      :vg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  VI =
                    T.let(
                      :vi,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  VN =
                    T.let(
                      :vn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  YE =
                    T.let(
                      :ye,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  YT =
                    T.let(
                      :yt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ZA =
                    T.let(
                      :za,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ZM =
                    T.let(
                      :zm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ZW =
                    T.let(
                      :zw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Country::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Pdf < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::Pdf,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
                  # be >= start.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :end_

                  sig { params(end_: Integer).void }
                  attr_writer :end_

                  # Read scanned PDF pages with OCR; preserve pages that already have text.
                  sig { returns(T.nilable(T::Boolean)) }
                  attr_reader :ocr

                  sig { params(ocr: T::Boolean).void }
                  attr_writer :ocr

                  # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                  sig { returns(T.nilable(T::Boolean)) }
                  attr_reader :should_parse

                  sig { params(should_parse: T::Boolean).void }
                  attr_writer :should_parse

                  # First 1-based PDF page to parse.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :start

                  sig { params(start: Integer).void }
                  attr_writer :start

                  # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  sig do
                    params(
                      end_: Integer,
                      ocr: T::Boolean,
                      should_parse: T::Boolean,
                      start: Integer
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
                    # be >= start.
                    end_: nil,
                    # Read scanned PDF pages with OCR; preserve pages that already have text.
                    ocr: nil,
                    # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                    should_parse: nil,
                    # First 1-based PDF page to parse.
                    start: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        end_: Integer,
                        ocr: T::Boolean,
                        should_parse: T::Boolean,
                        start: Integer
                      }
                    )
                  end
                  def to_hash
                  end
                end

                module SourcePreference
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  HTML_CONVERSION =
                    T.let(
                      :"html-conversion",
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference::TaggedSymbol
                    )
                  MARKDOWN_DIRECT =
                    T.let(
                      :"markdown-direct",
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::SourcePreference::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end

            class HTML < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Return page content as HTML.
              sig do
                returns(
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Format::OrSymbol
                )
              end
              attr_accessor :format_

              # Pages to scrape. Maximum 100000.
              sig do
                returns(
                  T::Array[
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::URL
                  ]
                )
              end
              attr_accessor :urls

              # Options for HTML output.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options
                  )
                )
              end
              attr_reader :options

              sig do
                params(
                  options:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::OrHash
                ).void
              end
              attr_writer :options

              # Scrape the listed pages as HTML.
              sig do
                params(
                  format_:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Format::OrSymbol,
                  urls:
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::URL::OrHash
                    ],
                  options:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # Return page content as HTML.
                format_:,
                # Pages to scrape. Maximum 100000.
                urls:,
                # Options for HTML output.
                options: nil
              )
              end

              sig do
                override.returns(
                  {
                    format_:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Format::OrSymbol,
                    urls:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::URL
                      ],
                    options:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options
                  }
                )
              end
              def to_hash
              end

              # Return page content as HTML.
              module Format
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Format
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                HTML =
                  T.let(
                    :html,
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Format::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Format::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class URL < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::URL,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Page URL to scrape.
                sig { returns(String) }
                attr_accessor :url

                # Your ID for this page, returned with its result. The same URL can use different
                # IDs.
                sig { returns(T.nilable(String)) }
                attr_reader :item_id

                sig { params(item_id: String).void }
                attr_writer :item_id

                # Custom JSON returned unchanged with this page result.
                sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
                attr_reader :meta

                sig { params(meta: T::Hash[Symbol, T.anything]).void }
                attr_writer :meta

                # A page to scrape, with optional data for matching results.
                sig do
                  params(
                    url: String,
                    item_id: String,
                    meta: T::Hash[Symbol, T.anything]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Page URL to scrape.
                  url:,
                  # Your ID for this page, returned with its result. The same URL can use different
                  # IDs.
                  item_id: nil,
                  # Custom JSON returned unchanged with this page result.
                  meta: nil
                )
                end

                sig do
                  override.returns(
                    {
                      url: String,
                      item_id: String,
                      meta: T::Hash[Symbol, T.anything]
                    }
                  )
                end
                def to_hash
                end
              end

              class Options < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Fetch from this country (ISO 3166-1 alpha-2).
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::OrSymbol
                    )
                  )
                end
                attr_reader :country

                sig do
                  params(
                    country:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::OrSymbol
                  ).void
                end
                attr_writer :country

                # Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                # so an element matching both is removed.
                sig { returns(T.nilable(T::Array[String])) }
                attr_accessor :exclude_selectors

                # Keep only elements matching these CSS selectors. Filtered pages ignore
                # `maxAgeMs`.
                sig { returns(T.nilable(T::Array[String])) }
                attr_accessor :include_selectors

                # Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                # year (31536000000 ms). `0` fetches fresh.
                sig { returns(T.nilable(Integer)) }
                attr_accessor :max_age_ms

                # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf
                    )
                  )
                end
                attr_reader :pdf

                sig do
                  params(
                    pdf:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::OrHash
                  ).void
                end
                attr_writer :pdf

                # Wait for CSS animations to finish before extracting, on browser-rendered pages.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :settle_animations

                sig { params(settle_animations: T::Boolean).void }
                attr_writer :settle_animations

                # Return the main content without navigation or footers.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :use_main_content_only

                sig { params(use_main_content_only: T::Boolean).void }
                attr_writer :use_main_content_only

                # How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                sig { returns(T.nilable(Integer)) }
                attr_reader :wait_for_ms

                sig { params(wait_for_ms: Integer).void }
                attr_writer :wait_for_ms

                # Options for HTML output.
                sig do
                  params(
                    country:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::OrSymbol,
                    exclude_selectors: T.nilable(T::Array[String]),
                    include_selectors: T.nilable(T::Array[String]),
                    max_age_ms: T.nilable(Integer),
                    pdf:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf::OrHash,
                    settle_animations: T::Boolean,
                    use_main_content_only: T::Boolean,
                    wait_for_ms: Integer
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Fetch from this country (ISO 3166-1 alpha-2).
                  country: nil,
                  # Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                  # so an element matching both is removed.
                  exclude_selectors: nil,
                  # Keep only elements matching these CSS selectors. Filtered pages ignore
                  # `maxAgeMs`.
                  include_selectors: nil,
                  # Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                  # year (31536000000 ms). `0` fetches fresh.
                  max_age_ms: nil,
                  # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  pdf: nil,
                  # Wait for CSS animations to finish before extracting, on browser-rendered pages.
                  settle_animations: nil,
                  # Return the main content without navigation or footers.
                  use_main_content_only: nil,
                  # How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                  wait_for_ms: nil
                )
                end

                sig do
                  override.returns(
                    {
                      country:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::OrSymbol,
                      exclude_selectors: T.nilable(T::Array[String]),
                      include_selectors: T.nilable(T::Array[String]),
                      max_age_ms: T.nilable(Integer),
                      pdf:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf,
                      settle_animations: T::Boolean,
                      use_main_content_only: T::Boolean,
                      wait_for_ms: Integer
                    }
                  )
                end
                def to_hash
                end

                # Fetch from this country (ISO 3166-1 alpha-2).
                module Country
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  AD =
                    T.let(
                      :ad,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AE =
                    T.let(
                      :ae,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AF =
                    T.let(
                      :af,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AG =
                    T.let(
                      :ag,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AI =
                    T.let(
                      :ai,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AL =
                    T.let(
                      :al,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AM =
                    T.let(
                      :am,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AO =
                    T.let(
                      :ao,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AR =
                    T.let(
                      :ar,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AT =
                    T.let(
                      :at,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AU =
                    T.let(
                      :au,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AW =
                    T.let(
                      :aw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AZ =
                    T.let(
                      :az,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BA =
                    T.let(
                      :ba,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BB =
                    T.let(
                      :bb,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BD =
                    T.let(
                      :bd,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BE =
                    T.let(
                      :be,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BF =
                    T.let(
                      :bf,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BG =
                    T.let(
                      :bg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BH =
                    T.let(
                      :bh,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BI =
                    T.let(
                      :bi,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BJ =
                    T.let(
                      :bj,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BM =
                    T.let(
                      :bm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BN =
                    T.let(
                      :bn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BO =
                    T.let(
                      :bo,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BQ =
                    T.let(
                      :bq,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BR =
                    T.let(
                      :br,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BS =
                    T.let(
                      :bs,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BW =
                    T.let(
                      :bw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BY =
                    T.let(
                      :by,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BZ =
                    T.let(
                      :bz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CA =
                    T.let(
                      :ca,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CD =
                    T.let(
                      :cd,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CF =
                    T.let(
                      :cf,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CG =
                    T.let(
                      :cg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CH =
                    T.let(
                      :ch,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CI =
                    T.let(
                      :ci,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CL =
                    T.let(
                      :cl,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CM =
                    T.let(
                      :cm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CN =
                    T.let(
                      :cn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CO =
                    T.let(
                      :co,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CR =
                    T.let(
                      :cr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CV =
                    T.let(
                      :cv,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CW =
                    T.let(
                      :cw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CY =
                    T.let(
                      :cy,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CZ =
                    T.let(
                      :cz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DE =
                    T.let(
                      :de,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DJ =
                    T.let(
                      :dj,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DK =
                    T.let(
                      :dk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DM =
                    T.let(
                      :dm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DO =
                    T.let(
                      :do,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DZ =
                    T.let(
                      :dz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  EC =
                    T.let(
                      :ec,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  EE =
                    T.let(
                      :ee,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  EG =
                    T.let(
                      :eg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ES =
                    T.let(
                      :es,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ET =
                    T.let(
                      :et,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  FI =
                    T.let(
                      :fi,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  FJ =
                    T.let(
                      :fj,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  FR =
                    T.let(
                      :fr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GA =
                    T.let(
                      :ga,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GB =
                    T.let(
                      :gb,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GD =
                    T.let(
                      :gd,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GE =
                    T.let(
                      :ge,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GF =
                    T.let(
                      :gf,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GG =
                    T.let(
                      :gg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GH =
                    T.let(
                      :gh,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GM =
                    T.let(
                      :gm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GN =
                    T.let(
                      :gn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GP =
                    T.let(
                      :gp,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GQ =
                    T.let(
                      :gq,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GR =
                    T.let(
                      :gr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GT =
                    T.let(
                      :gt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GU =
                    T.let(
                      :gu,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GW =
                    T.let(
                      :gw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GY =
                    T.let(
                      :gy,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  HK =
                    T.let(
                      :hk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  HN =
                    T.let(
                      :hn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  HR =
                    T.let(
                      :hr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  HT =
                    T.let(
                      :ht,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  HU =
                    T.let(
                      :hu,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ID =
                    T.let(
                      :id,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IE =
                    T.let(
                      :ie,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IL =
                    T.let(
                      :il,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IM =
                    T.let(
                      :im,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IN =
                    T.let(
                      :in,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IQ =
                    T.let(
                      :iq,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IR =
                    T.let(
                      :ir,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IS =
                    T.let(
                      :is,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IT =
                    T.let(
                      :it,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  JE =
                    T.let(
                      :je,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  JM =
                    T.let(
                      :jm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  JO =
                    T.let(
                      :jo,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  JP =
                    T.let(
                      :jp,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KE =
                    T.let(
                      :ke,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KG =
                    T.let(
                      :kg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KH =
                    T.let(
                      :kh,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KN =
                    T.let(
                      :kn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KR =
                    T.let(
                      :kr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KW =
                    T.let(
                      :kw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KY =
                    T.let(
                      :ky,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KZ =
                    T.let(
                      :kz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LA =
                    T.let(
                      :la,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LB =
                    T.let(
                      :lb,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LC =
                    T.let(
                      :lc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LK =
                    T.let(
                      :lk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LR =
                    T.let(
                      :lr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LS =
                    T.let(
                      :ls,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LT =
                    T.let(
                      :lt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LU =
                    T.let(
                      :lu,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LV =
                    T.let(
                      :lv,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LY =
                    T.let(
                      :ly,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MA =
                    T.let(
                      :ma,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MC =
                    T.let(
                      :mc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MD =
                    T.let(
                      :md,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ME =
                    T.let(
                      :me,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MF =
                    T.let(
                      :mf,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MG =
                    T.let(
                      :mg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MK =
                    T.let(
                      :mk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ML =
                    T.let(
                      :ml,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MM =
                    T.let(
                      :mm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MN =
                    T.let(
                      :mn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MO =
                    T.let(
                      :mo,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MQ =
                    T.let(
                      :mq,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MR =
                    T.let(
                      :mr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MT =
                    T.let(
                      :mt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MU =
                    T.let(
                      :mu,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MV =
                    T.let(
                      :mv,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MW =
                    T.let(
                      :mw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MX =
                    T.let(
                      :mx,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MY =
                    T.let(
                      :my,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MZ =
                    T.let(
                      :mz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NA =
                    T.let(
                      :na,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NC =
                    T.let(
                      :nc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NE =
                    T.let(
                      :ne,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NG =
                    T.let(
                      :ng,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NI =
                    T.let(
                      :ni,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NL =
                    T.let(
                      :nl,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NO =
                    T.let(
                      :no,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NP =
                    T.let(
                      :np,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NZ =
                    T.let(
                      :nz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  OM =
                    T.let(
                      :om,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PA =
                    T.let(
                      :pa,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PE =
                    T.let(
                      :pe,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PF =
                    T.let(
                      :pf,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PG =
                    T.let(
                      :pg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PH =
                    T.let(
                      :ph,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PK =
                    T.let(
                      :pk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PL =
                    T.let(
                      :pl,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PR =
                    T.let(
                      :pr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PS =
                    T.let(
                      :ps,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PT =
                    T.let(
                      :pt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PY =
                    T.let(
                      :py,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  QA =
                    T.let(
                      :qa,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  RE =
                    T.let(
                      :re,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  RO =
                    T.let(
                      :ro,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  RS =
                    T.let(
                      :rs,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  RU =
                    T.let(
                      :ru,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  RW =
                    T.let(
                      :rw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SA =
                    T.let(
                      :sa,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SC =
                    T.let(
                      :sc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SD =
                    T.let(
                      :sd,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SE =
                    T.let(
                      :se,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SG =
                    T.let(
                      :sg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SI =
                    T.let(
                      :si,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SK =
                    T.let(
                      :sk,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SL =
                    T.let(
                      :sl,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SM =
                    T.let(
                      :sm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SN =
                    T.let(
                      :sn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SO =
                    T.let(
                      :so,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SR =
                    T.let(
                      :sr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SS =
                    T.let(
                      :ss,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ST =
                    T.let(
                      :st,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SV =
                    T.let(
                      :sv,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SX =
                    T.let(
                      :sx,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SY =
                    T.let(
                      :sy,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SZ =
                    T.let(
                      :sz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TC =
                    T.let(
                      :tc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TD =
                    T.let(
                      :td,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TG =
                    T.let(
                      :tg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TH =
                    T.let(
                      :th,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TJ =
                    T.let(
                      :tj,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TL =
                    T.let(
                      :tl,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TM =
                    T.let(
                      :tm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TN =
                    T.let(
                      :tn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TR =
                    T.let(
                      :tr,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TT =
                    T.let(
                      :tt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TW =
                    T.let(
                      :tw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TZ =
                    T.let(
                      :tz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  UA =
                    T.let(
                      :ua,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  UG =
                    T.let(
                      :ug,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  US =
                    T.let(
                      :us,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  UY =
                    T.let(
                      :uy,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  UZ =
                    T.let(
                      :uz,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  VC =
                    T.let(
                      :vc,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  VE =
                    T.let(
                      :ve,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  VG =
                    T.let(
                      :vg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  VI =
                    T.let(
                      :vi,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  VN =
                    T.let(
                      :vn,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  YE =
                    T.let(
                      :ye,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  YT =
                    T.let(
                      :yt,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ZA =
                    T.let(
                      :za,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ZM =
                    T.let(
                      :zm,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ZW =
                    T.let(
                      :zw,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Country::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Pdf < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::Pdf,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
                  # be >= start.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :end_

                  sig { params(end_: Integer).void }
                  attr_writer :end_

                  # Read scanned PDF pages with OCR; preserve pages that already have text.
                  sig { returns(T.nilable(T::Boolean)) }
                  attr_reader :ocr

                  sig { params(ocr: T::Boolean).void }
                  attr_writer :ocr

                  # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                  sig { returns(T.nilable(T::Boolean)) }
                  attr_reader :should_parse

                  sig { params(should_parse: T::Boolean).void }
                  attr_writer :should_parse

                  # First 1-based PDF page to parse.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :start

                  sig { params(start: Integer).void }
                  attr_writer :start

                  # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  sig do
                    params(
                      end_: Integer,
                      ocr: T::Boolean,
                      should_parse: T::Boolean,
                      start: Integer
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
                    # be >= start.
                    end_: nil,
                    # Read scanned PDF pages with OCR; preserve pages that already have text.
                    ocr: nil,
                    # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                    should_parse: nil,
                    # First 1-based PDF page to parse.
                    start: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        end_: Integer,
                        ocr: T::Boolean,
                        should_parse: T::Boolean,
                        start: Integer
                      }
                    )
                  end
                  def to_hash
                  end
                end
              end
            end

            class BatchUnifiedScrapeData < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Outputs to return. Set at least one to `true`.
              sig do
                returns(
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Formats
                )
              end
              attr_reader :formats

              sig do
                params(
                  formats:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Formats::OrHash
                ).void
              end
              attr_writer :formats

              # Pages to scrape. Maximum 100000.
              sig do
                returns(
                  T::Array[
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::URL
                  ]
                )
              end
              attr_accessor :urls

              # Requires `formats.highlights: true`; required when it is set.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::HighlightsParams
                  )
                )
              end
              attr_reader :highlights_params

              sig do
                params(
                  highlights_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::HighlightsParams::OrHash
                ).void
              end
              attr_writer :highlights_params

              # Image options. Requires formats.images: true.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams
                  )
                )
              end
              attr_reader :image_params

              sig do
                params(
                  image_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::OrHash
                ).void
              end
              attr_writer :image_params

              # Requires `formats.json: true`; required when it is set.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::JsonParams
                  )
                )
              end
              attr_reader :json_params

              sig do
                params(
                  json_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::JsonParams::OrHash
                ).void
              end
              attr_writer :json_params

              # Markdown options. Requires `formats.markdown`.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams
                  )
                )
              end
              attr_reader :markdown_params

              sig do
                params(
                  markdown_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::OrHash
                ).void
              end
              attr_writer :markdown_params

              # Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
              # 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
              sig { returns(T.nilable(Integer)) }
              attr_reader :max_age_ms

              sig { params(max_age_ms: Integer).void }
              attr_writer :max_age_ms

              # Requires `formats.parse: true`; required when it is set.
              sig do
                returns(
                  T.nilable(
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser
                    )
                  )
                )
              end
              attr_reader :parse_params

              sig do
                params(
                  parse_params:
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::OrHash,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::OrHash
                    )
                ).void
              end
              attr_writer :parse_params

              # Product options. Requires formats.product: true.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ProductParams
                  )
                )
              end
              attr_reader :product_params

              sig do
                params(
                  product_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ProductParams::OrHash
                ).void
              end
              attr_writer :product_params

              # Screenshot options. Requires formats.screenshot: true.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams
                  )
                )
              end
              attr_reader :screenshot_params

              sig do
                params(
                  screenshot_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::OrHash
                ).void
              end
              attr_writer :screenshot_params

              # Browser and content settings shared by all outputs.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams
                  )
                )
              end
              attr_reader :shared_params

              sig do
                params(
                  shared_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::OrHash
                ).void
              end
              attr_writer :shared_params

              # Labels for filtering usage in the dashboard.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :tags

              sig { params(tags: T::Array[String]).void }
              attr_writer :tags

              # Deadline for each page, using the same behavior and defaults as POST
              # /web/scrape.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts
                  )
                )
              end
              attr_reader :timeout_opts

              sig do
                params(
                  timeout_opts:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::OrHash
                ).void
              end
              attr_writer :timeout_opts

              # Batches persist their results. Only disabled is supported; enabled returns
              # ZDR_NOT_SUPPORTED.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Zdr::OrSymbol
                  )
                )
              end
              attr_reader :zdr

              sig do
                params(
                  zdr:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Zdr::OrSymbol
                ).void
              end
              attr_writer :zdr

              # Use the same formats and parameters as POST /web/scrape, replacing url with
              # urls. Options apply to every page.
              sig do
                params(
                  formats:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Formats::OrHash,
                  urls:
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::URL::OrHash
                    ],
                  highlights_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::HighlightsParams::OrHash,
                  image_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::OrHash,
                  json_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::JsonParams::OrHash,
                  markdown_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::OrHash,
                  max_age_ms: Integer,
                  parse_params:
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::OrHash,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::OrHash
                    ),
                  product_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ProductParams::OrHash,
                  screenshot_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::OrHash,
                  shared_params:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::OrHash,
                  tags: T::Array[String],
                  timeout_opts:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::OrHash,
                  zdr:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Zdr::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Outputs to return. Set at least one to `true`.
                formats:,
                # Pages to scrape. Maximum 100000.
                urls:,
                # Requires `formats.highlights: true`; required when it is set.
                highlights_params: nil,
                # Image options. Requires formats.images: true.
                image_params: nil,
                # Requires `formats.json: true`; required when it is set.
                json_params: nil,
                # Markdown options. Requires `formats.markdown`.
                markdown_params: nil,
                # Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
                # 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
                max_age_ms: nil,
                # Requires `formats.parse: true`; required when it is set.
                parse_params: nil,
                # Product options. Requires formats.product: true.
                product_params: nil,
                # Screenshot options. Requires formats.screenshot: true.
                screenshot_params: nil,
                # Browser and content settings shared by all outputs.
                shared_params: nil,
                # Labels for filtering usage in the dashboard.
                tags: nil,
                # Deadline for each page, using the same behavior and defaults as POST
                # /web/scrape.
                timeout_opts: nil,
                # Batches persist their results. Only disabled is supported; enabled returns
                # ZDR_NOT_SUPPORTED.
                zdr: nil
              )
              end

              sig do
                override.returns(
                  {
                    formats:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Formats,
                    urls:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::URL
                      ],
                    highlights_params:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::HighlightsParams,
                    image_params:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams,
                    json_params:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::JsonParams,
                    markdown_params:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams,
                    max_age_ms: Integer,
                    parse_params:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser
                      ),
                    product_params:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ProductParams,
                    screenshot_params:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams,
                    shared_params:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams,
                    tags: T::Array[String],
                    timeout_opts:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts,
                    zdr:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Zdr::OrSymbol
                  }
                )
              end
              def to_hash
              end

              class Formats < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Formats,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # The original HTTP response body.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :bytes

                sig { params(bytes: T::Boolean).void }
                attr_writer :bytes

                # Markdown excerpts relevant to `highlightsParams.query`.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :highlights

                sig { params(highlights: T::Boolean).void }
                attr_writer :highlights

                # Rendered HTML.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :html

                sig { params(html: T::Boolean).void }
                attr_writer :html

                # Images found on the page.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :images

                sig { params(images: T::Boolean).void }
                attr_writer :images

                # An object matching `jsonParams.schema`, extracted from the page.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :json

                sig { params(json: T::Boolean).void }
                attr_writer :json

                # Page content as Markdown.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :markdown

                sig { params(markdown: T::Boolean).void }
                attr_writer :markdown

                # Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :parse

                sig { params(parse: T::Boolean).void }
                attr_writer :parse

                # Product details such as name, price, and availability.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :product

                sig { params(product: T::Boolean).void }
                attr_writer :product

                # A screenshot of the page.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :screenshot

                sig { params(screenshot: T::Boolean).void }
                attr_writer :screenshot

                # Outputs to return. Set at least one to `true`.
                sig do
                  params(
                    bytes: T::Boolean,
                    highlights: T::Boolean,
                    html: T::Boolean,
                    images: T::Boolean,
                    json: T::Boolean,
                    markdown: T::Boolean,
                    parse: T::Boolean,
                    product: T::Boolean,
                    screenshot: T::Boolean
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The original HTTP response body.
                  bytes: nil,
                  # Markdown excerpts relevant to `highlightsParams.query`.
                  highlights: nil,
                  # Rendered HTML.
                  html: nil,
                  # Images found on the page.
                  images: nil,
                  # An object matching `jsonParams.schema`, extracted from the page.
                  json: nil,
                  # Page content as Markdown.
                  markdown: nil,
                  # Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
                  parse: nil,
                  # Product details such as name, price, and availability.
                  product: nil,
                  # A screenshot of the page.
                  screenshot: nil
                )
                end

                sig do
                  override.returns(
                    {
                      bytes: T::Boolean,
                      highlights: T::Boolean,
                      html: T::Boolean,
                      images: T::Boolean,
                      json: T::Boolean,
                      markdown: T::Boolean,
                      parse: T::Boolean,
                      product: T::Boolean,
                      screenshot: T::Boolean
                    }
                  )
                end
                def to_hash
                end
              end

              class URL < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::URL,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Page URL to scrape.
                sig { returns(String) }
                attr_accessor :url

                # Your ID for this page, returned with its result. The same URL can use different
                # IDs.
                sig { returns(T.nilable(String)) }
                attr_reader :item_id

                sig { params(item_id: String).void }
                attr_writer :item_id

                # Custom JSON returned unchanged with this page result.
                sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
                attr_reader :meta

                sig { params(meta: T::Hash[Symbol, T.anything]).void }
                attr_writer :meta

                # A page to scrape, with optional data for matching results.
                sig do
                  params(
                    url: String,
                    item_id: String,
                    meta: T::Hash[Symbol, T.anything]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Page URL to scrape.
                  url:,
                  # Your ID for this page, returned with its result. The same URL can use different
                  # IDs.
                  item_id: nil,
                  # Custom JSON returned unchanged with this page result.
                  meta: nil
                )
                end

                sig do
                  override.returns(
                    {
                      url: String,
                      item_id: String,
                      meta: T::Hash[Symbol, T.anything]
                    }
                  )
                end
                def to_hash
                end
              end

              class HighlightsParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::HighlightsParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # The question or topic to find passages for.
                sig { returns(String) }
                attr_accessor :query

                # Maximum combined length of returned passages.
                sig { returns(T.nilable(Integer)) }
                attr_reader :max_characters

                sig { params(max_characters: Integer).void }
                attr_writer :max_characters

                # Requires `formats.highlights: true`; required when it is set.
                sig do
                  params(query: String, max_characters: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # The question or topic to find passages for.
                  query:,
                  # Maximum combined length of returned passages.
                  max_characters: nil
                )
                end

                sig do
                  override.returns({ query: String, max_characters: Integer })
                end
                def to_hash
                end
              end

              class ImageParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Set `visual` to drop visual duplicates, keeping the largest copy.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe::OrSymbol
                    )
                  )
                end
                attr_reader :dedupe

                sig do
                  params(
                    dedupe:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe::OrSymbol
                  ).void
                end
                attr_writer :dedupe

                # Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.
                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich::OrSymbol
                      ]
                    )
                  )
                end
                attr_reader :enrich

                sig do
                  params(
                    enrich:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich::OrSymbol
                      ]
                  ).void
                end
                attr_writer :enrich

                # Image options. Requires formats.images: true.
                sig do
                  params(
                    dedupe:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe::OrSymbol,
                    enrich:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich::OrSymbol
                      ]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Set `visual` to drop visual duplicates, keeping the largest copy.
                  dedupe: nil,
                  # Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.
                  enrich: nil
                )
                end

                sig do
                  override.returns(
                    {
                      dedupe:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe::OrSymbol,
                      enrich:
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich::OrSymbol
                        ]
                    }
                  )
                end
                def to_hash
                end

                # Set `visual` to drop visual duplicates, keeping the largest copy.
                module Dedupe
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  NONE =
                    T.let(
                      :none,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe::TaggedSymbol
                    )
                  VISUAL =
                    T.let(
                      :visual,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Dedupe::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                module Enrich
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  DIMENSIONS =
                    T.let(
                      :dimensions,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich::TaggedSymbol
                    )
                  CLASSIFICATION =
                    T.let(
                      :classification,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich::TaggedSymbol
                    )
                  FILE =
                    T.let(
                      :file,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ImageParams::Enrich::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              class JsonParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::JsonParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # JSON Schema (not an example object) for a top-level object, up to 50 KB. Use
                # optional or nullable fields for missing facts.
                sig { returns(T::Hash[Symbol, T.anything]) }
                attr_accessor :schema

                # Extra guidance, such as which facts to prefer or how to read a field.
                sig { returns(T.nilable(String)) }
                attr_reader :instructions

                sig { params(instructions: String).void }
                attr_writer :instructions

                # Requires `formats.json: true`; required when it is set.
                sig do
                  params(
                    schema: T::Hash[Symbol, T.anything],
                    instructions: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # JSON Schema (not an example object) for a top-level object, up to 50 KB. Use
                  # optional or nullable fields for missing facts.
                  schema:,
                  # Extra guidance, such as which facts to prefer or how to read a field.
                  instructions: nil
                )
                end

                sig do
                  override.returns(
                    {
                      schema: T::Hash[Symbol, T.anything],
                      instructions: String
                    }
                  )
                end
                def to_hash
                end
              end

              class MarkdownParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Include images in the Markdown (`html-conversion` only).
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_images

                sig { params(include_images: T::Boolean).void }
                attr_writer :include_images

                # Keep link URLs in the Markdown (`html-conversion` only).
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_links

                sig { params(include_links: T::Boolean).void }
                attr_writer :include_links

                # How base64 images appear when `includeImages` is set (`html-conversion` only).
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages::OrSymbol
                    )
                  )
                end
                attr_reader :inline_images

                sig do
                  params(
                    inline_images:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages::OrSymbol
                  ).void
                end
                attr_writer :inline_images

                # Markdown sources in order of preference: `html-conversion` converts the page
                # HTML, `markdown-direct` uses Markdown the site publishes.
                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference::OrSymbol
                      ]
                    )
                  )
                end
                attr_reader :source_preference

                sig do
                  params(
                    source_preference:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference::OrSymbol
                      ]
                  ).void
                end
                attr_writer :source_preference

                # Markdown options. Requires `formats.markdown`.
                sig do
                  params(
                    include_images: T::Boolean,
                    include_links: T::Boolean,
                    inline_images:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages::OrSymbol,
                    source_preference:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference::OrSymbol
                      ]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Include images in the Markdown (`html-conversion` only).
                  include_images: nil,
                  # Keep link URLs in the Markdown (`html-conversion` only).
                  include_links: nil,
                  # How base64 images appear when `includeImages` is set (`html-conversion` only).
                  inline_images: nil,
                  # Markdown sources in order of preference: `html-conversion` converts the page
                  # HTML, `markdown-direct` uses Markdown the site publishes.
                  source_preference: nil
                )
                end

                sig do
                  override.returns(
                    {
                      include_images: T::Boolean,
                      include_links: T::Boolean,
                      inline_images:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages::OrSymbol,
                      source_preference:
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference::OrSymbol
                        ]
                    }
                  )
                end
                def to_hash
                end

                # How base64 images appear when `includeImages` is set (`html-conversion` only).
                module InlineImages
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  PLACEHOLDER =
                    T.let(
                      :placeholder,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages::TaggedSymbol
                    )
                  PRESERVE =
                    T.let(
                      :preserve,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::InlineImages::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                module SourcePreference
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  HTML_CONVERSION =
                    T.let(
                      :"html-conversion",
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference::TaggedSymbol
                    )
                  MARKDOWN_DIRECT =
                    T.let(
                      :"markdown-direct",
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::MarkdownParams::SourcePreference::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Requires `formats.parse: true`; required when it is set.
              module ParseParams
                extend ContextDev::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser
                    )
                  end

                class CustomParser < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100
                  # fields, 5 levels.
                  sig do
                    returns(
                      T::Hash[
                        Symbol,
                        T.any(
                          String,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1
                        )
                      ]
                    )
                  end
                  attr_accessor :rules

                  # Extract fields using custom CSS rules. This is the default when type is omitted.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Type::OrSymbol
                      )
                    )
                  end
                  attr_reader :type

                  sig do
                    params(
                      type:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Type::OrSymbol
                    ).void
                  end
                  attr_writer :type

                  sig do
                    params(
                      rules:
                        T::Hash[
                          Symbol,
                          T.any(
                            String,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::OrHash
                          )
                        ],
                      type:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Type::OrSymbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100
                    # fields, 5 levels.
                    rules:,
                    # Extract fields using custom CSS rules. This is the default when type is omitted.
                    type: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        rules:
                          T::Hash[
                            Symbol,
                            T.any(
                              String,
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1
                            )
                          ],
                        type:
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Type::OrSymbol
                      }
                    )
                  end
                  def to_hash
                  end

                  module Rule
                    extend ContextDev::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.any(
                          String,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1
                        )
                      end

                    class UnionMember1 < ContextDev::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1,
                            ContextDev::Internal::AnyHash
                          )
                        end

                      # CSS selector to match within the current page or parent rule.
                      sig { returns(String) }
                      attr_accessor :selector

                      # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                      # to text.
                      sig do
                        returns(
                          T.nilable(
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                              String,
                              T.anything
                            )
                          )
                        )
                      end
                      attr_reader :output

                      sig do
                        params(
                          output:
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                              String,
                              T.anything
                            )
                        ).void
                      end
                      attr_writer :output

                      # Return the first match with `item` or all matches with `list`.
                      sig do
                        returns(
                          T.nilable(
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                          )
                        )
                      end
                      attr_reader :type

                      sig do
                        params(
                          type:
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                        ).void
                      end
                      attr_writer :type

                      sig do
                        params(
                          selector: String,
                          output:
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                              String,
                              T.anything
                            ),
                          type:
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                        ).returns(T.attached_class)
                      end
                      def self.new(
                        # CSS selector to match within the current page or parent rule.
                        selector:,
                        # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                        # to text.
                        output: nil,
                        # Return the first match with `item` or all matches with `list`.
                        type: nil
                      )
                      end

                      sig do
                        override.returns(
                          {
                            selector: String,
                            output:
                              T.any(
                                ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                                String,
                                T.anything
                              ),
                            type:
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                          }
                        )
                      end
                      def to_hash
                      end

                      # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                      # to text.
                      module Output
                        extend ContextDev::Internal::Type::Union

                        Variants =
                          T.type_alias do
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol,
                              String,
                              T.anything
                            )
                          end

                        sig do
                          override.returns(
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::Variants
                            ]
                          )
                        end
                        def self.variants
                        end

                        TaggedSymbol =
                          T.type_alias do
                            T.all(
                              Symbol,
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output
                            )
                          end
                        OrSymbol = T.type_alias { T.any(Symbol, String) }

                        TEXT =
                          T.let(
                            :text,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol
                          )
                        HTML =
                          T.let(
                            :html,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol
                          )
                      end

                      # Return the first match with `item` or all matches with `list`.
                      module Type
                        extend ContextDev::Internal::Type::Enum

                        TaggedSymbol =
                          T.type_alias do
                            T.all(
                              Symbol,
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type
                            )
                          end
                        OrSymbol = T.type_alias { T.any(Symbol, String) }

                        ITEM =
                          T.let(
                            :item,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type::TaggedSymbol
                          )
                        LIST =
                          T.let(
                            :list,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type::TaggedSymbol
                          )

                        sig do
                          override.returns(
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::UnionMember1::Type::TaggedSymbol
                            ]
                          )
                        end
                        def self.values
                        end
                      end
                    end

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Rule::Variants
                        ]
                      )
                    end
                    def self.variants
                    end
                  end

                  # Extract fields using custom CSS rules. This is the default when type is omitted.
                  module Type
                    extend ContextDev::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Type
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    CUSTOM =
                      T.let(
                        :custom,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Type::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::CustomParser::Type::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end

                class PrebuiltParser < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # google-maps parses Google Maps business data into data.results. Accepts Maps
                  # place, search, and internal data URLs. Uses a US exit and English labels
                  # regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
                  # a place in data.reviews, in the same shape as the Serper reviews API (rating,
                  # date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
                  # id), plus language, guided ratings in details, and user.isLocalGuide; data also
                  # carries the place featureId, cid, and sort. sort and limit pick the order and
                  # count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
                  # search.google.com/local/reviews URLs, so the google_maps_url and
                  # google_reviews_url fields of google-maps results work as input. An unknown place
                  # returns no reviews. google-play parses a Play Store app into data: details,
                  # developer contact, ratings, price, permissions, and data safety.
                  # google-play-reviews returns the 200 newest reviews of the app, with developer
                  # replies, in data.reviews. Both Play parsers accept app details URLs
                  # (play.google.com/store/apps/details?id=…); hl and gl set the language and
                  # storefront, defaulting to en and us. app-store parses an App Store app into
                  # data: details, developer, ratings, price, version, and screenshots.
                  # app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
                  # Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
                  # path sets the storefront, defaulting to us. g2-reviews returns the 25 most
                  # recently published reviews of a G2 product in data.reviews (rating, title,
                  # likes, dislikes, problems_solved, reviewer role, company size, and industry),
                  # plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
                  # renamed products, and keeps star-rating filters from the URL
                  # (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
                  # ignored. instagram-profile parses a public profile (instagram.com/{username})
                  # into data: bio, links, follower and post counts, category, business address,
                  # similar_accounts, and latest_posts (up to the 12 posts at the top of the
                  # profile, newest first). Instagram lists pinned posts there ahead of newer ones,
                  # so posts with is_pinned true can be older; when Instagram shows only a rounded
                  # post count (32K), post_count is that rounded number and is_post_count_rounded is
                  # true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
                  # hashtags, mentions, like, comment, and view counts (like_count and view_count
                  # are null when the owner hides them), media URLs, tagged users, collaborators,
                  # location, and the top ~14 comments in data.comments. instagram-feed returns the
                  # top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
                  # posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
                  # carry only the shortcode, owner, thumbnail, and views, plus the caption when
                  # Instagram shows it. All three Instagram parsers read public data without logging
                  # in, so private accounts return no posts and follower lists are unavailable.
                  # tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
                  # nickname, bio, bio link, follower, following, like, and video counts, verified,
                  # private, and business flags, and business category; it does not list videos.
                  # tiktok-video parses a video or photo post (/@{username}/video/{id} or
                  # /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
                  # like, comment, share, save, and repost counts, duration, thumbnail, a video_url
                  # that downloads without cookies, image_urls for photo posts, music, location, and
                  # ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
                  # tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
                  # from a hashtag URL (/tag/{name}), or the top 12 from a search URL
                  # (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
                  # photo post as data.comments: text, posted_at, like and reply counts, whether the
                  # author liked it, and the commenter. tiktok-followers and tiktok-following return
                  # up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
                  # tiktok-user-search returns the top 10 accounts for a user search URL
                  # (/search/user?q={query}) as data.users: id, username, nickname, biography,
                  # avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
                  # parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
                  # links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). yelp-search accepts Yelp
                  # search URLs with find_desc and find_loc, reads start as the result offset, and
                  # returns up to 20 ranked organic businesses in data.businesses with total and
                  # pagination. emails accepts any page and returns its email addresses as
                  # data.emails ([{ email }]), read from mailto links, Cloudflare-protected
                  # addresses, and visible text. phone-numbers accepts any page and returns its
                  # valid phone numbers in E.164 as data.phone_numbers ([{ phone }]), read from tel
                  # links and visible text; numbers without a country code are read for the country
                  # of the site TLD, defaulting to US. links accepts any page and returns its unique
                  # http(s) links as data.links ([{ url, text }]), with absolute URLs; text falls
                  # back to aria-label or image alt and is null when a link has none. The emails
                  # parser reads the rendered page and respects content filters; the other prebuilt
                  # parsers read their data independently of DOM filters.
                  sig do
                    returns(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::OrSymbol
                    )
                  end
                  attr_accessor :parser

                  # Use a prebuilt parser instead of custom rules.
                  sig { returns(Symbol) }
                  attr_accessor :type

                  # google-maps-reviews only. Maximum number of reviews to return. Defaults to 100;
                  # maximum 1000.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :limit

                  sig { params(limit: Integer).void }
                  attr_writer :limit

                  # google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                  # lowest follow Google; oldest returns the earliest reviews first, which Google
                  # itself does not offer.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort::OrSymbol
                      )
                    )
                  end
                  attr_reader :sort

                  sig do
                    params(
                      sort:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort::OrSymbol
                    ).void
                  end
                  attr_writer :sort

                  sig do
                    params(
                      parser:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::OrSymbol,
                      limit: Integer,
                      sort:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort::OrSymbol,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # google-maps parses Google Maps business data into data.results. Accepts Maps
                    # place, search, and internal data URLs. Uses a US exit and English labels
                    # regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
                    # a place in data.reviews, in the same shape as the Serper reviews API (rating,
                    # date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
                    # id), plus language, guided ratings in details, and user.isLocalGuide; data also
                    # carries the place featureId, cid, and sort. sort and limit pick the order and
                    # count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
                    # search.google.com/local/reviews URLs, so the google_maps_url and
                    # google_reviews_url fields of google-maps results work as input. An unknown place
                    # returns no reviews. google-play parses a Play Store app into data: details,
                    # developer contact, ratings, price, permissions, and data safety.
                    # google-play-reviews returns the 200 newest reviews of the app, with developer
                    # replies, in data.reviews. Both Play parsers accept app details URLs
                    # (play.google.com/store/apps/details?id=…); hl and gl set the language and
                    # storefront, defaulting to en and us. app-store parses an App Store app into
                    # data: details, developer, ratings, price, version, and screenshots.
                    # app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
                    # Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
                    # path sets the storefront, defaulting to us. g2-reviews returns the 25 most
                    # recently published reviews of a G2 product in data.reviews (rating, title,
                    # likes, dislikes, problems_solved, reviewer role, company size, and industry),
                    # plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
                    # renamed products, and keeps star-rating filters from the URL
                    # (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
                    # ignored. instagram-profile parses a public profile (instagram.com/{username})
                    # into data: bio, links, follower and post counts, category, business address,
                    # similar_accounts, and latest_posts (up to the 12 posts at the top of the
                    # profile, newest first). Instagram lists pinned posts there ahead of newer ones,
                    # so posts with is_pinned true can be older; when Instagram shows only a rounded
                    # post count (32K), post_count is that rounded number and is_post_count_rounded is
                    # true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
                    # hashtags, mentions, like, comment, and view counts (like_count and view_count
                    # are null when the owner hides them), media URLs, tagged users, collaborators,
                    # location, and the top ~14 comments in data.comments. instagram-feed returns the
                    # top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
                    # posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
                    # carry only the shortcode, owner, thumbnail, and views, plus the caption when
                    # Instagram shows it. All three Instagram parsers read public data without logging
                    # in, so private accounts return no posts and follower lists are unavailable.
                    # tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
                    # nickname, bio, bio link, follower, following, like, and video counts, verified,
                    # private, and business flags, and business category; it does not list videos.
                    # tiktok-video parses a video or photo post (/@{username}/video/{id} or
                    # /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
                    # like, comment, share, save, and repost counts, duration, thumbnail, a video_url
                    # that downloads without cookies, image_urls for photo posts, music, location, and
                    # ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
                    # tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
                    # from a hashtag URL (/tag/{name}), or the top 12 from a search URL
                    # (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
                    # photo post as data.comments: text, posted_at, like and reply counts, whether the
                    # author liked it, and the commenter. tiktok-followers and tiktok-following return
                    # up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
                    # tiktok-user-search returns the top 10 accounts for a user search URL
                    # (/search/user?q={query}) as data.users: id, username, nickname, biography,
                    # avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
                    # parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
                    # links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). yelp-search accepts Yelp
                    # search URLs with find_desc and find_loc, reads start as the result offset, and
                    # returns up to 20 ranked organic businesses in data.businesses with total and
                    # pagination. emails accepts any page and returns its email addresses as
                    # data.emails ([{ email }]), read from mailto links, Cloudflare-protected
                    # addresses, and visible text. phone-numbers accepts any page and returns its
                    # valid phone numbers in E.164 as data.phone_numbers ([{ phone }]), read from tel
                    # links and visible text; numbers without a country code are read for the country
                    # of the site TLD, defaulting to US. links accepts any page and returns its unique
                    # http(s) links as data.links ([{ url, text }]), with absolute URLs; text falls
                    # back to aria-label or image alt and is null when a link has none. The emails
                    # parser reads the rendered page and respects content filters; the other prebuilt
                    # parsers read their data independently of DOM filters.
                    parser:,
                    # google-maps-reviews only. Maximum number of reviews to return. Defaults to 100;
                    # maximum 1000.
                    limit: nil,
                    # google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                    # lowest follow Google; oldest returns the earliest reviews first, which Google
                    # itself does not offer.
                    sort: nil,
                    # Use a prebuilt parser instead of custom rules.
                    type: :prebuilt
                  )
                  end

                  sig do
                    override.returns(
                      {
                        parser:
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::OrSymbol,
                        type: Symbol,
                        limit: Integer,
                        sort:
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort::OrSymbol
                      }
                    )
                  end
                  def to_hash
                  end

                  # google-maps parses Google Maps business data into data.results. Accepts Maps
                  # place, search, and internal data URLs. Uses a US exit and English labels
                  # regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
                  # a place in data.reviews, in the same shape as the Serper reviews API (rating,
                  # date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
                  # id), plus language, guided ratings in details, and user.isLocalGuide; data also
                  # carries the place featureId, cid, and sort. sort and limit pick the order and
                  # count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
                  # search.google.com/local/reviews URLs, so the google_maps_url and
                  # google_reviews_url fields of google-maps results work as input. An unknown place
                  # returns no reviews. google-play parses a Play Store app into data: details,
                  # developer contact, ratings, price, permissions, and data safety.
                  # google-play-reviews returns the 200 newest reviews of the app, with developer
                  # replies, in data.reviews. Both Play parsers accept app details URLs
                  # (play.google.com/store/apps/details?id=…); hl and gl set the language and
                  # storefront, defaulting to en and us. app-store parses an App Store app into
                  # data: details, developer, ratings, price, version, and screenshots.
                  # app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
                  # Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
                  # path sets the storefront, defaulting to us. g2-reviews returns the 25 most
                  # recently published reviews of a G2 product in data.reviews (rating, title,
                  # likes, dislikes, problems_solved, reviewer role, company size, and industry),
                  # plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
                  # renamed products, and keeps star-rating filters from the URL
                  # (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
                  # ignored. instagram-profile parses a public profile (instagram.com/{username})
                  # into data: bio, links, follower and post counts, category, business address,
                  # similar_accounts, and latest_posts (up to the 12 posts at the top of the
                  # profile, newest first). Instagram lists pinned posts there ahead of newer ones,
                  # so posts with is_pinned true can be older; when Instagram shows only a rounded
                  # post count (32K), post_count is that rounded number and is_post_count_rounded is
                  # true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
                  # hashtags, mentions, like, comment, and view counts (like_count and view_count
                  # are null when the owner hides them), media URLs, tagged users, collaborators,
                  # location, and the top ~14 comments in data.comments. instagram-feed returns the
                  # top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
                  # posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
                  # carry only the shortcode, owner, thumbnail, and views, plus the caption when
                  # Instagram shows it. All three Instagram parsers read public data without logging
                  # in, so private accounts return no posts and follower lists are unavailable.
                  # tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
                  # nickname, bio, bio link, follower, following, like, and video counts, verified,
                  # private, and business flags, and business category; it does not list videos.
                  # tiktok-video parses a video or photo post (/@{username}/video/{id} or
                  # /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
                  # like, comment, share, save, and repost counts, duration, thumbnail, a video_url
                  # that downloads without cookies, image_urls for photo posts, music, location, and
                  # ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
                  # tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
                  # from a hashtag URL (/tag/{name}), or the top 12 from a search URL
                  # (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
                  # photo post as data.comments: text, posted_at, like and reply counts, whether the
                  # author liked it, and the commenter. tiktok-followers and tiktok-following return
                  # up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
                  # tiktok-user-search returns the top 10 accounts for a user search URL
                  # (/search/user?q={query}) as data.users: id, username, nickname, biography,
                  # avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
                  # parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
                  # links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). yelp-search accepts Yelp
                  # search URLs with find_desc and find_loc, reads start as the result offset, and
                  # returns up to 20 ranked organic businesses in data.businesses with total and
                  # pagination. emails accepts any page and returns its email addresses as
                  # data.emails ([{ email }]), read from mailto links, Cloudflare-protected
                  # addresses, and visible text. phone-numbers accepts any page and returns its
                  # valid phone numbers in E.164 as data.phone_numbers ([{ phone }]), read from tel
                  # links and visible text; numbers without a country code are read for the country
                  # of the site TLD, defaulting to US. links accepts any page and returns its unique
                  # http(s) links as data.links ([{ url, text }]), with absolute URLs; text falls
                  # back to aria-label or image alt and is null when a link has none. The emails
                  # parser reads the rendered page and respects content filters; the other prebuilt
                  # parsers read their data independently of DOM filters.
                  module Parser
                    extend ContextDev::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    GOOGLE_MAPS =
                      T.let(
                        :"google-maps",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    GOOGLE_MAPS_REVIEWS =
                      T.let(
                        :"google-maps-reviews",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    GOOGLE_PLAY =
                      T.let(
                        :"google-play",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    GOOGLE_PLAY_REVIEWS =
                      T.let(
                        :"google-play-reviews",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    APP_STORE =
                      T.let(
                        :"app-store",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    APP_STORE_REVIEWS =
                      T.let(
                        :"app-store-reviews",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    G2_REVIEWS =
                      T.let(
                        :"g2-reviews",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    INSTAGRAM_PROFILE =
                      T.let(
                        :"instagram-profile",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    INSTAGRAM_POST =
                      T.let(
                        :"instagram-post",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    INSTAGRAM_FEED =
                      T.let(
                        :"instagram-feed",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_PROFILE =
                      T.let(
                        :"tiktok-profile",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_VIDEO =
                      T.let(
                        :"tiktok-video",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_FEED =
                      T.let(
                        :"tiktok-feed",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_COMMENTS =
                      T.let(
                        :"tiktok-comments",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_FOLLOWERS =
                      T.let(
                        :"tiktok-followers",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_FOLLOWING =
                      T.let(
                        :"tiktok-following",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_USER_SEARCH =
                      T.let(
                        :"tiktok-user-search",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    YELP_SEARCH =
                      T.let(
                        :"yelp-search",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    EMAILS =
                      T.let(
                        :emails,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    PHONE_NUMBERS =
                      T.let(
                        :"phone-numbers",
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    LINKS =
                      T.let(
                        :links,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end

                  # google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                  # lowest follow Google; oldest returns the earliest reviews first, which Google
                  # itself does not offer.
                  module Sort
                    extend ContextDev::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    NEWEST =
                      T.let(
                        :newest,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                      )
                    OLDEST =
                      T.let(
                        :oldest,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                      )
                    RELEVANT =
                      T.let(
                        :relevant,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                      )
                    HIGHEST =
                      T.let(
                        :highest,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                      )
                    LOWEST =
                      T.let(
                        :lowest,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ParseParams::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class ProductParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ProductParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Drop visually duplicate product images, keeping the largest copy.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :dedupe_images

                sig { params(dedupe_images: T::Boolean).void }
                attr_writer :dedupe_images

                # Ignored. The AI fallback runs automatically.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :use_ai_fallback

                sig { params(use_ai_fallback: T::Boolean).void }
                attr_writer :use_ai_fallback

                # Product options. Requires formats.product: true.
                sig do
                  params(
                    dedupe_images: T::Boolean,
                    use_ai_fallback: T::Boolean
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Drop visually duplicate product images, keeping the largest copy.
                  dedupe_images: nil,
                  # Ignored. The AI fallback runs automatically.
                  use_ai_fallback: nil
                )
                end

                sig do
                  override.returns(
                    { dedupe_images: T::Boolean, use_ai_fallback: T::Boolean }
                  )
                end
                def to_hash
                end
              end

              class ScreenshotParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
                # megapixels.
                sig do
                  returns(
                    T.nilable(
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page::OrSymbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Element,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Rectangle
                      )
                    )
                  )
                end
                attr_reader :area

                sig do
                  params(
                    area:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page::OrSymbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Element::OrHash,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Rectangle::OrHash
                      )
                  ).void
                end
                attr_writer :area

                # Image format for the screenshot.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format::OrSymbol
                    )
                  )
                end
                attr_reader :format_

                sig do
                  params(
                    format_:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format::OrSymbol
                  ).void
                end
                attr_writer :format_

                # Screenshot options. Requires formats.screenshot: true.
                sig do
                  params(
                    area:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page::OrSymbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Element::OrHash,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Rectangle::OrHash
                      ),
                    format_:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format::OrSymbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
                  # megapixels.
                  area: nil,
                  # Image format for the screenshot.
                  format_: nil
                )
                end

                sig do
                  override.returns(
                    {
                      area:
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page::OrSymbol,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Element,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Rectangle
                        ),
                      format_:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format::OrSymbol
                    }
                  )
                end
                def to_hash
                end

                # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
                # megapixels.
                module Area
                  extend ContextDev::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page::TaggedSymbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Element,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Rectangle
                      )
                    end

                  module Page
                    extend ContextDev::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    VIEWPORT =
                      T.let(
                        :viewport,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page::TaggedSymbol
                      )
                    FULL_PAGE =
                      T.let(
                        :fullPage,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Page::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end

                  class Element < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Element,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # CSS selector matching exactly one visible element.
                    sig { returns(String) }
                    attr_accessor :selector

                    sig { params(selector: String).returns(T.attached_class) }
                    def self.new(
                      # CSS selector matching exactly one visible element.
                      selector:
                    )
                    end

                    sig { override.returns({ selector: String }) }
                    def to_hash
                    end
                  end

                  class Rectangle < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Rectangle,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Height of the capture in pixels.
                    sig { returns(Integer) }
                    attr_accessor :height

                    # Width of the capture in pixels.
                    sig { returns(Integer) }
                    attr_accessor :width

                    # Left edge of the capture, in pixels from the document origin.
                    sig { returns(Integer) }
                    attr_accessor :x

                    # Top edge of the capture, in pixels from the document origin.
                    sig { returns(Integer) }
                    attr_accessor :y_

                    # Pixels from the document origin.
                    sig do
                      params(
                        height: Integer,
                        width: Integer,
                        x: Integer,
                        y_: Integer
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Height of the capture in pixels.
                      height:,
                      # Width of the capture in pixels.
                      width:,
                      # Left edge of the capture, in pixels from the document origin.
                      x:,
                      # Top edge of the capture, in pixels from the document origin.
                      y_:
                    )
                    end

                    sig do
                      override.returns(
                        {
                          height: Integer,
                          width: Integer,
                          x: Integer,
                          y_: Integer
                        }
                      )
                    end
                    def to_hash
                    end
                  end

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Area::Variants
                      ]
                    )
                  end
                  def self.variants
                  end
                end

                # Image format for the screenshot.
                module Format
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  PNG =
                    T.let(
                      :png,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format::TaggedSymbol
                    )
                  JPEG =
                    T.let(
                      :jpeg,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format::TaggedSymbol
                    )
                  WEBP =
                    T.let(
                      :webp,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::ScreenshotParams::Format::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              class SharedParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Browser steps run in order before capture. Requires a paid plan. Skips the
                # cache.
                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Perform,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Wait,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::WaitFor
                        )
                      ]
                    )
                  )
                end
                attr_reader :actions

                sig do
                  params(
                    actions:
                      T::Array[
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Perform::OrHash,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::OrHash,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Wait::OrHash,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::WaitFor::OrHash
                        )
                      ]
                  ).void
                end
                attr_writer :actions

                # Proxy country as a two-letter code, such as `US`. Case-insensitive.
                sig { returns(T.nilable(String)) }
                attr_reader :country

                sig { params(country: String).void }
                attr_writer :country

                # Accept cookie banners before actions and capture.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :dismiss_cookies

                sig { params(dismiss_cookies: T::Boolean).void }
                attr_writer :dismiss_cookies

                # Close other popups before actions and capture.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :dismiss_popups

                sig { params(dismiss_popups: T::Boolean).void }
                attr_writer :dismiss_popups

                # Remove elements matching these CSS selectors. Overrides `includeSelectors`.
                sig { returns(T.nilable(T::Array[String])) }
                attr_reader :exclude_selectors

                sig { params(exclude_selectors: T::Array[String]).void }
                attr_writer :exclude_selectors

                # HTTP headers to send to the target site. Requests with headers skip the cache.
                sig { returns(T.nilable(T::Hash[Symbol, String])) }
                attr_reader :headers

                sig { params(headers: T::Hash[Symbol, String]).void }
                attr_writer :headers

                # Include iframe content in HTML and text outputs. Screenshots always show visible
                # frames.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_frames

                sig { params(include_frames: T::Boolean).void }
                attr_writer :include_frames

                # Keep only elements matching these CSS selectors.
                sig { returns(T.nilable(T::Array[String])) }
                attr_reader :include_selectors

                sig { params(include_selectors: T::Array[String]).void }
                attr_writer :include_selectors

                # Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :main_content_only

                sig { params(main_content_only: T::Boolean).void }
                attr_writer :main_content_only

                # Document parsing options.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers
                    )
                  )
                end
                attr_reader :parsers

                sig do
                  params(
                    parsers:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::OrHash
                  ).void
                end
                attr_writer :parsers

                # Create or reuse an authenticated browser profile. Requires a paid plan and an
                # HTTPS target. Profiles persist session state, bypass shared caches, and cannot
                # be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
                sig do
                  returns(
                    T.nilable(
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Existing,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::New
                      )
                    )
                  )
                end
                attr_reader :profile

                sig do
                  params(
                    profile:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Existing::OrHash,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::New::OrHash
                      )
                  ).void
                end
                attr_writer :profile

                # Wait for CSS animations to finish before capture. Defaults to `true` when
                # `screenshot` is requested.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :settle_animations

                sig { params(settle_animations: T::Boolean).void }
                attr_writer :settle_animations

                # Emulate a light or dark color scheme.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme::OrSymbol
                    )
                  )
                end
                attr_reader :theme

                sig do
                  params(
                    theme:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme::OrSymbol
                  ).void
                end
                attr_writer :theme

                # Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                # default to 1440 × 900.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Viewport
                    )
                  )
                end
                attr_reader :viewport

                sig do
                  params(
                    viewport:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Viewport::OrHash
                  ).void
                end
                attr_writer :viewport

                # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
                # (2000 with frames or XML).
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::WaitFor::Variants
                    )
                  )
                end
                attr_reader :wait_for

                sig do
                  params(
                    wait_for:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::WaitFor::Variants
                  ).void
                end
                attr_writer :wait_for

                # Browser and content settings shared by all outputs.
                sig do
                  params(
                    actions:
                      T::Array[
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Perform::OrHash,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::OrHash,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Wait::OrHash,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::WaitFor::OrHash
                        )
                      ],
                    country: String,
                    dismiss_cookies: T::Boolean,
                    dismiss_popups: T::Boolean,
                    exclude_selectors: T::Array[String],
                    headers: T::Hash[Symbol, String],
                    include_frames: T::Boolean,
                    include_selectors: T::Array[String],
                    main_content_only: T::Boolean,
                    parsers:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::OrHash,
                    profile:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Existing::OrHash,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::New::OrHash
                      ),
                    settle_animations: T::Boolean,
                    theme:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme::OrSymbol,
                    viewport:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Viewport::OrHash,
                    wait_for:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::WaitFor::Variants
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Browser steps run in order before capture. Requires a paid plan. Skips the
                  # cache.
                  actions: nil,
                  # Proxy country as a two-letter code, such as `US`. Case-insensitive.
                  country: nil,
                  # Accept cookie banners before actions and capture.
                  dismiss_cookies: nil,
                  # Close other popups before actions and capture.
                  dismiss_popups: nil,
                  # Remove elements matching these CSS selectors. Overrides `includeSelectors`.
                  exclude_selectors: nil,
                  # HTTP headers to send to the target site. Requests with headers skip the cache.
                  headers: nil,
                  # Include iframe content in HTML and text outputs. Screenshots always show visible
                  # frames.
                  include_frames: nil,
                  # Keep only elements matching these CSS selectors.
                  include_selectors: nil,
                  # Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
                  main_content_only: nil,
                  # Document parsing options.
                  parsers: nil,
                  # Create or reuse an authenticated browser profile. Requires a paid plan and an
                  # HTTPS target. Profiles persist session state, bypass shared caches, and cannot
                  # be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
                  profile: nil,
                  # Wait for CSS animations to finish before capture. Defaults to `true` when
                  # `screenshot` is requested.
                  settle_animations: nil,
                  # Emulate a light or dark color scheme.
                  theme: nil,
                  # Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                  # default to 1440 × 900.
                  viewport: nil,
                  # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
                  # (2000 with frames or XML).
                  wait_for: nil
                )
                end

                sig do
                  override.returns(
                    {
                      actions:
                        T::Array[
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Perform,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Wait,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::WaitFor
                          )
                        ],
                      country: String,
                      dismiss_cookies: T::Boolean,
                      dismiss_popups: T::Boolean,
                      exclude_selectors: T::Array[String],
                      headers: T::Hash[Symbol, String],
                      include_frames: T::Boolean,
                      include_selectors: T::Array[String],
                      main_content_only: T::Boolean,
                      parsers:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers,
                      profile:
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Existing,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::New
                        ),
                      settle_animations: T::Boolean,
                      theme:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme::OrSymbol,
                      viewport:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Viewport,
                      wait_for:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::WaitFor::Variants
                    }
                  )
                end
                def to_hash
                end

                module Action
                  extend ContextDev::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Perform,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Wait,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::WaitFor
                      )
                    end

                  class Perform < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Perform,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # One browser instruction, such as clicking a button or entering text.
                    sig { returns(String) }
                    attr_accessor :action

                    # Use `perform` for a plain-language browser instruction.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      params(action: String, type: Symbol).returns(
                        T.attached_class
                      )
                    end
                    def self.new(
                      # One browser instruction, such as clicking a button or entering text.
                      action:,
                      # Use `perform` for a plain-language browser instruction.
                      type: :perform
                    )
                    end

                    sig { override.returns({ action: String, type: Symbol }) }
                    def to_hash
                    end
                  end

                  class Scroll < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Use `scroll` to move through the page or a container.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                    sig do
                      returns(
                        T.nilable(
                          T.any(
                            Integer,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::OrSymbol
                          )
                        )
                      )
                    end
                    attr_reader :amount

                    sig do
                      params(
                        amount:
                          T.any(
                            Integer,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::OrSymbol
                          )
                      ).void
                    end
                    attr_writer :amount

                    # Direction to scroll.
                    sig do
                      returns(
                        T.nilable(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction::OrSymbol
                        )
                      )
                    end
                    attr_reader :direction

                    sig do
                      params(
                        direction:
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction::OrSymbol
                      ).void
                    end
                    attr_writer :direction

                    # Maximum number of scroll steps for this action.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_scrolls

                    sig { params(max_scrolls: Integer).void }
                    attr_writer :max_scrolls

                    # Scroll this container. Omit to scroll the page.
                    sig { returns(T.nilable(String)) }
                    attr_reader :selector

                    sig { params(selector: String).void }
                    attr_writer :selector

                    sig do
                      params(
                        amount:
                          T.any(
                            Integer,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::OrSymbol
                          ),
                        direction:
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction::OrSymbol,
                        max_scrolls: Integer,
                        selector: String,
                        type: Symbol
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                      amount: nil,
                      # Direction to scroll.
                      direction: nil,
                      # Maximum number of scroll steps for this action.
                      max_scrolls: nil,
                      # Scroll this container. Omit to scroll the page.
                      selector: nil,
                      # Use `scroll` to move through the page or a container.
                      type: :scroll
                    )
                    end

                    sig do
                      override.returns(
                        {
                          type: Symbol,
                          amount:
                            T.any(
                              Integer,
                              ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::OrSymbol
                            ),
                          direction:
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction::OrSymbol,
                          max_scrolls: Integer,
                          selector: String
                        }
                      )
                    end
                    def to_hash
                    end

                    # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                    module Amount
                      extend ContextDev::Internal::Type::Union

                      Variants =
                        T.type_alias do
                          T.any(
                            Integer,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::TaggedSymbol
                          )
                        end

                      sig do
                        override.returns(
                          T::Array[
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::Variants
                          ]
                        )
                      end
                      def self.variants
                      end

                      TaggedSymbol =
                        T.type_alias do
                          T.all(
                            Symbol,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount
                          )
                        end
                      OrSymbol = T.type_alias { T.any(Symbol, String) }

                      VIEWPORT =
                        T.let(
                          :viewport,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::TaggedSymbol
                        )
                      MAX =
                        T.let(
                          :max,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Amount::TaggedSymbol
                        )
                    end

                    # Direction to scroll.
                    module Direction
                      extend ContextDev::Internal::Type::Enum

                      TaggedSymbol =
                        T.type_alias do
                          T.all(
                            Symbol,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction
                          )
                        end
                      OrSymbol = T.type_alias { T.any(Symbol, String) }

                      DOWN =
                        T.let(
                          :down,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction::TaggedSymbol
                        )
                      UP =
                        T.let(
                          :up,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction::TaggedSymbol
                        )
                      LEFT =
                        T.let(
                          :left,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction::TaggedSymbol
                        )
                      RIGHT =
                        T.let(
                          :right,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction::TaggedSymbol
                        )

                      sig do
                        override.returns(
                          T::Array[
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Scroll::Direction::TaggedSymbol
                          ]
                        )
                      end
                      def self.values
                      end
                    end
                  end

                  class Wait < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Wait,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Time to pause in milliseconds before the next action.
                    sig { returns(Integer) }
                    attr_accessor :milliseconds

                    # Use `wait` to pause for a fixed duration.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      params(milliseconds: Integer, type: Symbol).returns(
                        T.attached_class
                      )
                    end
                    def self.new(
                      # Time to pause in milliseconds before the next action.
                      milliseconds:,
                      # Use `wait` to pause for a fixed duration.
                      type: :wait
                    )
                    end

                    sig do
                      override.returns({ milliseconds: Integer, type: Symbol })
                    end
                    def to_hash
                    end
                  end

                  class WaitFor < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::WaitFor,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # CSS selector to wait for before continuing.
                    sig { returns(String) }
                    attr_accessor :selector

                    # Use `waitFor` to wait for a matching element.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      params(selector: String, type: Symbol).returns(
                        T.attached_class
                      )
                    end
                    def self.new(
                      # CSS selector to wait for before continuing.
                      selector:,
                      # Use `waitFor` to wait for a matching element.
                      type: :waitFor
                    )
                    end

                    sig { override.returns({ selector: String, type: Symbol }) }
                    def to_hash
                    end
                  end

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Action::Variants
                      ]
                    )
                  end
                  def self.variants
                  end
                end

                class Parsers < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # PDF page range and OCR.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf
                      )
                    )
                  end
                  attr_reader :pdf

                  sig do
                    params(
                      pdf:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::OrHash
                    ).void
                  end
                  attr_writer :pdf

                  # Document parsing options.
                  sig do
                    params(
                      pdf:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::OrHash
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # PDF page range and OCR.
                    pdf: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        pdf:
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf
                      }
                    )
                  end
                  def to_hash
                  end

                  class Pdf < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Last page to parse. Must be at least `startPage`.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :end_page

                    sig { params(end_page: Integer).void }
                    attr_writer :end_page

                    # Start each page in the Markdown with a `<!-- page N -->` line using its original
                    # 1-based page number; these responses are never served from cache.
                    sig { returns(T.nilable(T::Boolean)) }
                    attr_reader :include_numbered_pages

                    sig { params(include_numbered_pages: T::Boolean).void }
                    attr_writer :include_numbered_pages

                    # Set `auto` to read scanned pages with OCR.
                    sig do
                      returns(
                        T.nilable(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr::OrSymbol
                        )
                      )
                    end
                    attr_reader :ocr

                    sig do
                      params(
                        ocr:
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr::OrSymbol
                      ).void
                    end
                    attr_writer :ocr

                    # First page to parse, starting at 1.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :start_page

                    sig { params(start_page: Integer).void }
                    attr_writer :start_page

                    # PDF page range and OCR.
                    sig do
                      params(
                        end_page: Integer,
                        include_numbered_pages: T::Boolean,
                        ocr:
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr::OrSymbol,
                        start_page: Integer
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Last page to parse. Must be at least `startPage`.
                      end_page: nil,
                      # Start each page in the Markdown with a `<!-- page N -->` line using its original
                      # 1-based page number; these responses are never served from cache.
                      include_numbered_pages: nil,
                      # Set `auto` to read scanned pages with OCR.
                      ocr: nil,
                      # First page to parse, starting at 1.
                      start_page: nil
                    )
                    end

                    sig do
                      override.returns(
                        {
                          end_page: Integer,
                          include_numbered_pages: T::Boolean,
                          ocr:
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr::OrSymbol,
                          start_page: Integer
                        }
                      )
                    end
                    def to_hash
                    end

                    # Set `auto` to read scanned pages with OCR.
                    module Ocr
                      extend ContextDev::Internal::Type::Enum

                      TaggedSymbol =
                        T.type_alias do
                          T.all(
                            Symbol,
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr
                          )
                        end
                      OrSymbol = T.type_alias { T.any(Symbol, String) }

                      OFF =
                        T.let(
                          :off,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr::TaggedSymbol
                        )
                      AUTO =
                        T.let(
                          :auto,
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr::TaggedSymbol
                        )

                      sig do
                        override.returns(
                          T::Array[
                            ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Parsers::Pdf::Ocr::TaggedSymbol
                          ]
                        )
                      end
                      def self.values
                      end
                    end
                  end
                end

                # Create or reuse an authenticated browser profile. Requires a paid plan and an
                # HTTPS target. Profiles persist session state, bypass shared caches, and cannot
                # be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
                module Profile
                  extend ContextDev::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Existing,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::New
                      )
                    end

                  class Existing < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Existing,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # The ID returned in profile.id by an earlier scrape.
                    sig { returns(String) }
                    attr_accessor :profile_id

                    # Reuse a saved browser profile.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      params(profile_id: String, type: Symbol).returns(
                        T.attached_class
                      )
                    end
                    def self.new(
                      # The ID returned in profile.id by an earlier scrape.
                      profile_id:,
                      # Reuse a saved browser profile.
                      type: :existing
                    )
                    end

                    sig do
                      override.returns({ profile_id: String, type: Symbol })
                    end
                    def to_hash
                    end
                  end

                  class New < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::New,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Username or email for the target website.
                    sig { returns(String) }
                    attr_accessor :identifier

                    # Sign in and create a browser profile.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    # Optional label shown when listing profiles with `GET /org/browser/profiles`.
                    sig { returns(T.nilable(String)) }
                    attr_reader :description

                    sig { params(description: String).void }
                    attr_writer :description

                    # Password used to sign in. It is never stored in the profile.
                    sig { returns(String) }
                    attr_accessor :password

                    sig do
                      params(
                        identifier: String,
                        password: String,
                        description: String,
                        type: Symbol
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Username or email for the target website.
                      identifier:,
                      # Password used to sign in. It is never stored in the profile.
                      password:,
                      # Optional label shown when listing profiles with `GET /org/browser/profiles`.
                      description: nil,
                      # Sign in and create a browser profile.
                      type: :new
                    )
                    end

                    sig do
                      override.returns(
                        {
                          identifier: String,
                          password: String,
                          type: Symbol,
                          description: String
                        }
                      )
                    end
                    def to_hash
                    end
                  end

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Profile::Variants
                      ]
                    )
                  end
                  def self.variants
                  end
                end

                # Emulate a light or dark color scheme.
                module Theme
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  LIGHT =
                    T.let(
                      :light,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme::TaggedSymbol
                    )
                  DARK =
                    T.let(
                      :dark,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Theme::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Viewport < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::Viewport,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Browser viewport height in pixels.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :height

                  sig { params(height: Integer).void }
                  attr_writer :height

                  # Browser viewport width in pixels.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :width

                  sig { params(width: Integer).void }
                  attr_writer :width

                  # Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                  # default to 1440 × 900.
                  sig do
                    params(height: Integer, width: Integer).returns(
                      T.attached_class
                    )
                  end
                  def self.new(
                    # Browser viewport height in pixels.
                    height: nil,
                    # Browser viewport width in pixels.
                    width: nil
                  )
                  end

                  sig { override.returns({ height: Integer, width: Integer }) }
                  def to_hash
                  end
                end

                # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
                # (2000 with frames or XML).
                module WaitFor
                  extend ContextDev::Internal::Type::Union

                  Variants = T.type_alias { T.any(Integer, String) }

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::SharedParams::WaitFor::Variants
                      ]
                    )
                  end
                  def self.variants
                  end
                end
              end

              class TimeoutOpts < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Deadline in milliseconds.
                sig { returns(Integer) }
                attr_accessor :milliseconds

                # "fail" returns 408 at the deadline. "return-partial" returns available results;
                # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior::OrSymbol
                    )
                  )
                end
                attr_reader :behavior

                sig do
                  params(
                    behavior:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior::OrSymbol
                  ).void
                end
                attr_writer :behavior

                # Deadline for each page, using the same behavior and defaults as POST
                # /web/scrape.
                sig do
                  params(
                    milliseconds: Integer,
                    behavior:
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior::OrSymbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Deadline in milliseconds.
                  milliseconds:,
                  # "fail" returns 408 at the deadline. "return-partial" returns available results;
                  # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
                  behavior: nil
                )
                end

                sig do
                  override.returns(
                    {
                      milliseconds: Integer,
                      behavior:
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior::OrSymbol
                    }
                  )
                end
                def to_hash
                end

                # "fail" returns 408 at the deadline. "return-partial" returns available results;
                # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
                module Behavior
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  FAIL =
                    T.let(
                      :fail,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior::TaggedSymbol
                    )
                  RETURN_PARTIAL =
                    T.let(
                      :"return-partial",
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::TimeoutOpts::Behavior::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Batches persist their results. Only disabled is supported; enabled returns
              # ZDR_NOT_SUPPORTED.
              module Zdr
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Zdr
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DISABLED =
                  T.let(
                    :disabled,
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Zdr::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::BatchUnifiedScrapeData::Zdr::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            sig do
              override.returns(
                T::Array[
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        class Crawl < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::BatchSubmitParams::Input::Crawl,
                ContextDev::Internal::AnyHash
              )
            end

          # Crawl source and output format.
          sig do
            returns(
              T.any(
                ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown,
                ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML,
                ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData
              )
            )
          end
          attr_accessor :data

          # Discover and scrape pages from `data.source`.
          sig { returns(Symbol) }
          attr_accessor :mode

          # Crawl pages starting from a URL or from a domain's sitemap.
          sig do
            params(
              data:
                T.any(
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::OrHash,
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::OrHash,
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::OrHash
                ),
              mode: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Crawl source and output format.
            data:,
            # Discover and scrape pages from `data.source`.
            mode: :crawl
          )
          end

          sig do
            override.returns(
              {
                data:
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown,
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML,
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData
                  ),
                mode: Symbol
              }
            )
          end
          def to_hash
          end

          # Crawl source and output format.
          module Data
            extend ContextDev::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown,
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML,
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData
                )
              end

            class Markdown < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Return page content as Markdown.
              sig do
                returns(
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Format::OrSymbol
                )
              end
              attr_accessor :format_

              # How to find pages to crawl.
              sig do
                returns(
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL,
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap
                  )
                )
              end
              attr_accessor :source

              # Options for Markdown output.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options
                  )
                )
              end
              attr_reader :options

              sig do
                params(
                  options:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::OrHash
                ).void
              end
              attr_writer :options

              # Crawl pages and return Markdown.
              sig do
                params(
                  format_:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Format::OrSymbol,
                  source:
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::OrHash,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::OrHash
                    ),
                  options:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # Return page content as Markdown.
                format_:,
                # How to find pages to crawl.
                source:,
                # Options for Markdown output.
                options: nil
              )
              end

              sig do
                override.returns(
                  {
                    format_:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Format::OrSymbol,
                    source:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap
                      ),
                    options:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options
                  }
                )
              end
              def to_hash
              end

              # Return page content as Markdown.
              module Format
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Format
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                MARKDOWN =
                  T.let(
                    :markdown,
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Format::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Format::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # How to find pages to crawl.
              module Source
                extend ContextDev::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap
                    )
                  end

                class StartURL < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Start from one page.
                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Page where crawling begins. A URL without a scheme is read as https://.
                  sig { returns(String) }
                  attr_accessor :url

                  # Limits and filters for page discovery.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls
                      )
                    )
                  end
                  attr_reader :controls

                  sig do
                    params(
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::OrHash
                    ).void
                  end
                  attr_writer :controls

                  # Discover pages by following links from one URL.
                  sig do
                    params(
                      url: String,
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::OrHash,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Page where crawling begins. A URL without a scheme is read as https://.
                    url:,
                    # Limits and filters for page discovery.
                    controls: nil,
                    # Start from one page.
                    type: :start_url
                  )
                  end

                  sig do
                    override.returns(
                      {
                        type: Symbol,
                        url: String,
                        controls:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls
                      }
                    )
                  end
                  def to_hash
                  end

                  class Controls < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                    # itself is always included.
                    sig { returns(T.nilable(String)) }
                    attr_reader :exclude_regex

                    sig { params(exclude_regex: String).void }
                    attr_writer :exclude_regex

                    # Follow links to subdomains.
                    sig { returns(T.nilable(T::Boolean)) }
                    attr_reader :follow_subdomains

                    sig { params(follow_subdomains: T::Boolean).void }
                    attr_writer :follow_subdomains

                    # Only follow pages in these languages, or `same_as_start_url`; all languages when
                    # omitted.
                    sig do
                      returns(
                        T.nilable(
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::OrSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                            ]
                          )
                        )
                      )
                    end
                    attr_reader :languages

                    sig do
                      params(
                        languages:
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::OrSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                            ]
                          )
                      ).void
                    end
                    attr_writer :languages

                    # Maximum link depth. Source pages are depth 0. No limit when omitted.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_depth

                    sig { params(max_depth: Integer).void }
                    attr_writer :max_depth

                    # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_urls

                    sig { params(max_urls: Integer).void }
                    attr_writer :max_urls

                    # Regex pattern for URLs to include. The `start_url` itself is always included.
                    sig { returns(T.nilable(String)) }
                    attr_reader :regex

                    sig { params(regex: String).void }
                    attr_writer :regex

                    # Limits and filters for page discovery.
                    sig do
                      params(
                        exclude_regex: String,
                        follow_subdomains: T::Boolean,
                        languages:
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::OrSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                            ]
                          ),
                        max_depth: Integer,
                        max_urls: Integer,
                        regex: String
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                      # itself is always included.
                      exclude_regex: nil,
                      # Follow links to subdomains.
                      follow_subdomains: nil,
                      # Only follow pages in these languages, or `same_as_start_url`; all languages when
                      # omitted.
                      languages: nil,
                      # Maximum link depth. Source pages are depth 0. No limit when omitted.
                      max_depth: nil,
                      # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                      max_urls: nil,
                      # Regex pattern for URLs to include. The `start_url` itself is always included.
                      regex: nil
                    )
                    end

                    sig do
                      override.returns(
                        {
                          exclude_regex: String,
                          follow_subdomains: T::Boolean,
                          languages:
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::OrSymbol,
                              T::Array[
                                ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                              ]
                            ),
                          max_depth: Integer,
                          max_urls: Integer,
                          regex: String
                        }
                      )
                    end
                    def to_hash
                    end

                    # Only follow pages in these languages, or `same_as_start_url`; all languages when
                    # omitted.
                    module Languages
                      extend ContextDev::Internal::Type::Union

                      Variants =
                        T.type_alias do
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::TaggedSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                            ]
                          )
                        end

                      module UnionMember1
                        extend ContextDev::Internal::Type::Enum

                        TaggedSymbol =
                          T.type_alias do
                            T.all(
                              Symbol,
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1
                            )
                          end
                        OrSymbol = T.type_alias { T.any(Symbol, String) }

                        AM =
                          T.let(
                            :am,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        AR =
                          T.let(
                            :ar,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        AZ =
                          T.let(
                            :az,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        BE =
                          T.let(
                            :be,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        BG =
                          T.let(
                            :bg,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        BN =
                          T.let(
                            :bn,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CA =
                          T.let(
                            :ca,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CEB =
                          T.let(
                            :ceb,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CS =
                          T.let(
                            :cs,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CY =
                          T.let(
                            :cy,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        DA =
                          T.let(
                            :da,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        DE =
                          T.let(
                            :de,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        EL =
                          T.let(
                            :el,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        EN =
                          T.let(
                            :en,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ES =
                          T.let(
                            :es,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ET =
                          T.let(
                            :et,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        EU =
                          T.let(
                            :eu,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        FA =
                          T.let(
                            :fa,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        FI =
                          T.let(
                            :fi,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        FR =
                          T.let(
                            :fr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        GU =
                          T.let(
                            :gu,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HA =
                          T.let(
                            :ha,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HAW =
                          T.let(
                            :haw,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HE =
                          T.let(
                            :he,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HI =
                          T.let(
                            :hi,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HR =
                          T.let(
                            :hr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HU =
                          T.let(
                            :hu,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HY =
                          T.let(
                            :hy,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ID =
                          T.let(
                            :id,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        IS =
                          T.let(
                            :is,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        IT =
                          T.let(
                            :it,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        JA =
                          T.let(
                            :ja,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KA =
                          T.let(
                            :ka,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KK =
                          T.let(
                            :kk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KN =
                          T.let(
                            :kn,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KO =
                          T.let(
                            :ko,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KU =
                          T.let(
                            :ku,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KY =
                          T.let(
                            :ky,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        LO =
                          T.let(
                            :lo,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        LT =
                          T.let(
                            :lt,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        LV =
                          T.let(
                            :lv,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MK =
                          T.let(
                            :mk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ML =
                          T.let(
                            :ml,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MN =
                          T.let(
                            :mn,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MR =
                          T.let(
                            :mr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MS =
                          T.let(
                            :ms,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        NE =
                          T.let(
                            :ne,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        NL =
                          T.let(
                            :nl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        NO =
                          T.let(
                            :no,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        OR =
                          T.let(
                            :or,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PA =
                          T.let(
                            :pa,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PL =
                          T.let(
                            :pl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PS =
                          T.let(
                            :ps,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PT =
                          T.let(
                            :pt,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        RO =
                          T.let(
                            :ro,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        RU =
                          T.let(
                            :ru,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SK =
                          T.let(
                            :sk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SL =
                          T.let(
                            :sl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SO =
                          T.let(
                            :so,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SQ =
                          T.let(
                            :sq,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SR =
                          T.let(
                            :sr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SV =
                          T.let(
                            :sv,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SW =
                          T.let(
                            :sw,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TA =
                          T.let(
                            :ta,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TE =
                          T.let(
                            :te,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TH =
                          T.let(
                            :th,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TL =
                          T.let(
                            :tl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TR =
                          T.let(
                            :tr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        UK =
                          T.let(
                            :uk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        UR =
                          T.let(
                            :ur,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        UZ =
                          T.let(
                            :uz,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        VI =
                          T.let(
                            :vi,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        YO =
                          T.let(
                            :yo,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ZH =
                          T.let(
                            :zh,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )

                        sig do
                          override.returns(
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                            ]
                          )
                        end
                        def self.values
                        end
                      end

                      sig do
                        override.returns(
                          T::Array[
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::Variants
                          ]
                        )
                      end
                      def self.variants
                      end

                      TaggedSymbol =
                        T.type_alias do
                          T.all(
                            Symbol,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages
                          )
                        end
                      OrSymbol = T.type_alias { T.any(Symbol, String) }

                      SAME_AS_START_URL =
                        T.let(
                          :same_as_start_url,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::TaggedSymbol
                        )

                      UnionMember1Array =
                        T.let(
                          ContextDev::Internal::Type::ArrayOf[
                            enum:
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::Controls::Languages::UnionMember1
                          ],
                          ContextDev::Internal::Type::Converter
                        )
                    end
                  end
                end

                class Sitemap < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Domain whose sitemap lists the pages to scrape. A full URL is reduced to its
                  # domain.
                  sig { returns(String) }
                  attr_accessor :domain

                  # Scrape the URLs in the domain's sitemap.
                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                  # URLs and never follows links off them, so there is no crawl depth here.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::Controls
                      )
                    )
                  end
                  attr_reader :controls

                  sig do
                    params(
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::Controls::OrHash
                    ).void
                  end
                  attr_writer :controls

                  # Scrape the pages listed in a domain's sitemap. Links on those pages are not
                  # followed.
                  sig do
                    params(
                      domain: String,
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::Controls::OrHash,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Domain whose sitemap lists the pages to scrape. A full URL is reduced to its
                    # domain.
                    domain:,
                    # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    # URLs and never follows links off them, so there is no crawl depth here.
                    controls: nil,
                    # Scrape the URLs in the domain's sitemap.
                    type: :sitemap
                  )
                  end

                  sig do
                    override.returns(
                      {
                        domain: String,
                        type: Symbol,
                        controls:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::Controls
                      }
                    )
                  end
                  def to_hash
                  end

                  class Controls < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::Controls,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Regex pattern; sitemap URLs matching it are not scraped, even when they match
                    # `regex`.
                    sig { returns(T.nilable(String)) }
                    attr_reader :exclude_regex

                    sig { params(exclude_regex: String).void }
                    attr_writer :exclude_regex

                    # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_urls

                    sig { params(max_urls: Integer).void }
                    attr_writer :max_urls

                    # Regex pattern; only sitemap URLs matching it are scraped.
                    sig { returns(T.nilable(String)) }
                    attr_reader :regex

                    sig { params(regex: String).void }
                    attr_writer :regex

                    # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    # URLs and never follows links off them, so there is no crawl depth here.
                    sig do
                      params(
                        exclude_regex: String,
                        max_urls: Integer,
                        regex: String
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Regex pattern; sitemap URLs matching it are not scraped, even when they match
                      # `regex`.
                      exclude_regex: nil,
                      # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                      max_urls: nil,
                      # Regex pattern; only sitemap URLs matching it are scraped.
                      regex: nil
                    )
                    end

                    sig do
                      override.returns(
                        {
                          exclude_regex: String,
                          max_urls: Integer,
                          regex: String
                        }
                      )
                    end
                    def to_hash
                    end
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class Options < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Fetch from this country (ISO 3166-1 alpha-2).
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::OrSymbol
                    )
                  )
                end
                attr_reader :country

                sig do
                  params(
                    country:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::OrSymbol
                  ).void
                end
                attr_writer :country

                # Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                # so an element matching both is removed.
                sig { returns(T.nilable(T::Array[String])) }
                attr_accessor :exclude_selectors

                # Also return each page's HTML in `html`.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_html

                sig { params(include_html: T::Boolean).void }
                attr_writer :include_html

                # Include image references in the Markdown (`html-conversion` only).
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_images

                sig { params(include_images: T::Boolean).void }
                attr_writer :include_images

                # Include links in the Markdown (`html-conversion` only).
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_links

                sig { params(include_links: T::Boolean).void }
                attr_writer :include_links

                # Keep only elements matching these CSS selectors. Filtered pages ignore
                # `maxAgeMs`.
                sig { returns(T.nilable(T::Array[String])) }
                attr_accessor :include_selectors

                # Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                # year (31536000000 ms). `0` fetches fresh.
                sig { returns(T.nilable(Integer)) }
                attr_accessor :max_age_ms

                # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf
                    )
                  )
                end
                attr_reader :pdf

                sig do
                  params(
                    pdf:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::OrHash
                  ).void
                end
                attr_writer :pdf

                # Wait for CSS animations to finish before extracting, on browser-rendered pages.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :settle_animations

                sig { params(settle_animations: T::Boolean).void }
                attr_writer :settle_animations

                # Shorten inline base64 image data (`html-conversion` only).
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :shorten_base64_images

                sig { params(shorten_base64_images: T::Boolean).void }
                attr_writer :shorten_base64_images

                # Markdown sources in order of preference: `html-conversion` converts the page
                # HTML, `markdown-direct` uses Markdown the site publishes.
                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference::OrSymbol
                      ]
                    )
                  )
                end
                attr_reader :source_preference

                sig do
                  params(
                    source_preference:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference::OrSymbol
                      ]
                  ).void
                end
                attr_writer :source_preference

                # Return the main content without navigation or footers.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :use_main_content_only

                sig { params(use_main_content_only: T::Boolean).void }
                attr_writer :use_main_content_only

                # How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                sig { returns(T.nilable(Integer)) }
                attr_reader :wait_for_ms

                sig { params(wait_for_ms: Integer).void }
                attr_writer :wait_for_ms

                # Options for Markdown output.
                sig do
                  params(
                    country:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::OrSymbol,
                    exclude_selectors: T.nilable(T::Array[String]),
                    include_html: T::Boolean,
                    include_images: T::Boolean,
                    include_links: T::Boolean,
                    include_selectors: T.nilable(T::Array[String]),
                    max_age_ms: T.nilable(Integer),
                    pdf:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf::OrHash,
                    settle_animations: T::Boolean,
                    shorten_base64_images: T::Boolean,
                    source_preference:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference::OrSymbol
                      ],
                    use_main_content_only: T::Boolean,
                    wait_for_ms: Integer
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Fetch from this country (ISO 3166-1 alpha-2).
                  country: nil,
                  # Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                  # so an element matching both is removed.
                  exclude_selectors: nil,
                  # Also return each page's HTML in `html`.
                  include_html: nil,
                  # Include image references in the Markdown (`html-conversion` only).
                  include_images: nil,
                  # Include links in the Markdown (`html-conversion` only).
                  include_links: nil,
                  # Keep only elements matching these CSS selectors. Filtered pages ignore
                  # `maxAgeMs`.
                  include_selectors: nil,
                  # Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                  # year (31536000000 ms). `0` fetches fresh.
                  max_age_ms: nil,
                  # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  pdf: nil,
                  # Wait for CSS animations to finish before extracting, on browser-rendered pages.
                  settle_animations: nil,
                  # Shorten inline base64 image data (`html-conversion` only).
                  shorten_base64_images: nil,
                  # Markdown sources in order of preference: `html-conversion` converts the page
                  # HTML, `markdown-direct` uses Markdown the site publishes.
                  source_preference: nil,
                  # Return the main content without navigation or footers.
                  use_main_content_only: nil,
                  # How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                  wait_for_ms: nil
                )
                end

                sig do
                  override.returns(
                    {
                      country:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::OrSymbol,
                      exclude_selectors: T.nilable(T::Array[String]),
                      include_html: T::Boolean,
                      include_images: T::Boolean,
                      include_links: T::Boolean,
                      include_selectors: T.nilable(T::Array[String]),
                      max_age_ms: T.nilable(Integer),
                      pdf:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf,
                      settle_animations: T::Boolean,
                      shorten_base64_images: T::Boolean,
                      source_preference:
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference::OrSymbol
                        ],
                      use_main_content_only: T::Boolean,
                      wait_for_ms: Integer
                    }
                  )
                end
                def to_hash
                end

                # Fetch from this country (ISO 3166-1 alpha-2).
                module Country
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  AD =
                    T.let(
                      :ad,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AE =
                    T.let(
                      :ae,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AF =
                    T.let(
                      :af,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AG =
                    T.let(
                      :ag,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AI =
                    T.let(
                      :ai,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AL =
                    T.let(
                      :al,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AM =
                    T.let(
                      :am,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AO =
                    T.let(
                      :ao,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AR =
                    T.let(
                      :ar,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AT =
                    T.let(
                      :at,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AU =
                    T.let(
                      :au,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AW =
                    T.let(
                      :aw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  AZ =
                    T.let(
                      :az,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BA =
                    T.let(
                      :ba,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BB =
                    T.let(
                      :bb,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BD =
                    T.let(
                      :bd,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BE =
                    T.let(
                      :be,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BF =
                    T.let(
                      :bf,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BG =
                    T.let(
                      :bg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BH =
                    T.let(
                      :bh,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BI =
                    T.let(
                      :bi,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BJ =
                    T.let(
                      :bj,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BM =
                    T.let(
                      :bm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BN =
                    T.let(
                      :bn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BO =
                    T.let(
                      :bo,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BQ =
                    T.let(
                      :bq,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BR =
                    T.let(
                      :br,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BS =
                    T.let(
                      :bs,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BW =
                    T.let(
                      :bw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BY =
                    T.let(
                      :by,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  BZ =
                    T.let(
                      :bz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CA =
                    T.let(
                      :ca,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CD =
                    T.let(
                      :cd,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CF =
                    T.let(
                      :cf,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CG =
                    T.let(
                      :cg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CH =
                    T.let(
                      :ch,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CI =
                    T.let(
                      :ci,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CL =
                    T.let(
                      :cl,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CM =
                    T.let(
                      :cm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CN =
                    T.let(
                      :cn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CO =
                    T.let(
                      :co,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CR =
                    T.let(
                      :cr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CV =
                    T.let(
                      :cv,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CW =
                    T.let(
                      :cw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CY =
                    T.let(
                      :cy,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  CZ =
                    T.let(
                      :cz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DE =
                    T.let(
                      :de,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DJ =
                    T.let(
                      :dj,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DK =
                    T.let(
                      :dk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DM =
                    T.let(
                      :dm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DO =
                    T.let(
                      :do,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  DZ =
                    T.let(
                      :dz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  EC =
                    T.let(
                      :ec,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  EE =
                    T.let(
                      :ee,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  EG =
                    T.let(
                      :eg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ES =
                    T.let(
                      :es,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ET =
                    T.let(
                      :et,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  FI =
                    T.let(
                      :fi,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  FJ =
                    T.let(
                      :fj,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  FR =
                    T.let(
                      :fr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GA =
                    T.let(
                      :ga,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GB =
                    T.let(
                      :gb,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GD =
                    T.let(
                      :gd,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GE =
                    T.let(
                      :ge,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GF =
                    T.let(
                      :gf,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GG =
                    T.let(
                      :gg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GH =
                    T.let(
                      :gh,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GM =
                    T.let(
                      :gm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GN =
                    T.let(
                      :gn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GP =
                    T.let(
                      :gp,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GQ =
                    T.let(
                      :gq,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GR =
                    T.let(
                      :gr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GT =
                    T.let(
                      :gt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GU =
                    T.let(
                      :gu,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GW =
                    T.let(
                      :gw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  GY =
                    T.let(
                      :gy,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  HK =
                    T.let(
                      :hk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  HN =
                    T.let(
                      :hn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  HR =
                    T.let(
                      :hr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  HT =
                    T.let(
                      :ht,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  HU =
                    T.let(
                      :hu,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ID =
                    T.let(
                      :id,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IE =
                    T.let(
                      :ie,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IL =
                    T.let(
                      :il,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IM =
                    T.let(
                      :im,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IN =
                    T.let(
                      :in,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IQ =
                    T.let(
                      :iq,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IR =
                    T.let(
                      :ir,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IS =
                    T.let(
                      :is,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  IT =
                    T.let(
                      :it,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  JE =
                    T.let(
                      :je,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  JM =
                    T.let(
                      :jm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  JO =
                    T.let(
                      :jo,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  JP =
                    T.let(
                      :jp,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KE =
                    T.let(
                      :ke,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KG =
                    T.let(
                      :kg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KH =
                    T.let(
                      :kh,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KN =
                    T.let(
                      :kn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KR =
                    T.let(
                      :kr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KW =
                    T.let(
                      :kw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KY =
                    T.let(
                      :ky,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  KZ =
                    T.let(
                      :kz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LA =
                    T.let(
                      :la,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LB =
                    T.let(
                      :lb,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LC =
                    T.let(
                      :lc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LK =
                    T.let(
                      :lk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LR =
                    T.let(
                      :lr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LS =
                    T.let(
                      :ls,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LT =
                    T.let(
                      :lt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LU =
                    T.let(
                      :lu,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LV =
                    T.let(
                      :lv,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  LY =
                    T.let(
                      :ly,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MA =
                    T.let(
                      :ma,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MC =
                    T.let(
                      :mc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MD =
                    T.let(
                      :md,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ME =
                    T.let(
                      :me,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MF =
                    T.let(
                      :mf,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MG =
                    T.let(
                      :mg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MK =
                    T.let(
                      :mk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ML =
                    T.let(
                      :ml,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MM =
                    T.let(
                      :mm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MN =
                    T.let(
                      :mn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MO =
                    T.let(
                      :mo,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MQ =
                    T.let(
                      :mq,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MR =
                    T.let(
                      :mr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MT =
                    T.let(
                      :mt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MU =
                    T.let(
                      :mu,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MV =
                    T.let(
                      :mv,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MW =
                    T.let(
                      :mw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MX =
                    T.let(
                      :mx,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MY =
                    T.let(
                      :my,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  MZ =
                    T.let(
                      :mz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NA =
                    T.let(
                      :na,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NC =
                    T.let(
                      :nc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NE =
                    T.let(
                      :ne,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NG =
                    T.let(
                      :ng,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NI =
                    T.let(
                      :ni,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NL =
                    T.let(
                      :nl,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NO =
                    T.let(
                      :no,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NP =
                    T.let(
                      :np,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  NZ =
                    T.let(
                      :nz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  OM =
                    T.let(
                      :om,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PA =
                    T.let(
                      :pa,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PE =
                    T.let(
                      :pe,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PF =
                    T.let(
                      :pf,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PG =
                    T.let(
                      :pg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PH =
                    T.let(
                      :ph,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PK =
                    T.let(
                      :pk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PL =
                    T.let(
                      :pl,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PR =
                    T.let(
                      :pr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PS =
                    T.let(
                      :ps,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PT =
                    T.let(
                      :pt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  PY =
                    T.let(
                      :py,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  QA =
                    T.let(
                      :qa,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  RE =
                    T.let(
                      :re,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  RO =
                    T.let(
                      :ro,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  RS =
                    T.let(
                      :rs,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  RU =
                    T.let(
                      :ru,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  RW =
                    T.let(
                      :rw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SA =
                    T.let(
                      :sa,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SC =
                    T.let(
                      :sc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SD =
                    T.let(
                      :sd,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SE =
                    T.let(
                      :se,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SG =
                    T.let(
                      :sg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SI =
                    T.let(
                      :si,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SK =
                    T.let(
                      :sk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SL =
                    T.let(
                      :sl,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SM =
                    T.let(
                      :sm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SN =
                    T.let(
                      :sn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SO =
                    T.let(
                      :so,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SR =
                    T.let(
                      :sr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SS =
                    T.let(
                      :ss,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ST =
                    T.let(
                      :st,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SV =
                    T.let(
                      :sv,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SX =
                    T.let(
                      :sx,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SY =
                    T.let(
                      :sy,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  SZ =
                    T.let(
                      :sz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TC =
                    T.let(
                      :tc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TD =
                    T.let(
                      :td,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TG =
                    T.let(
                      :tg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TH =
                    T.let(
                      :th,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TJ =
                    T.let(
                      :tj,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TL =
                    T.let(
                      :tl,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TM =
                    T.let(
                      :tm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TN =
                    T.let(
                      :tn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TR =
                    T.let(
                      :tr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TT =
                    T.let(
                      :tt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TW =
                    T.let(
                      :tw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  TZ =
                    T.let(
                      :tz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  UA =
                    T.let(
                      :ua,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  UG =
                    T.let(
                      :ug,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  US =
                    T.let(
                      :us,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  UY =
                    T.let(
                      :uy,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  UZ =
                    T.let(
                      :uz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  VC =
                    T.let(
                      :vc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  VE =
                    T.let(
                      :ve,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  VG =
                    T.let(
                      :vg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  VI =
                    T.let(
                      :vi,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  VN =
                    T.let(
                      :vn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  YE =
                    T.let(
                      :ye,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  YT =
                    T.let(
                      :yt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ZA =
                    T.let(
                      :za,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ZM =
                    T.let(
                      :zm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )
                  ZW =
                    T.let(
                      :zw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Country::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Pdf < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::Pdf,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
                  # be >= start.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :end_

                  sig { params(end_: Integer).void }
                  attr_writer :end_

                  # Read scanned PDF pages with OCR; preserve pages that already have text.
                  sig { returns(T.nilable(T::Boolean)) }
                  attr_reader :ocr

                  sig { params(ocr: T::Boolean).void }
                  attr_writer :ocr

                  # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                  sig { returns(T.nilable(T::Boolean)) }
                  attr_reader :should_parse

                  sig { params(should_parse: T::Boolean).void }
                  attr_writer :should_parse

                  # First 1-based PDF page to parse.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :start

                  sig { params(start: Integer).void }
                  attr_writer :start

                  # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  sig do
                    params(
                      end_: Integer,
                      ocr: T::Boolean,
                      should_parse: T::Boolean,
                      start: Integer
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
                    # be >= start.
                    end_: nil,
                    # Read scanned PDF pages with OCR; preserve pages that already have text.
                    ocr: nil,
                    # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                    should_parse: nil,
                    # First 1-based PDF page to parse.
                    start: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        end_: Integer,
                        ocr: T::Boolean,
                        should_parse: T::Boolean,
                        start: Integer
                      }
                    )
                  end
                  def to_hash
                  end
                end

                module SourcePreference
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  HTML_CONVERSION =
                    T.let(
                      :"html-conversion",
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference::TaggedSymbol
                    )
                  MARKDOWN_DIRECT =
                    T.let(
                      :"markdown-direct",
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::SourcePreference::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end

            class HTML < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Return page content as HTML.
              sig do
                returns(
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Format::OrSymbol
                )
              end
              attr_accessor :format_

              # How to find pages to crawl.
              sig do
                returns(
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL,
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap
                  )
                )
              end
              attr_accessor :source

              # Options for HTML output.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options
                  )
                )
              end
              attr_reader :options

              sig do
                params(
                  options:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::OrHash
                ).void
              end
              attr_writer :options

              # Crawl pages and return HTML.
              sig do
                params(
                  format_:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Format::OrSymbol,
                  source:
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::OrHash,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::OrHash
                    ),
                  options:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                # Return page content as HTML.
                format_:,
                # How to find pages to crawl.
                source:,
                # Options for HTML output.
                options: nil
              )
              end

              sig do
                override.returns(
                  {
                    format_:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Format::OrSymbol,
                    source:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap
                      ),
                    options:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options
                  }
                )
              end
              def to_hash
              end

              # Return page content as HTML.
              module Format
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Format
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                HTML =
                  T.let(
                    :html,
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Format::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Format::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              # How to find pages to crawl.
              module Source
                extend ContextDev::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap
                    )
                  end

                class StartURL < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Start from one page.
                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Page where crawling begins. A URL without a scheme is read as https://.
                  sig { returns(String) }
                  attr_accessor :url

                  # Limits and filters for page discovery.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls
                      )
                    )
                  end
                  attr_reader :controls

                  sig do
                    params(
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::OrHash
                    ).void
                  end
                  attr_writer :controls

                  # Discover pages by following links from one URL.
                  sig do
                    params(
                      url: String,
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::OrHash,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Page where crawling begins. A URL without a scheme is read as https://.
                    url:,
                    # Limits and filters for page discovery.
                    controls: nil,
                    # Start from one page.
                    type: :start_url
                  )
                  end

                  sig do
                    override.returns(
                      {
                        type: Symbol,
                        url: String,
                        controls:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls
                      }
                    )
                  end
                  def to_hash
                  end

                  class Controls < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                    # itself is always included.
                    sig { returns(T.nilable(String)) }
                    attr_reader :exclude_regex

                    sig { params(exclude_regex: String).void }
                    attr_writer :exclude_regex

                    # Follow links to subdomains.
                    sig { returns(T.nilable(T::Boolean)) }
                    attr_reader :follow_subdomains

                    sig { params(follow_subdomains: T::Boolean).void }
                    attr_writer :follow_subdomains

                    # Only follow pages in these languages, or `same_as_start_url`; all languages when
                    # omitted.
                    sig do
                      returns(
                        T.nilable(
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::OrSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                            ]
                          )
                        )
                      )
                    end
                    attr_reader :languages

                    sig do
                      params(
                        languages:
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::OrSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                            ]
                          )
                      ).void
                    end
                    attr_writer :languages

                    # Maximum link depth. Source pages are depth 0. No limit when omitted.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_depth

                    sig { params(max_depth: Integer).void }
                    attr_writer :max_depth

                    # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_urls

                    sig { params(max_urls: Integer).void }
                    attr_writer :max_urls

                    # Regex pattern for URLs to include. The `start_url` itself is always included.
                    sig { returns(T.nilable(String)) }
                    attr_reader :regex

                    sig { params(regex: String).void }
                    attr_writer :regex

                    # Limits and filters for page discovery.
                    sig do
                      params(
                        exclude_regex: String,
                        follow_subdomains: T::Boolean,
                        languages:
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::OrSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                            ]
                          ),
                        max_depth: Integer,
                        max_urls: Integer,
                        regex: String
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                      # itself is always included.
                      exclude_regex: nil,
                      # Follow links to subdomains.
                      follow_subdomains: nil,
                      # Only follow pages in these languages, or `same_as_start_url`; all languages when
                      # omitted.
                      languages: nil,
                      # Maximum link depth. Source pages are depth 0. No limit when omitted.
                      max_depth: nil,
                      # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                      max_urls: nil,
                      # Regex pattern for URLs to include. The `start_url` itself is always included.
                      regex: nil
                    )
                    end

                    sig do
                      override.returns(
                        {
                          exclude_regex: String,
                          follow_subdomains: T::Boolean,
                          languages:
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::OrSymbol,
                              T::Array[
                                ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                              ]
                            ),
                          max_depth: Integer,
                          max_urls: Integer,
                          regex: String
                        }
                      )
                    end
                    def to_hash
                    end

                    # Only follow pages in these languages, or `same_as_start_url`; all languages when
                    # omitted.
                    module Languages
                      extend ContextDev::Internal::Type::Union

                      Variants =
                        T.type_alias do
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::TaggedSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                            ]
                          )
                        end

                      module UnionMember1
                        extend ContextDev::Internal::Type::Enum

                        TaggedSymbol =
                          T.type_alias do
                            T.all(
                              Symbol,
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1
                            )
                          end
                        OrSymbol = T.type_alias { T.any(Symbol, String) }

                        AM =
                          T.let(
                            :am,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        AR =
                          T.let(
                            :ar,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        AZ =
                          T.let(
                            :az,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        BE =
                          T.let(
                            :be,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        BG =
                          T.let(
                            :bg,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        BN =
                          T.let(
                            :bn,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CA =
                          T.let(
                            :ca,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CEB =
                          T.let(
                            :ceb,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CS =
                          T.let(
                            :cs,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CY =
                          T.let(
                            :cy,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        DA =
                          T.let(
                            :da,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        DE =
                          T.let(
                            :de,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        EL =
                          T.let(
                            :el,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        EN =
                          T.let(
                            :en,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ES =
                          T.let(
                            :es,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ET =
                          T.let(
                            :et,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        EU =
                          T.let(
                            :eu,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        FA =
                          T.let(
                            :fa,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        FI =
                          T.let(
                            :fi,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        FR =
                          T.let(
                            :fr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        GU =
                          T.let(
                            :gu,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HA =
                          T.let(
                            :ha,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HAW =
                          T.let(
                            :haw,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HE =
                          T.let(
                            :he,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HI =
                          T.let(
                            :hi,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HR =
                          T.let(
                            :hr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HU =
                          T.let(
                            :hu,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HY =
                          T.let(
                            :hy,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ID =
                          T.let(
                            :id,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        IS =
                          T.let(
                            :is,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        IT =
                          T.let(
                            :it,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        JA =
                          T.let(
                            :ja,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KA =
                          T.let(
                            :ka,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KK =
                          T.let(
                            :kk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KN =
                          T.let(
                            :kn,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KO =
                          T.let(
                            :ko,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KU =
                          T.let(
                            :ku,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KY =
                          T.let(
                            :ky,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        LO =
                          T.let(
                            :lo,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        LT =
                          T.let(
                            :lt,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        LV =
                          T.let(
                            :lv,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MK =
                          T.let(
                            :mk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ML =
                          T.let(
                            :ml,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MN =
                          T.let(
                            :mn,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MR =
                          T.let(
                            :mr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MS =
                          T.let(
                            :ms,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        NE =
                          T.let(
                            :ne,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        NL =
                          T.let(
                            :nl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        NO =
                          T.let(
                            :no,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        OR =
                          T.let(
                            :or,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PA =
                          T.let(
                            :pa,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PL =
                          T.let(
                            :pl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PS =
                          T.let(
                            :ps,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PT =
                          T.let(
                            :pt,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        RO =
                          T.let(
                            :ro,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        RU =
                          T.let(
                            :ru,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SK =
                          T.let(
                            :sk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SL =
                          T.let(
                            :sl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SO =
                          T.let(
                            :so,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SQ =
                          T.let(
                            :sq,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SR =
                          T.let(
                            :sr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SV =
                          T.let(
                            :sv,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SW =
                          T.let(
                            :sw,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TA =
                          T.let(
                            :ta,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TE =
                          T.let(
                            :te,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TH =
                          T.let(
                            :th,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TL =
                          T.let(
                            :tl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TR =
                          T.let(
                            :tr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        UK =
                          T.let(
                            :uk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        UR =
                          T.let(
                            :ur,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        UZ =
                          T.let(
                            :uz,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        VI =
                          T.let(
                            :vi,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        YO =
                          T.let(
                            :yo,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ZH =
                          T.let(
                            :zh,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )

                        sig do
                          override.returns(
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                            ]
                          )
                        end
                        def self.values
                        end
                      end

                      sig do
                        override.returns(
                          T::Array[
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::Variants
                          ]
                        )
                      end
                      def self.variants
                      end

                      TaggedSymbol =
                        T.type_alias do
                          T.all(
                            Symbol,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages
                          )
                        end
                      OrSymbol = T.type_alias { T.any(Symbol, String) }

                      SAME_AS_START_URL =
                        T.let(
                          :same_as_start_url,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::TaggedSymbol
                        )

                      UnionMember1Array =
                        T.let(
                          ContextDev::Internal::Type::ArrayOf[
                            enum:
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::Controls::Languages::UnionMember1
                          ],
                          ContextDev::Internal::Type::Converter
                        )
                    end
                  end
                end

                class Sitemap < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Domain whose sitemap lists the pages to scrape. A full URL is reduced to its
                  # domain.
                  sig { returns(String) }
                  attr_accessor :domain

                  # Scrape the URLs in the domain's sitemap.
                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                  # URLs and never follows links off them, so there is no crawl depth here.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::Controls
                      )
                    )
                  end
                  attr_reader :controls

                  sig do
                    params(
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::Controls::OrHash
                    ).void
                  end
                  attr_writer :controls

                  # Scrape the pages listed in a domain's sitemap. Links on those pages are not
                  # followed.
                  sig do
                    params(
                      domain: String,
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::Controls::OrHash,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Domain whose sitemap lists the pages to scrape. A full URL is reduced to its
                    # domain.
                    domain:,
                    # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    # URLs and never follows links off them, so there is no crawl depth here.
                    controls: nil,
                    # Scrape the URLs in the domain's sitemap.
                    type: :sitemap
                  )
                  end

                  sig do
                    override.returns(
                      {
                        domain: String,
                        type: Symbol,
                        controls:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::Controls
                      }
                    )
                  end
                  def to_hash
                  end

                  class Controls < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::Controls,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Regex pattern; sitemap URLs matching it are not scraped, even when they match
                    # `regex`.
                    sig { returns(T.nilable(String)) }
                    attr_reader :exclude_regex

                    sig { params(exclude_regex: String).void }
                    attr_writer :exclude_regex

                    # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_urls

                    sig { params(max_urls: Integer).void }
                    attr_writer :max_urls

                    # Regex pattern; only sitemap URLs matching it are scraped.
                    sig { returns(T.nilable(String)) }
                    attr_reader :regex

                    sig { params(regex: String).void }
                    attr_writer :regex

                    # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    # URLs and never follows links off them, so there is no crawl depth here.
                    sig do
                      params(
                        exclude_regex: String,
                        max_urls: Integer,
                        regex: String
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Regex pattern; sitemap URLs matching it are not scraped, even when they match
                      # `regex`.
                      exclude_regex: nil,
                      # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                      max_urls: nil,
                      # Regex pattern; only sitemap URLs matching it are scraped.
                      regex: nil
                    )
                    end

                    sig do
                      override.returns(
                        {
                          exclude_regex: String,
                          max_urls: Integer,
                          regex: String
                        }
                      )
                    end
                    def to_hash
                    end
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class Options < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Fetch from this country (ISO 3166-1 alpha-2).
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::OrSymbol
                    )
                  )
                end
                attr_reader :country

                sig do
                  params(
                    country:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::OrSymbol
                  ).void
                end
                attr_writer :country

                # Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                # so an element matching both is removed.
                sig { returns(T.nilable(T::Array[String])) }
                attr_accessor :exclude_selectors

                # Keep only elements matching these CSS selectors. Filtered pages ignore
                # `maxAgeMs`.
                sig { returns(T.nilable(T::Array[String])) }
                attr_accessor :include_selectors

                # Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                # year (31536000000 ms). `0` fetches fresh.
                sig { returns(T.nilable(Integer)) }
                attr_accessor :max_age_ms

                # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf
                    )
                  )
                end
                attr_reader :pdf

                sig do
                  params(
                    pdf:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::OrHash
                  ).void
                end
                attr_writer :pdf

                # Wait for CSS animations to finish before extracting, on browser-rendered pages.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :settle_animations

                sig { params(settle_animations: T::Boolean).void }
                attr_writer :settle_animations

                # Return the main content without navigation or footers.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :use_main_content_only

                sig { params(use_main_content_only: T::Boolean).void }
                attr_writer :use_main_content_only

                # How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                sig { returns(T.nilable(Integer)) }
                attr_reader :wait_for_ms

                sig { params(wait_for_ms: Integer).void }
                attr_writer :wait_for_ms

                # Options for HTML output.
                sig do
                  params(
                    country:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::OrSymbol,
                    exclude_selectors: T.nilable(T::Array[String]),
                    include_selectors: T.nilable(T::Array[String]),
                    max_age_ms: T.nilable(Integer),
                    pdf:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf::OrHash,
                    settle_animations: T::Boolean,
                    use_main_content_only: T::Boolean,
                    wait_for_ms: Integer
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Fetch from this country (ISO 3166-1 alpha-2).
                  country: nil,
                  # Remove elements matching these CSS selectors. Applied after `includeSelectors`,
                  # so an element matching both is removed.
                  exclude_selectors: nil,
                  # Keep only elements matching these CSS selectors. Filtered pages ignore
                  # `maxAgeMs`.
                  include_selectors: nil,
                  # Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                  # year (31536000000 ms). `0` fetches fresh.
                  max_age_ms: nil,
                  # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  pdf: nil,
                  # Wait for CSS animations to finish before extracting, on browser-rendered pages.
                  settle_animations: nil,
                  # Return the main content without navigation or footers.
                  use_main_content_only: nil,
                  # How long to wait after initial page load, in milliseconds. `0` waits 500 ms.
                  wait_for_ms: nil
                )
                end

                sig do
                  override.returns(
                    {
                      country:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::OrSymbol,
                      exclude_selectors: T.nilable(T::Array[String]),
                      include_selectors: T.nilable(T::Array[String]),
                      max_age_ms: T.nilable(Integer),
                      pdf:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf,
                      settle_animations: T::Boolean,
                      use_main_content_only: T::Boolean,
                      wait_for_ms: Integer
                    }
                  )
                end
                def to_hash
                end

                # Fetch from this country (ISO 3166-1 alpha-2).
                module Country
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  AD =
                    T.let(
                      :ad,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AE =
                    T.let(
                      :ae,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AF =
                    T.let(
                      :af,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AG =
                    T.let(
                      :ag,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AI =
                    T.let(
                      :ai,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AL =
                    T.let(
                      :al,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AM =
                    T.let(
                      :am,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AO =
                    T.let(
                      :ao,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AR =
                    T.let(
                      :ar,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AT =
                    T.let(
                      :at,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AU =
                    T.let(
                      :au,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AW =
                    T.let(
                      :aw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  AZ =
                    T.let(
                      :az,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BA =
                    T.let(
                      :ba,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BB =
                    T.let(
                      :bb,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BD =
                    T.let(
                      :bd,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BE =
                    T.let(
                      :be,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BF =
                    T.let(
                      :bf,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BG =
                    T.let(
                      :bg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BH =
                    T.let(
                      :bh,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BI =
                    T.let(
                      :bi,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BJ =
                    T.let(
                      :bj,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BM =
                    T.let(
                      :bm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BN =
                    T.let(
                      :bn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BO =
                    T.let(
                      :bo,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BQ =
                    T.let(
                      :bq,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BR =
                    T.let(
                      :br,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BS =
                    T.let(
                      :bs,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BW =
                    T.let(
                      :bw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BY =
                    T.let(
                      :by,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  BZ =
                    T.let(
                      :bz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CA =
                    T.let(
                      :ca,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CD =
                    T.let(
                      :cd,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CF =
                    T.let(
                      :cf,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CG =
                    T.let(
                      :cg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CH =
                    T.let(
                      :ch,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CI =
                    T.let(
                      :ci,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CL =
                    T.let(
                      :cl,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CM =
                    T.let(
                      :cm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CN =
                    T.let(
                      :cn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CO =
                    T.let(
                      :co,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CR =
                    T.let(
                      :cr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CV =
                    T.let(
                      :cv,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CW =
                    T.let(
                      :cw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CY =
                    T.let(
                      :cy,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  CZ =
                    T.let(
                      :cz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DE =
                    T.let(
                      :de,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DJ =
                    T.let(
                      :dj,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DK =
                    T.let(
                      :dk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DM =
                    T.let(
                      :dm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DO =
                    T.let(
                      :do,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  DZ =
                    T.let(
                      :dz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  EC =
                    T.let(
                      :ec,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  EE =
                    T.let(
                      :ee,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  EG =
                    T.let(
                      :eg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ES =
                    T.let(
                      :es,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ET =
                    T.let(
                      :et,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  FI =
                    T.let(
                      :fi,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  FJ =
                    T.let(
                      :fj,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  FR =
                    T.let(
                      :fr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GA =
                    T.let(
                      :ga,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GB =
                    T.let(
                      :gb,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GD =
                    T.let(
                      :gd,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GE =
                    T.let(
                      :ge,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GF =
                    T.let(
                      :gf,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GG =
                    T.let(
                      :gg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GH =
                    T.let(
                      :gh,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GM =
                    T.let(
                      :gm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GN =
                    T.let(
                      :gn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GP =
                    T.let(
                      :gp,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GQ =
                    T.let(
                      :gq,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GR =
                    T.let(
                      :gr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GT =
                    T.let(
                      :gt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GU =
                    T.let(
                      :gu,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GW =
                    T.let(
                      :gw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  GY =
                    T.let(
                      :gy,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  HK =
                    T.let(
                      :hk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  HN =
                    T.let(
                      :hn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  HR =
                    T.let(
                      :hr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  HT =
                    T.let(
                      :ht,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  HU =
                    T.let(
                      :hu,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ID =
                    T.let(
                      :id,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IE =
                    T.let(
                      :ie,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IL =
                    T.let(
                      :il,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IM =
                    T.let(
                      :im,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IN =
                    T.let(
                      :in,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IQ =
                    T.let(
                      :iq,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IR =
                    T.let(
                      :ir,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IS =
                    T.let(
                      :is,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  IT =
                    T.let(
                      :it,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  JE =
                    T.let(
                      :je,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  JM =
                    T.let(
                      :jm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  JO =
                    T.let(
                      :jo,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  JP =
                    T.let(
                      :jp,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KE =
                    T.let(
                      :ke,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KG =
                    T.let(
                      :kg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KH =
                    T.let(
                      :kh,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KN =
                    T.let(
                      :kn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KR =
                    T.let(
                      :kr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KW =
                    T.let(
                      :kw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KY =
                    T.let(
                      :ky,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  KZ =
                    T.let(
                      :kz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LA =
                    T.let(
                      :la,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LB =
                    T.let(
                      :lb,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LC =
                    T.let(
                      :lc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LK =
                    T.let(
                      :lk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LR =
                    T.let(
                      :lr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LS =
                    T.let(
                      :ls,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LT =
                    T.let(
                      :lt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LU =
                    T.let(
                      :lu,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LV =
                    T.let(
                      :lv,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  LY =
                    T.let(
                      :ly,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MA =
                    T.let(
                      :ma,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MC =
                    T.let(
                      :mc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MD =
                    T.let(
                      :md,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ME =
                    T.let(
                      :me,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MF =
                    T.let(
                      :mf,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MG =
                    T.let(
                      :mg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MK =
                    T.let(
                      :mk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ML =
                    T.let(
                      :ml,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MM =
                    T.let(
                      :mm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MN =
                    T.let(
                      :mn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MO =
                    T.let(
                      :mo,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MQ =
                    T.let(
                      :mq,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MR =
                    T.let(
                      :mr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MT =
                    T.let(
                      :mt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MU =
                    T.let(
                      :mu,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MV =
                    T.let(
                      :mv,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MW =
                    T.let(
                      :mw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MX =
                    T.let(
                      :mx,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MY =
                    T.let(
                      :my,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  MZ =
                    T.let(
                      :mz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NA =
                    T.let(
                      :na,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NC =
                    T.let(
                      :nc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NE =
                    T.let(
                      :ne,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NG =
                    T.let(
                      :ng,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NI =
                    T.let(
                      :ni,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NL =
                    T.let(
                      :nl,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NO =
                    T.let(
                      :no,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NP =
                    T.let(
                      :np,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  NZ =
                    T.let(
                      :nz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  OM =
                    T.let(
                      :om,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PA =
                    T.let(
                      :pa,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PE =
                    T.let(
                      :pe,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PF =
                    T.let(
                      :pf,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PG =
                    T.let(
                      :pg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PH =
                    T.let(
                      :ph,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PK =
                    T.let(
                      :pk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PL =
                    T.let(
                      :pl,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PR =
                    T.let(
                      :pr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PS =
                    T.let(
                      :ps,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PT =
                    T.let(
                      :pt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  PY =
                    T.let(
                      :py,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  QA =
                    T.let(
                      :qa,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  RE =
                    T.let(
                      :re,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  RO =
                    T.let(
                      :ro,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  RS =
                    T.let(
                      :rs,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  RU =
                    T.let(
                      :ru,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  RW =
                    T.let(
                      :rw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SA =
                    T.let(
                      :sa,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SC =
                    T.let(
                      :sc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SD =
                    T.let(
                      :sd,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SE =
                    T.let(
                      :se,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SG =
                    T.let(
                      :sg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SI =
                    T.let(
                      :si,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SK =
                    T.let(
                      :sk,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SL =
                    T.let(
                      :sl,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SM =
                    T.let(
                      :sm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SN =
                    T.let(
                      :sn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SO =
                    T.let(
                      :so,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SR =
                    T.let(
                      :sr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SS =
                    T.let(
                      :ss,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ST =
                    T.let(
                      :st,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SV =
                    T.let(
                      :sv,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SX =
                    T.let(
                      :sx,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SY =
                    T.let(
                      :sy,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  SZ =
                    T.let(
                      :sz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TC =
                    T.let(
                      :tc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TD =
                    T.let(
                      :td,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TG =
                    T.let(
                      :tg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TH =
                    T.let(
                      :th,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TJ =
                    T.let(
                      :tj,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TL =
                    T.let(
                      :tl,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TM =
                    T.let(
                      :tm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TN =
                    T.let(
                      :tn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TR =
                    T.let(
                      :tr,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TT =
                    T.let(
                      :tt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TW =
                    T.let(
                      :tw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  TZ =
                    T.let(
                      :tz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  UA =
                    T.let(
                      :ua,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  UG =
                    T.let(
                      :ug,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  US =
                    T.let(
                      :us,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  UY =
                    T.let(
                      :uy,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  UZ =
                    T.let(
                      :uz,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  VC =
                    T.let(
                      :vc,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  VE =
                    T.let(
                      :ve,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  VG =
                    T.let(
                      :vg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  VI =
                    T.let(
                      :vi,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  VN =
                    T.let(
                      :vn,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  YE =
                    T.let(
                      :ye,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  YT =
                    T.let(
                      :yt,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ZA =
                    T.let(
                      :za,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ZM =
                    T.let(
                      :zm,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )
                  ZW =
                    T.let(
                      :zw,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Country::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Pdf < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::Pdf,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
                  # be >= start.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :end_

                  sig { params(end_: Integer).void }
                  attr_writer :end_

                  # Read scanned PDF pages with OCR; preserve pages that already have text.
                  sig { returns(T.nilable(T::Boolean)) }
                  attr_reader :ocr

                  sig { params(ocr: T::Boolean).void }
                  attr_writer :ocr

                  # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                  sig { returns(T.nilable(T::Boolean)) }
                  attr_reader :should_parse

                  sig { params(should_parse: T::Boolean).void }
                  attr_writer :should_parse

                  # First 1-based PDF page to parse.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :start

                  sig { params(start: Integer).void }
                  attr_writer :start

                  # PDF handling. `start`/`end` limit parsing to an inclusive, 1-based page range.
                  sig do
                    params(
                      end_: Integer,
                      ocr: T::Boolean,
                      should_parse: T::Boolean,
                      start: Integer
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
                    # be >= start.
                    end_: nil,
                    # Read scanned PDF pages with OCR; preserve pages that already have text.
                    ocr: nil,
                    # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                    should_parse: nil,
                    # First 1-based PDF page to parse.
                    start: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        end_: Integer,
                        ocr: T::Boolean,
                        should_parse: T::Boolean,
                        start: Integer
                      }
                    )
                  end
                  def to_hash
                  end
                end
              end
            end

            class BatchUnifiedCrawlData < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Outputs to return. Set at least one to `true`.
              sig do
                returns(
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Formats
                )
              end
              attr_reader :formats

              sig do
                params(
                  formats:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Formats::OrHash
                ).void
              end
              attr_writer :formats

              # How to find pages to crawl.
              sig do
                returns(
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL,
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap
                  )
                )
              end
              attr_accessor :source

              # Requires `formats.highlights: true`; required when it is set.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::HighlightsParams
                  )
                )
              end
              attr_reader :highlights_params

              sig do
                params(
                  highlights_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::HighlightsParams::OrHash
                ).void
              end
              attr_writer :highlights_params

              # Image options. Requires formats.images: true.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams
                  )
                )
              end
              attr_reader :image_params

              sig do
                params(
                  image_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::OrHash
                ).void
              end
              attr_writer :image_params

              # Requires `formats.json: true`; required when it is set.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::JsonParams
                  )
                )
              end
              attr_reader :json_params

              sig do
                params(
                  json_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::JsonParams::OrHash
                ).void
              end
              attr_writer :json_params

              # Markdown options. Requires `formats.markdown`.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams
                  )
                )
              end
              attr_reader :markdown_params

              sig do
                params(
                  markdown_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::OrHash
                ).void
              end
              attr_writer :markdown_params

              # Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
              # 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
              sig { returns(T.nilable(Integer)) }
              attr_reader :max_age_ms

              sig { params(max_age_ms: Integer).void }
              attr_writer :max_age_ms

              # Requires `formats.parse: true`; required when it is set.
              sig do
                returns(
                  T.nilable(
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser
                    )
                  )
                )
              end
              attr_reader :parse_params

              sig do
                params(
                  parse_params:
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::OrHash,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::OrHash
                    )
                ).void
              end
              attr_writer :parse_params

              # Product options. Requires formats.product: true.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ProductParams
                  )
                )
              end
              attr_reader :product_params

              sig do
                params(
                  product_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ProductParams::OrHash
                ).void
              end
              attr_writer :product_params

              # Screenshot options. Requires formats.screenshot: true.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams
                  )
                )
              end
              attr_reader :screenshot_params

              sig do
                params(
                  screenshot_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::OrHash
                ).void
              end
              attr_writer :screenshot_params

              # Browser and content settings shared by all outputs.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams
                  )
                )
              end
              attr_reader :shared_params

              sig do
                params(
                  shared_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::OrHash
                ).void
              end
              attr_writer :shared_params

              # Labels for filtering usage in the dashboard.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :tags

              sig { params(tags: T::Array[String]).void }
              attr_writer :tags

              # Deadline for each page, using the same behavior and defaults as POST
              # /web/scrape.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts
                  )
                )
              end
              attr_reader :timeout_opts

              sig do
                params(
                  timeout_opts:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::OrHash
                ).void
              end
              attr_writer :timeout_opts

              # Batches persist their results. Only disabled is supported; enabled returns
              # ZDR_NOT_SUPPORTED.
              sig do
                returns(
                  T.nilable(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Zdr::OrSymbol
                  )
                )
              end
              attr_reader :zdr

              sig do
                params(
                  zdr:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Zdr::OrSymbol
                ).void
              end
              attr_writer :zdr

              # Use the same formats and parameters as POST /web/scrape, replacing url with
              # source. Options apply to every page.
              sig do
                params(
                  formats:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Formats::OrHash,
                  source:
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::OrHash,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap::OrHash
                    ),
                  highlights_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::HighlightsParams::OrHash,
                  image_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::OrHash,
                  json_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::JsonParams::OrHash,
                  markdown_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::OrHash,
                  max_age_ms: Integer,
                  parse_params:
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::OrHash,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::OrHash
                    ),
                  product_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ProductParams::OrHash,
                  screenshot_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::OrHash,
                  shared_params:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::OrHash,
                  tags: T::Array[String],
                  timeout_opts:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::OrHash,
                  zdr:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Zdr::OrSymbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Outputs to return. Set at least one to `true`.
                formats:,
                # How to find pages to crawl.
                source:,
                # Requires `formats.highlights: true`; required when it is set.
                highlights_params: nil,
                # Image options. Requires formats.images: true.
                image_params: nil,
                # Requires `formats.json: true`; required when it is set.
                json_params: nil,
                # Markdown options. Requires `formats.markdown`.
                markdown_params: nil,
                # Maximum age of a cached output, in milliseconds. `0` fetches fresh. Defaults to
                # 3 days (259200000 ms). Maximum: 1 year (31536000000 ms).
                max_age_ms: nil,
                # Requires `formats.parse: true`; required when it is set.
                parse_params: nil,
                # Product options. Requires formats.product: true.
                product_params: nil,
                # Screenshot options. Requires formats.screenshot: true.
                screenshot_params: nil,
                # Browser and content settings shared by all outputs.
                shared_params: nil,
                # Labels for filtering usage in the dashboard.
                tags: nil,
                # Deadline for each page, using the same behavior and defaults as POST
                # /web/scrape.
                timeout_opts: nil,
                # Batches persist their results. Only disabled is supported; enabled returns
                # ZDR_NOT_SUPPORTED.
                zdr: nil
              )
              end

              sig do
                override.returns(
                  {
                    formats:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Formats,
                    source:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap
                      ),
                    highlights_params:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::HighlightsParams,
                    image_params:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams,
                    json_params:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::JsonParams,
                    markdown_params:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams,
                    max_age_ms: Integer,
                    parse_params:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser
                      ),
                    product_params:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ProductParams,
                    screenshot_params:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams,
                    shared_params:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams,
                    tags: T::Array[String],
                    timeout_opts:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts,
                    zdr:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Zdr::OrSymbol
                  }
                )
              end
              def to_hash
              end

              class Formats < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Formats,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # The original HTTP response body.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :bytes

                sig { params(bytes: T::Boolean).void }
                attr_writer :bytes

                # Markdown excerpts relevant to `highlightsParams.query`.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :highlights

                sig { params(highlights: T::Boolean).void }
                attr_writer :highlights

                # Rendered HTML.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :html

                sig { params(html: T::Boolean).void }
                attr_writer :html

                # Images found on the page.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :images

                sig { params(images: T::Boolean).void }
                attr_writer :images

                # An object matching `jsonParams.schema`, extracted from the page.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :json

                sig { params(json: T::Boolean).void }
                attr_writer :json

                # Page content as Markdown.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :markdown

                sig { params(markdown: T::Boolean).void }
                attr_writer :markdown

                # Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :parse

                sig { params(parse: T::Boolean).void }
                attr_writer :parse

                # Product details such as name, price, and availability.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :product

                sig { params(product: T::Boolean).void }
                attr_writer :product

                # A screenshot of the page.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :screenshot

                sig { params(screenshot: T::Boolean).void }
                attr_writer :screenshot

                # Outputs to return. Set at least one to `true`.
                sig do
                  params(
                    bytes: T::Boolean,
                    highlights: T::Boolean,
                    html: T::Boolean,
                    images: T::Boolean,
                    json: T::Boolean,
                    markdown: T::Boolean,
                    parse: T::Boolean,
                    product: T::Boolean,
                    screenshot: T::Boolean
                  ).returns(T.attached_class)
                end
                def self.new(
                  # The original HTTP response body.
                  bytes: nil,
                  # Markdown excerpts relevant to `highlightsParams.query`.
                  highlights: nil,
                  # Rendered HTML.
                  html: nil,
                  # Images found on the page.
                  images: nil,
                  # An object matching `jsonParams.schema`, extracted from the page.
                  json: nil,
                  # Page content as Markdown.
                  markdown: nil,
                  # Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
                  parse: nil,
                  # Product details such as name, price, and availability.
                  product: nil,
                  # A screenshot of the page.
                  screenshot: nil
                )
                end

                sig do
                  override.returns(
                    {
                      bytes: T::Boolean,
                      highlights: T::Boolean,
                      html: T::Boolean,
                      images: T::Boolean,
                      json: T::Boolean,
                      markdown: T::Boolean,
                      parse: T::Boolean,
                      product: T::Boolean,
                      screenshot: T::Boolean
                    }
                  )
                end
                def to_hash
                end
              end

              # How to find pages to crawl.
              module Source
                extend ContextDev::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap
                    )
                  end

                class StartURL < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Start from one page.
                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Page where crawling begins. A URL without a scheme is read as https://.
                  sig { returns(String) }
                  attr_accessor :url

                  # Limits and filters for page discovery.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls
                      )
                    )
                  end
                  attr_reader :controls

                  sig do
                    params(
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::OrHash
                    ).void
                  end
                  attr_writer :controls

                  # Discover pages by following links from one URL.
                  sig do
                    params(
                      url: String,
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::OrHash,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Page where crawling begins. A URL without a scheme is read as https://.
                    url:,
                    # Limits and filters for page discovery.
                    controls: nil,
                    # Start from one page.
                    type: :start_url
                  )
                  end

                  sig do
                    override.returns(
                      {
                        type: Symbol,
                        url: String,
                        controls:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls
                      }
                    )
                  end
                  def to_hash
                  end

                  class Controls < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                    # itself is always included.
                    sig { returns(T.nilable(String)) }
                    attr_reader :exclude_regex

                    sig { params(exclude_regex: String).void }
                    attr_writer :exclude_regex

                    # Follow links to subdomains.
                    sig { returns(T.nilable(T::Boolean)) }
                    attr_reader :follow_subdomains

                    sig { params(follow_subdomains: T::Boolean).void }
                    attr_writer :follow_subdomains

                    # Only follow pages in these languages, or `same_as_start_url`; all languages when
                    # omitted.
                    sig do
                      returns(
                        T.nilable(
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::OrSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                            ]
                          )
                        )
                      )
                    end
                    attr_reader :languages

                    sig do
                      params(
                        languages:
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::OrSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                            ]
                          )
                      ).void
                    end
                    attr_writer :languages

                    # Maximum link depth. Source pages are depth 0. No limit when omitted.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_depth

                    sig { params(max_depth: Integer).void }
                    attr_writer :max_depth

                    # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_urls

                    sig { params(max_urls: Integer).void }
                    attr_writer :max_urls

                    # Regex pattern for URLs to include. The `start_url` itself is always included.
                    sig { returns(T.nilable(String)) }
                    attr_reader :regex

                    sig { params(regex: String).void }
                    attr_writer :regex

                    # Limits and filters for page discovery.
                    sig do
                      params(
                        exclude_regex: String,
                        follow_subdomains: T::Boolean,
                        languages:
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::OrSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                            ]
                          ),
                        max_depth: Integer,
                        max_urls: Integer,
                        regex: String
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Regex pattern for URLs to exclude, even when they match `regex`. The `start_url`
                      # itself is always included.
                      exclude_regex: nil,
                      # Follow links to subdomains.
                      follow_subdomains: nil,
                      # Only follow pages in these languages, or `same_as_start_url`; all languages when
                      # omitted.
                      languages: nil,
                      # Maximum link depth. Source pages are depth 0. No limit when omitted.
                      max_depth: nil,
                      # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                      max_urls: nil,
                      # Regex pattern for URLs to include. The `start_url` itself is always included.
                      regex: nil
                    )
                    end

                    sig do
                      override.returns(
                        {
                          exclude_regex: String,
                          follow_subdomains: T::Boolean,
                          languages:
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::OrSymbol,
                              T::Array[
                                ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::OrSymbol
                              ]
                            ),
                          max_depth: Integer,
                          max_urls: Integer,
                          regex: String
                        }
                      )
                    end
                    def to_hash
                    end

                    # Only follow pages in these languages, or `same_as_start_url`; all languages when
                    # omitted.
                    module Languages
                      extend ContextDev::Internal::Type::Union

                      Variants =
                        T.type_alias do
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::TaggedSymbol,
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                            ]
                          )
                        end

                      module UnionMember1
                        extend ContextDev::Internal::Type::Enum

                        TaggedSymbol =
                          T.type_alias do
                            T.all(
                              Symbol,
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1
                            )
                          end
                        OrSymbol = T.type_alias { T.any(Symbol, String) }

                        AM =
                          T.let(
                            :am,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        AR =
                          T.let(
                            :ar,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        AZ =
                          T.let(
                            :az,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        BE =
                          T.let(
                            :be,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        BG =
                          T.let(
                            :bg,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        BN =
                          T.let(
                            :bn,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CA =
                          T.let(
                            :ca,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CEB =
                          T.let(
                            :ceb,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CS =
                          T.let(
                            :cs,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        CY =
                          T.let(
                            :cy,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        DA =
                          T.let(
                            :da,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        DE =
                          T.let(
                            :de,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        EL =
                          T.let(
                            :el,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        EN =
                          T.let(
                            :en,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ES =
                          T.let(
                            :es,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ET =
                          T.let(
                            :et,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        EU =
                          T.let(
                            :eu,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        FA =
                          T.let(
                            :fa,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        FI =
                          T.let(
                            :fi,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        FR =
                          T.let(
                            :fr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        GU =
                          T.let(
                            :gu,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HA =
                          T.let(
                            :ha,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HAW =
                          T.let(
                            :haw,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HE =
                          T.let(
                            :he,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HI =
                          T.let(
                            :hi,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HR =
                          T.let(
                            :hr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HU =
                          T.let(
                            :hu,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        HY =
                          T.let(
                            :hy,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ID =
                          T.let(
                            :id,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        IS =
                          T.let(
                            :is,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        IT =
                          T.let(
                            :it,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        JA =
                          T.let(
                            :ja,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KA =
                          T.let(
                            :ka,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KK =
                          T.let(
                            :kk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KN =
                          T.let(
                            :kn,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KO =
                          T.let(
                            :ko,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KU =
                          T.let(
                            :ku,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        KY =
                          T.let(
                            :ky,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        LO =
                          T.let(
                            :lo,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        LT =
                          T.let(
                            :lt,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        LV =
                          T.let(
                            :lv,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MK =
                          T.let(
                            :mk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ML =
                          T.let(
                            :ml,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MN =
                          T.let(
                            :mn,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MR =
                          T.let(
                            :mr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        MS =
                          T.let(
                            :ms,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        NE =
                          T.let(
                            :ne,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        NL =
                          T.let(
                            :nl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        NO =
                          T.let(
                            :no,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        OR =
                          T.let(
                            :or,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PA =
                          T.let(
                            :pa,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PL =
                          T.let(
                            :pl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PS =
                          T.let(
                            :ps,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        PT =
                          T.let(
                            :pt,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        RO =
                          T.let(
                            :ro,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        RU =
                          T.let(
                            :ru,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SK =
                          T.let(
                            :sk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SL =
                          T.let(
                            :sl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SO =
                          T.let(
                            :so,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SQ =
                          T.let(
                            :sq,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SR =
                          T.let(
                            :sr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SV =
                          T.let(
                            :sv,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        SW =
                          T.let(
                            :sw,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TA =
                          T.let(
                            :ta,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TE =
                          T.let(
                            :te,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TH =
                          T.let(
                            :th,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TL =
                          T.let(
                            :tl,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        TR =
                          T.let(
                            :tr,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        UK =
                          T.let(
                            :uk,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        UR =
                          T.let(
                            :ur,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        UZ =
                          T.let(
                            :uz,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        VI =
                          T.let(
                            :vi,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        YO =
                          T.let(
                            :yo,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )
                        ZH =
                          T.let(
                            :zh,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                          )

                        sig do
                          override.returns(
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1::TaggedSymbol
                            ]
                          )
                        end
                        def self.values
                        end
                      end

                      sig do
                        override.returns(
                          T::Array[
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::Variants
                          ]
                        )
                      end
                      def self.variants
                      end

                      TaggedSymbol =
                        T.type_alias do
                          T.all(
                            Symbol,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages
                          )
                        end
                      OrSymbol = T.type_alias { T.any(Symbol, String) }

                      SAME_AS_START_URL =
                        T.let(
                          :same_as_start_url,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::TaggedSymbol
                        )

                      UnionMember1Array =
                        T.let(
                          ContextDev::Internal::Type::ArrayOf[
                            enum:
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::StartURL::Controls::Languages::UnionMember1
                          ],
                          ContextDev::Internal::Type::Converter
                        )
                    end
                  end
                end

                class Sitemap < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Domain whose sitemap lists the pages to scrape. A full URL is reduced to its
                  # domain.
                  sig { returns(String) }
                  attr_accessor :domain

                  # Scrape the URLs in the domain's sitemap.
                  sig { returns(Symbol) }
                  attr_accessor :type

                  # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                  # URLs and never follows links off them, so there is no crawl depth here.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap::Controls
                      )
                    )
                  end
                  attr_reader :controls

                  sig do
                    params(
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap::Controls::OrHash
                    ).void
                  end
                  attr_writer :controls

                  # Scrape the pages listed in a domain's sitemap. Links on those pages are not
                  # followed.
                  sig do
                    params(
                      domain: String,
                      controls:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap::Controls::OrHash,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Domain whose sitemap lists the pages to scrape. A full URL is reduced to its
                    # domain.
                    domain:,
                    # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    # URLs and never follows links off them, so there is no crawl depth here.
                    controls: nil,
                    # Scrape the URLs in the domain's sitemap.
                    type: :sitemap
                  )
                  end

                  sig do
                    override.returns(
                      {
                        domain: String,
                        type: Symbol,
                        controls:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap::Controls
                      }
                    )
                  end
                  def to_hash
                  end

                  class Controls < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Sitemap::Controls,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Regex pattern; sitemap URLs matching it are not scraped, even when they match
                    # `regex`.
                    sig { returns(T.nilable(String)) }
                    attr_reader :exclude_regex

                    sig { params(exclude_regex: String).void }
                    attr_writer :exclude_regex

                    # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_urls

                    sig { params(max_urls: Integer).void }
                    attr_writer :max_urls

                    # Regex pattern; only sitemap URLs matching it are scraped.
                    sig { returns(T.nilable(String)) }
                    attr_reader :regex

                    sig { params(regex: String).void }
                    attr_writer :regex

                    # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    # URLs and never follows links off them, so there is no crawl depth here.
                    sig do
                      params(
                        exclude_regex: String,
                        max_urls: Integer,
                        regex: String
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Regex pattern; sitemap URLs matching it are not scraped, even when they match
                      # `regex`.
                      exclude_regex: nil,
                      # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 100000.
                      max_urls: nil,
                      # Regex pattern; only sitemap URLs matching it are scraped.
                      regex: nil
                    )
                    end

                    sig do
                      override.returns(
                        {
                          exclude_regex: String,
                          max_urls: Integer,
                          regex: String
                        }
                      )
                    end
                    def to_hash
                    end
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Source::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class HighlightsParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::HighlightsParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # The question or topic to find passages for.
                sig { returns(String) }
                attr_accessor :query

                # Maximum combined length of returned passages.
                sig { returns(T.nilable(Integer)) }
                attr_reader :max_characters

                sig { params(max_characters: Integer).void }
                attr_writer :max_characters

                # Requires `formats.highlights: true`; required when it is set.
                sig do
                  params(query: String, max_characters: Integer).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # The question or topic to find passages for.
                  query:,
                  # Maximum combined length of returned passages.
                  max_characters: nil
                )
                end

                sig do
                  override.returns({ query: String, max_characters: Integer })
                end
                def to_hash
                end
              end

              class ImageParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Set `visual` to drop visual duplicates, keeping the largest copy.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe::OrSymbol
                    )
                  )
                end
                attr_reader :dedupe

                sig do
                  params(
                    dedupe:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe::OrSymbol
                  ).void
                end
                attr_writer :dedupe

                # Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.
                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich::OrSymbol
                      ]
                    )
                  )
                end
                attr_reader :enrich

                sig do
                  params(
                    enrich:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich::OrSymbol
                      ]
                  ).void
                end
                attr_writer :enrich

                # Image options. Requires formats.images: true.
                sig do
                  params(
                    dedupe:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe::OrSymbol,
                    enrich:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich::OrSymbol
                      ]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Set `visual` to drop visual duplicates, keeping the largest copy.
                  dedupe: nil,
                  # Extra data per image: `dimensions`, `classification`, or a hosted `file` URL.
                  enrich: nil
                )
                end

                sig do
                  override.returns(
                    {
                      dedupe:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe::OrSymbol,
                      enrich:
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich::OrSymbol
                        ]
                    }
                  )
                end
                def to_hash
                end

                # Set `visual` to drop visual duplicates, keeping the largest copy.
                module Dedupe
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  NONE =
                    T.let(
                      :none,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe::TaggedSymbol
                    )
                  VISUAL =
                    T.let(
                      :visual,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Dedupe::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                module Enrich
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  DIMENSIONS =
                    T.let(
                      :dimensions,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich::TaggedSymbol
                    )
                  CLASSIFICATION =
                    T.let(
                      :classification,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich::TaggedSymbol
                    )
                  FILE =
                    T.let(
                      :file,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ImageParams::Enrich::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              class JsonParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::JsonParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # JSON Schema (not an example object) for a top-level object, up to 50 KB. Use
                # optional or nullable fields for missing facts.
                sig { returns(T::Hash[Symbol, T.anything]) }
                attr_accessor :schema

                # Extra guidance, such as which facts to prefer or how to read a field.
                sig { returns(T.nilable(String)) }
                attr_reader :instructions

                sig { params(instructions: String).void }
                attr_writer :instructions

                # Requires `formats.json: true`; required when it is set.
                sig do
                  params(
                    schema: T::Hash[Symbol, T.anything],
                    instructions: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # JSON Schema (not an example object) for a top-level object, up to 50 KB. Use
                  # optional or nullable fields for missing facts.
                  schema:,
                  # Extra guidance, such as which facts to prefer or how to read a field.
                  instructions: nil
                )
                end

                sig do
                  override.returns(
                    {
                      schema: T::Hash[Symbol, T.anything],
                      instructions: String
                    }
                  )
                end
                def to_hash
                end
              end

              class MarkdownParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Include images in the Markdown (`html-conversion` only).
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_images

                sig { params(include_images: T::Boolean).void }
                attr_writer :include_images

                # Keep link URLs in the Markdown (`html-conversion` only).
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_links

                sig { params(include_links: T::Boolean).void }
                attr_writer :include_links

                # How base64 images appear when `includeImages` is set (`html-conversion` only).
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages::OrSymbol
                    )
                  )
                end
                attr_reader :inline_images

                sig do
                  params(
                    inline_images:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages::OrSymbol
                  ).void
                end
                attr_writer :inline_images

                # Markdown sources in order of preference: `html-conversion` converts the page
                # HTML, `markdown-direct` uses Markdown the site publishes.
                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference::OrSymbol
                      ]
                    )
                  )
                end
                attr_reader :source_preference

                sig do
                  params(
                    source_preference:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference::OrSymbol
                      ]
                  ).void
                end
                attr_writer :source_preference

                # Markdown options. Requires `formats.markdown`.
                sig do
                  params(
                    include_images: T::Boolean,
                    include_links: T::Boolean,
                    inline_images:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages::OrSymbol,
                    source_preference:
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference::OrSymbol
                      ]
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Include images in the Markdown (`html-conversion` only).
                  include_images: nil,
                  # Keep link URLs in the Markdown (`html-conversion` only).
                  include_links: nil,
                  # How base64 images appear when `includeImages` is set (`html-conversion` only).
                  inline_images: nil,
                  # Markdown sources in order of preference: `html-conversion` converts the page
                  # HTML, `markdown-direct` uses Markdown the site publishes.
                  source_preference: nil
                )
                end

                sig do
                  override.returns(
                    {
                      include_images: T::Boolean,
                      include_links: T::Boolean,
                      inline_images:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages::OrSymbol,
                      source_preference:
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference::OrSymbol
                        ]
                    }
                  )
                end
                def to_hash
                end

                # How base64 images appear when `includeImages` is set (`html-conversion` only).
                module InlineImages
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  PLACEHOLDER =
                    T.let(
                      :placeholder,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages::TaggedSymbol
                    )
                  PRESERVE =
                    T.let(
                      :preserve,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::InlineImages::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                module SourcePreference
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  HTML_CONVERSION =
                    T.let(
                      :"html-conversion",
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference::TaggedSymbol
                    )
                  MARKDOWN_DIRECT =
                    T.let(
                      :"markdown-direct",
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::MarkdownParams::SourcePreference::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Requires `formats.parse: true`; required when it is set.
              module ParseParams
                extend ContextDev::Internal::Type::Union

                Variants =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser
                    )
                  end

                class CustomParser < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100
                  # fields, 5 levels.
                  sig do
                    returns(
                      T::Hash[
                        Symbol,
                        T.any(
                          String,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1
                        )
                      ]
                    )
                  end
                  attr_accessor :rules

                  # Extract fields using custom CSS rules. This is the default when type is omitted.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Type::OrSymbol
                      )
                    )
                  end
                  attr_reader :type

                  sig do
                    params(
                      type:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Type::OrSymbol
                    ).void
                  end
                  attr_writer :type

                  sig do
                    params(
                      rules:
                        T::Hash[
                          Symbol,
                          T.any(
                            String,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::OrHash
                          )
                        ],
                      type:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Type::OrSymbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Field names mapped to CSS selectors (`h1`, `a@href`) or rule objects. Max 100
                    # fields, 5 levels.
                    rules:,
                    # Extract fields using custom CSS rules. This is the default when type is omitted.
                    type: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        rules:
                          T::Hash[
                            Symbol,
                            T.any(
                              String,
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1
                            )
                          ],
                        type:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Type::OrSymbol
                      }
                    )
                  end
                  def to_hash
                  end

                  module Rule
                    extend ContextDev::Internal::Type::Union

                    Variants =
                      T.type_alias do
                        T.any(
                          String,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1
                        )
                      end

                    class UnionMember1 < ContextDev::Internal::Type::BaseModel
                      OrHash =
                        T.type_alias do
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1,
                            ContextDev::Internal::AnyHash
                          )
                        end

                      # CSS selector to match within the current page or parent rule.
                      sig { returns(String) }
                      attr_accessor :selector

                      # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                      # to text.
                      sig do
                        returns(
                          T.nilable(
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                              String,
                              T.anything
                            )
                          )
                        )
                      end
                      attr_reader :output

                      sig do
                        params(
                          output:
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                              String,
                              T.anything
                            )
                        ).void
                      end
                      attr_writer :output

                      # Return the first match with `item` or all matches with `list`.
                      sig do
                        returns(
                          T.nilable(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                          )
                        )
                      end
                      attr_reader :type

                      sig do
                        params(
                          type:
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                        ).void
                      end
                      attr_writer :type

                      sig do
                        params(
                          selector: String,
                          output:
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                              String,
                              T.anything
                            ),
                          type:
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                        ).returns(T.attached_class)
                      end
                      def self.new(
                        # CSS selector to match within the current page or parent rule.
                        selector:,
                        # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                        # to text.
                        output: nil,
                        # Return the first match with `item` or all matches with `list`.
                        type: nil
                      )
                      end

                      sig do
                        override.returns(
                          {
                            selector: String,
                            output:
                              T.any(
                                ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::OrSymbol,
                                String,
                                T.anything
                              ),
                            type:
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type::OrSymbol
                          }
                        )
                      end
                      def to_hash
                      end

                      # Return text, HTML, an attribute such as `@href`, or nested field rules. Defaults
                      # to text.
                      module Output
                        extend ContextDev::Internal::Type::Union

                        Variants =
                          T.type_alias do
                            T.any(
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol,
                              String,
                              T.anything
                            )
                          end

                        sig do
                          override.returns(
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::Variants
                            ]
                          )
                        end
                        def self.variants
                        end

                        TaggedSymbol =
                          T.type_alias do
                            T.all(
                              Symbol,
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output
                            )
                          end
                        OrSymbol = T.type_alias { T.any(Symbol, String) }

                        TEXT =
                          T.let(
                            :text,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol
                          )
                        HTML =
                          T.let(
                            :html,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Output::TaggedSymbol
                          )
                      end

                      # Return the first match with `item` or all matches with `list`.
                      module Type
                        extend ContextDev::Internal::Type::Enum

                        TaggedSymbol =
                          T.type_alias do
                            T.all(
                              Symbol,
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type
                            )
                          end
                        OrSymbol = T.type_alias { T.any(Symbol, String) }

                        ITEM =
                          T.let(
                            :item,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type::TaggedSymbol
                          )
                        LIST =
                          T.let(
                            :list,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type::TaggedSymbol
                          )

                        sig do
                          override.returns(
                            T::Array[
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::UnionMember1::Type::TaggedSymbol
                            ]
                          )
                        end
                        def self.values
                        end
                      end
                    end

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Rule::Variants
                        ]
                      )
                    end
                    def self.variants
                    end
                  end

                  # Extract fields using custom CSS rules. This is the default when type is omitted.
                  module Type
                    extend ContextDev::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Type
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    CUSTOM =
                      T.let(
                        :custom,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Type::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::CustomParser::Type::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end

                class PrebuiltParser < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # google-maps parses Google Maps business data into data.results. Accepts Maps
                  # place, search, and internal data URLs. Uses a US exit and English labels
                  # regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
                  # a place in data.reviews, in the same shape as the Serper reviews API (rating,
                  # date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
                  # id), plus language, guided ratings in details, and user.isLocalGuide; data also
                  # carries the place featureId, cid, and sort. sort and limit pick the order and
                  # count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
                  # search.google.com/local/reviews URLs, so the google_maps_url and
                  # google_reviews_url fields of google-maps results work as input. An unknown place
                  # returns no reviews. google-play parses a Play Store app into data: details,
                  # developer contact, ratings, price, permissions, and data safety.
                  # google-play-reviews returns the 200 newest reviews of the app, with developer
                  # replies, in data.reviews. Both Play parsers accept app details URLs
                  # (play.google.com/store/apps/details?id=…); hl and gl set the language and
                  # storefront, defaulting to en and us. app-store parses an App Store app into
                  # data: details, developer, ratings, price, version, and screenshots.
                  # app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
                  # Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
                  # path sets the storefront, defaulting to us. g2-reviews returns the 25 most
                  # recently published reviews of a G2 product in data.reviews (rating, title,
                  # likes, dislikes, problems_solved, reviewer role, company size, and industry),
                  # plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
                  # renamed products, and keeps star-rating filters from the URL
                  # (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
                  # ignored. instagram-profile parses a public profile (instagram.com/{username})
                  # into data: bio, links, follower and post counts, category, business address,
                  # similar_accounts, and latest_posts (up to the 12 posts at the top of the
                  # profile, newest first). Instagram lists pinned posts there ahead of newer ones,
                  # so posts with is_pinned true can be older; when Instagram shows only a rounded
                  # post count (32K), post_count is that rounded number and is_post_count_rounded is
                  # true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
                  # hashtags, mentions, like, comment, and view counts (like_count and view_count
                  # are null when the owner hides them), media URLs, tagged users, collaborators,
                  # location, and the top ~14 comments in data.comments. instagram-feed returns the
                  # top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
                  # posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
                  # carry only the shortcode, owner, thumbnail, and views, plus the caption when
                  # Instagram shows it. All three Instagram parsers read public data without logging
                  # in, so private accounts return no posts and follower lists are unavailable.
                  # tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
                  # nickname, bio, bio link, follower, following, like, and video counts, verified,
                  # private, and business flags, and business category; it does not list videos.
                  # tiktok-video parses a video or photo post (/@{username}/video/{id} or
                  # /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
                  # like, comment, share, save, and repost counts, duration, thumbnail, a video_url
                  # that downloads without cookies, image_urls for photo posts, music, location, and
                  # ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
                  # tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
                  # from a hashtag URL (/tag/{name}), or the top 12 from a search URL
                  # (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
                  # photo post as data.comments: text, posted_at, like and reply counts, whether the
                  # author liked it, and the commenter. tiktok-followers and tiktok-following return
                  # up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
                  # tiktok-user-search returns the top 10 accounts for a user search URL
                  # (/search/user?q={query}) as data.users: id, username, nickname, biography,
                  # avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
                  # parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
                  # links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). yelp-search accepts Yelp
                  # search URLs with find_desc and find_loc, reads start as the result offset, and
                  # returns up to 20 ranked organic businesses in data.businesses with total and
                  # pagination. emails accepts any page and returns its email addresses as
                  # data.emails ([{ email }]), read from mailto links, Cloudflare-protected
                  # addresses, and visible text. phone-numbers accepts any page and returns its
                  # valid phone numbers in E.164 as data.phone_numbers ([{ phone }]), read from tel
                  # links and visible text; numbers without a country code are read for the country
                  # of the site TLD, defaulting to US. links accepts any page and returns its unique
                  # http(s) links as data.links ([{ url, text }]), with absolute URLs; text falls
                  # back to aria-label or image alt and is null when a link has none. The emails
                  # parser reads the rendered page and respects content filters; the other prebuilt
                  # parsers read their data independently of DOM filters.
                  sig do
                    returns(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::OrSymbol
                    )
                  end
                  attr_accessor :parser

                  # Use a prebuilt parser instead of custom rules.
                  sig { returns(Symbol) }
                  attr_accessor :type

                  # google-maps-reviews only. Maximum number of reviews to return. Defaults to 100;
                  # maximum 1000.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :limit

                  sig { params(limit: Integer).void }
                  attr_writer :limit

                  # google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                  # lowest follow Google; oldest returns the earliest reviews first, which Google
                  # itself does not offer.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort::OrSymbol
                      )
                    )
                  end
                  attr_reader :sort

                  sig do
                    params(
                      sort:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort::OrSymbol
                    ).void
                  end
                  attr_writer :sort

                  sig do
                    params(
                      parser:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::OrSymbol,
                      limit: Integer,
                      sort:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort::OrSymbol,
                      type: Symbol
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # google-maps parses Google Maps business data into data.results. Accepts Maps
                    # place, search, and internal data URLs. Uses a US exit and English labels
                    # regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
                    # a place in data.reviews, in the same shape as the Serper reviews API (rating,
                    # date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
                    # id), plus language, guided ratings in details, and user.isLocalGuide; data also
                    # carries the place featureId, cid, and sort. sort and limit pick the order and
                    # count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
                    # search.google.com/local/reviews URLs, so the google_maps_url and
                    # google_reviews_url fields of google-maps results work as input. An unknown place
                    # returns no reviews. google-play parses a Play Store app into data: details,
                    # developer contact, ratings, price, permissions, and data safety.
                    # google-play-reviews returns the 200 newest reviews of the app, with developer
                    # replies, in data.reviews. Both Play parsers accept app details URLs
                    # (play.google.com/store/apps/details?id=…); hl and gl set the language and
                    # storefront, defaulting to en and us. app-store parses an App Store app into
                    # data: details, developer, ratings, price, version, and screenshots.
                    # app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
                    # Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
                    # path sets the storefront, defaulting to us. g2-reviews returns the 25 most
                    # recently published reviews of a G2 product in data.reviews (rating, title,
                    # likes, dislikes, problems_solved, reviewer role, company size, and industry),
                    # plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
                    # renamed products, and keeps star-rating filters from the URL
                    # (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
                    # ignored. instagram-profile parses a public profile (instagram.com/{username})
                    # into data: bio, links, follower and post counts, category, business address,
                    # similar_accounts, and latest_posts (up to the 12 posts at the top of the
                    # profile, newest first). Instagram lists pinned posts there ahead of newer ones,
                    # so posts with is_pinned true can be older; when Instagram shows only a rounded
                    # post count (32K), post_count is that rounded number and is_post_count_rounded is
                    # true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
                    # hashtags, mentions, like, comment, and view counts (like_count and view_count
                    # are null when the owner hides them), media URLs, tagged users, collaborators,
                    # location, and the top ~14 comments in data.comments. instagram-feed returns the
                    # top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
                    # posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
                    # carry only the shortcode, owner, thumbnail, and views, plus the caption when
                    # Instagram shows it. All three Instagram parsers read public data without logging
                    # in, so private accounts return no posts and follower lists are unavailable.
                    # tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
                    # nickname, bio, bio link, follower, following, like, and video counts, verified,
                    # private, and business flags, and business category; it does not list videos.
                    # tiktok-video parses a video or photo post (/@{username}/video/{id} or
                    # /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
                    # like, comment, share, save, and repost counts, duration, thumbnail, a video_url
                    # that downloads without cookies, image_urls for photo posts, music, location, and
                    # ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
                    # tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
                    # from a hashtag URL (/tag/{name}), or the top 12 from a search URL
                    # (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
                    # photo post as data.comments: text, posted_at, like and reply counts, whether the
                    # author liked it, and the commenter. tiktok-followers and tiktok-following return
                    # up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
                    # tiktok-user-search returns the top 10 accounts for a user search URL
                    # (/search/user?q={query}) as data.users: id, username, nickname, biography,
                    # avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
                    # parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
                    # links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). yelp-search accepts Yelp
                    # search URLs with find_desc and find_loc, reads start as the result offset, and
                    # returns up to 20 ranked organic businesses in data.businesses with total and
                    # pagination. emails accepts any page and returns its email addresses as
                    # data.emails ([{ email }]), read from mailto links, Cloudflare-protected
                    # addresses, and visible text. phone-numbers accepts any page and returns its
                    # valid phone numbers in E.164 as data.phone_numbers ([{ phone }]), read from tel
                    # links and visible text; numbers without a country code are read for the country
                    # of the site TLD, defaulting to US. links accepts any page and returns its unique
                    # http(s) links as data.links ([{ url, text }]), with absolute URLs; text falls
                    # back to aria-label or image alt and is null when a link has none. The emails
                    # parser reads the rendered page and respects content filters; the other prebuilt
                    # parsers read their data independently of DOM filters.
                    parser:,
                    # google-maps-reviews only. Maximum number of reviews to return. Defaults to 100;
                    # maximum 1000.
                    limit: nil,
                    # google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                    # lowest follow Google; oldest returns the earliest reviews first, which Google
                    # itself does not offer.
                    sort: nil,
                    # Use a prebuilt parser instead of custom rules.
                    type: :prebuilt
                  )
                  end

                  sig do
                    override.returns(
                      {
                        parser:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::OrSymbol,
                        type: Symbol,
                        limit: Integer,
                        sort:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort::OrSymbol
                      }
                    )
                  end
                  def to_hash
                  end

                  # google-maps parses Google Maps business data into data.results. Accepts Maps
                  # place, search, and internal data URLs. Uses a US exit and English labels
                  # regardless of hl or Accept-Language. google-maps-reviews returns the reviews of
                  # a place in data.reviews, in the same shape as the Serper reviews API (rating,
                  # date, isoDate, snippet, translatedSnippet, likes, user, media, response, link,
                  # id), plus language, guided ratings in details, and user.isLocalGuide; data also
                  # carries the place featureId, cid, and sort. sort and limit pick the order and
                  # count, and oldest is exact. It accepts Maps place, search, and ?cid= URLs, plus
                  # search.google.com/local/reviews URLs, so the google_maps_url and
                  # google_reviews_url fields of google-maps results work as input. An unknown place
                  # returns no reviews. google-play parses a Play Store app into data: details,
                  # developer contact, ratings, price, permissions, and data safety.
                  # google-play-reviews returns the 200 newest reviews of the app, with developer
                  # replies, in data.reviews. Both Play parsers accept app details URLs
                  # (play.google.com/store/apps/details?id=…); hl and gl set the language and
                  # storefront, defaulting to en and us. app-store parses an App Store app into
                  # data: details, developer, ratings, price, version, and screenshots.
                  # app-store-reviews returns up to the 500 newest reviews in data.reviews. Both App
                  # Store parsers accept app URLs (apps.apple.com/us/app/…/id…); the country in the
                  # path sets the storefront, defaulting to us. g2-reviews returns the 25 most
                  # recently published reviews of a G2 product in data.reviews (rating, title,
                  # likes, dislikes, problems_solved, reviewer role, company size, and industry),
                  # plus data.product. It accepts G2 product URLs (g2.com/products/…), follows
                  # renamed products, and keeps star-rating filters from the URL
                  # (filters[nps_score][]=1 to 5); other filters, sort orders, and pages are
                  # ignored. instagram-profile parses a public profile (instagram.com/{username})
                  # into data: bio, links, follower and post counts, category, business address,
                  # similar_accounts, and latest_posts (up to the 12 posts at the top of the
                  # profile, newest first). Instagram lists pinned posts there ahead of newer ones,
                  # so posts with is_pinned true can be older; when Instagram shows only a rounded
                  # post count (32K), post_count is that rounded number and is_post_count_rounded is
                  # true. instagram-post parses a post or reel (/p/…, /reel/…) into data: caption,
                  # hashtags, mentions, like, comment, and view counts (like_count and view_count
                  # are null when the owner hides them), media URLs, tagged users, collaborators,
                  # location, and the top ~14 comments in data.comments. instagram-feed returns the
                  # top posts for a hashtag or keyword (/explore/tags/…, /popular/…) or the recent
                  # posts at a location (/explore/locations/{id}/…) in data.posts; keyword posts
                  # carry only the shortcode, owner, thumbnail, and views, plus the caption when
                  # Instagram shows it. All three Instagram parsers read public data without logging
                  # in, so private accounts return no posts and follower lists are unavailable.
                  # tiktok-profile parses a public profile (tiktok.com/@{username}) into data:
                  # nickname, bio, bio link, follower, following, like, and video counts, verified,
                  # private, and business flags, and business category; it does not list videos.
                  # tiktok-video parses a video or photo post (/@{username}/video/{id} or
                  # /@{username}/photo/{id}) into data: caption, hashtags, mentions, author, view,
                  # like, comment, share, save, and repost counts, duration, thumbnail, a video_url
                  # that downloads without cookies, image_urls for photo posts, music, location, and
                  # ad, paid-partnership, and AI-generated flags. tiktok-feed returns videos in the
                  # tiktok-video shape as data.videos: the latest 15 from a profile URL, the top 30
                  # from a hashtag URL (/tag/{name}), or the top 12 from a search URL
                  # (/search?q={query}). tiktok-comments returns the first 20 comments of a video or
                  # photo post as data.comments: text, posted_at, like and reply counts, whether the
                  # author liked it, and the commenter. tiktok-followers and tiktok-following return
                  # up to 30 accounts of a profile as data.users, in the tiktok-profile shape.
                  # tiktok-user-search returns the top 10 accounts for a user search URL
                  # (/search/user?q={query}) as data.users: id, username, nickname, biography,
                  # avatar_url, sec_uid, follower_count, like_count, and is_verified. The TikTok
                  # parsers accept tiktok.com, www.tiktok.com, and m.tiktok.com URLs but not short
                  # links (vm.tiktok.com, vt.tiktok.com, tiktok.com/t/…). yelp-search accepts Yelp
                  # search URLs with find_desc and find_loc, reads start as the result offset, and
                  # returns up to 20 ranked organic businesses in data.businesses with total and
                  # pagination. emails accepts any page and returns its email addresses as
                  # data.emails ([{ email }]), read from mailto links, Cloudflare-protected
                  # addresses, and visible text. phone-numbers accepts any page and returns its
                  # valid phone numbers in E.164 as data.phone_numbers ([{ phone }]), read from tel
                  # links and visible text; numbers without a country code are read for the country
                  # of the site TLD, defaulting to US. links accepts any page and returns its unique
                  # http(s) links as data.links ([{ url, text }]), with absolute URLs; text falls
                  # back to aria-label or image alt and is null when a link has none. The emails
                  # parser reads the rendered page and respects content filters; the other prebuilt
                  # parsers read their data independently of DOM filters.
                  module Parser
                    extend ContextDev::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    GOOGLE_MAPS =
                      T.let(
                        :"google-maps",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    GOOGLE_MAPS_REVIEWS =
                      T.let(
                        :"google-maps-reviews",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    GOOGLE_PLAY =
                      T.let(
                        :"google-play",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    GOOGLE_PLAY_REVIEWS =
                      T.let(
                        :"google-play-reviews",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    APP_STORE =
                      T.let(
                        :"app-store",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    APP_STORE_REVIEWS =
                      T.let(
                        :"app-store-reviews",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    G2_REVIEWS =
                      T.let(
                        :"g2-reviews",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    INSTAGRAM_PROFILE =
                      T.let(
                        :"instagram-profile",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    INSTAGRAM_POST =
                      T.let(
                        :"instagram-post",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    INSTAGRAM_FEED =
                      T.let(
                        :"instagram-feed",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_PROFILE =
                      T.let(
                        :"tiktok-profile",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_VIDEO =
                      T.let(
                        :"tiktok-video",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_FEED =
                      T.let(
                        :"tiktok-feed",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_COMMENTS =
                      T.let(
                        :"tiktok-comments",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_FOLLOWERS =
                      T.let(
                        :"tiktok-followers",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_FOLLOWING =
                      T.let(
                        :"tiktok-following",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    TIKTOK_USER_SEARCH =
                      T.let(
                        :"tiktok-user-search",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    YELP_SEARCH =
                      T.let(
                        :"yelp-search",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    EMAILS =
                      T.let(
                        :emails,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    PHONE_NUMBERS =
                      T.let(
                        :"phone-numbers",
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )
                    LINKS =
                      T.let(
                        :links,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Parser::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end

                  # google-maps-reviews only. Order of data.reviews. newest, relevant, highest, and
                  # lowest follow Google; oldest returns the earliest reviews first, which Google
                  # itself does not offer.
                  module Sort
                    extend ContextDev::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    NEWEST =
                      T.let(
                        :newest,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                      )
                    OLDEST =
                      T.let(
                        :oldest,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                      )
                    RELEVANT =
                      T.let(
                        :relevant,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                      )
                    HIGHEST =
                      T.let(
                        :highest,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                      )
                    LOWEST =
                      T.let(
                        :lowest,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::PrebuiltParser::Sort::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end
                end

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ParseParams::Variants
                    ]
                  )
                end
                def self.variants
                end
              end

              class ProductParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ProductParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Drop visually duplicate product images, keeping the largest copy.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :dedupe_images

                sig { params(dedupe_images: T::Boolean).void }
                attr_writer :dedupe_images

                # Ignored. The AI fallback runs automatically.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :use_ai_fallback

                sig { params(use_ai_fallback: T::Boolean).void }
                attr_writer :use_ai_fallback

                # Product options. Requires formats.product: true.
                sig do
                  params(
                    dedupe_images: T::Boolean,
                    use_ai_fallback: T::Boolean
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Drop visually duplicate product images, keeping the largest copy.
                  dedupe_images: nil,
                  # Ignored. The AI fallback runs automatically.
                  use_ai_fallback: nil
                )
                end

                sig do
                  override.returns(
                    { dedupe_images: T::Boolean, use_ai_fallback: T::Boolean }
                  )
                end
                def to_hash
                end
              end

              class ScreenshotParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
                # megapixels.
                sig do
                  returns(
                    T.nilable(
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page::OrSymbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Element,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Rectangle
                      )
                    )
                  )
                end
                attr_reader :area

                sig do
                  params(
                    area:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page::OrSymbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Element::OrHash,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Rectangle::OrHash
                      )
                  ).void
                end
                attr_writer :area

                # Image format for the screenshot.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format::OrSymbol
                    )
                  )
                end
                attr_reader :format_

                sig do
                  params(
                    format_:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format::OrSymbol
                  ).void
                end
                attr_writer :format_

                # Screenshot options. Requires formats.screenshot: true.
                sig do
                  params(
                    area:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page::OrSymbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Element::OrHash,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Rectangle::OrHash
                      ),
                    format_:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format::OrSymbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
                  # megapixels.
                  area: nil,
                  # Image format for the screenshot.
                  format_: nil
                )
                end

                sig do
                  override.returns(
                    {
                      area:
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page::OrSymbol,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Element,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Rectangle
                        ),
                      format_:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format::OrSymbol
                    }
                  )
                end
                def to_hash
                end

                # What to capture: `viewport`, `fullPage`, one element, or a rectangle. Max 40
                # megapixels.
                module Area
                  extend ContextDev::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page::TaggedSymbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Element,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Rectangle
                      )
                    end

                  module Page
                    extend ContextDev::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    VIEWPORT =
                      T.let(
                        :viewport,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page::TaggedSymbol
                      )
                    FULL_PAGE =
                      T.let(
                        :fullPage,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Page::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end

                  class Element < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Element,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # CSS selector matching exactly one visible element.
                    sig { returns(String) }
                    attr_accessor :selector

                    sig { params(selector: String).returns(T.attached_class) }
                    def self.new(
                      # CSS selector matching exactly one visible element.
                      selector:
                    )
                    end

                    sig { override.returns({ selector: String }) }
                    def to_hash
                    end
                  end

                  class Rectangle < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Rectangle,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Height of the capture in pixels.
                    sig { returns(Integer) }
                    attr_accessor :height

                    # Width of the capture in pixels.
                    sig { returns(Integer) }
                    attr_accessor :width

                    # Left edge of the capture, in pixels from the document origin.
                    sig { returns(Integer) }
                    attr_accessor :x

                    # Top edge of the capture, in pixels from the document origin.
                    sig { returns(Integer) }
                    attr_accessor :y_

                    # Pixels from the document origin.
                    sig do
                      params(
                        height: Integer,
                        width: Integer,
                        x: Integer,
                        y_: Integer
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Height of the capture in pixels.
                      height:,
                      # Width of the capture in pixels.
                      width:,
                      # Left edge of the capture, in pixels from the document origin.
                      x:,
                      # Top edge of the capture, in pixels from the document origin.
                      y_:
                    )
                    end

                    sig do
                      override.returns(
                        {
                          height: Integer,
                          width: Integer,
                          x: Integer,
                          y_: Integer
                        }
                      )
                    end
                    def to_hash
                    end
                  end

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Area::Variants
                      ]
                    )
                  end
                  def self.variants
                  end
                end

                # Image format for the screenshot.
                module Format
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  PNG =
                    T.let(
                      :png,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format::TaggedSymbol
                    )
                  JPEG =
                    T.let(
                      :jpeg,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format::TaggedSymbol
                    )
                  WEBP =
                    T.let(
                      :webp,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::ScreenshotParams::Format::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              class SharedParams < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Browser steps run in order before capture. Requires a paid plan. Skips the
                # cache.
                sig do
                  returns(
                    T.nilable(
                      T::Array[
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Perform,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Wait,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::WaitFor
                        )
                      ]
                    )
                  )
                end
                attr_reader :actions

                sig do
                  params(
                    actions:
                      T::Array[
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Perform::OrHash,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::OrHash,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Wait::OrHash,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::WaitFor::OrHash
                        )
                      ]
                  ).void
                end
                attr_writer :actions

                # Proxy country as a two-letter code, such as `US`. Case-insensitive.
                sig { returns(T.nilable(String)) }
                attr_reader :country

                sig { params(country: String).void }
                attr_writer :country

                # Accept cookie banners before actions and capture.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :dismiss_cookies

                sig { params(dismiss_cookies: T::Boolean).void }
                attr_writer :dismiss_cookies

                # Close other popups before actions and capture.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :dismiss_popups

                sig { params(dismiss_popups: T::Boolean).void }
                attr_writer :dismiss_popups

                # Remove elements matching these CSS selectors. Overrides `includeSelectors`.
                sig { returns(T.nilable(T::Array[String])) }
                attr_reader :exclude_selectors

                sig { params(exclude_selectors: T::Array[String]).void }
                attr_writer :exclude_selectors

                # HTTP headers to send to the target site. Requests with headers skip the cache.
                sig { returns(T.nilable(T::Hash[Symbol, String])) }
                attr_reader :headers

                sig { params(headers: T::Hash[Symbol, String]).void }
                attr_writer :headers

                # Include iframe content in HTML and text outputs. Screenshots always show visible
                # frames.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_frames

                sig { params(include_frames: T::Boolean).void }
                attr_writer :include_frames

                # Keep only elements matching these CSS selectors.
                sig { returns(T.nilable(T::Array[String])) }
                attr_reader :include_selectors

                sig { params(include_selectors: T::Array[String]).void }
                attr_writer :include_selectors

                # Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :main_content_only

                sig { params(main_content_only: T::Boolean).void }
                attr_writer :main_content_only

                # Document parsing options.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers
                    )
                  )
                end
                attr_reader :parsers

                sig do
                  params(
                    parsers:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::OrHash
                  ).void
                end
                attr_writer :parsers

                # Create or reuse an authenticated browser profile. Requires a paid plan and an
                # HTTPS target. Profiles persist session state, bypass shared caches, and cannot
                # be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
                sig do
                  returns(
                    T.nilable(
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Existing,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::New
                      )
                    )
                  )
                end
                attr_reader :profile

                sig do
                  params(
                    profile:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Existing::OrHash,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::New::OrHash
                      )
                  ).void
                end
                attr_writer :profile

                # Wait for CSS animations to finish before capture. Defaults to `true` when
                # `screenshot` is requested.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :settle_animations

                sig { params(settle_animations: T::Boolean).void }
                attr_writer :settle_animations

                # Emulate a light or dark color scheme.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme::OrSymbol
                    )
                  )
                end
                attr_reader :theme

                sig do
                  params(
                    theme:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme::OrSymbol
                  ).void
                end
                attr_writer :theme

                # Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                # default to 1440 × 900.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Viewport
                    )
                  )
                end
                attr_reader :viewport

                sig do
                  params(
                    viewport:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Viewport::OrHash
                  ).void
                end
                attr_writer :viewport

                # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
                # (2000 with frames or XML).
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::WaitFor::Variants
                    )
                  )
                end
                attr_reader :wait_for

                sig do
                  params(
                    wait_for:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::WaitFor::Variants
                  ).void
                end
                attr_writer :wait_for

                # Browser and content settings shared by all outputs.
                sig do
                  params(
                    actions:
                      T::Array[
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Perform::OrHash,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::OrHash,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Wait::OrHash,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::WaitFor::OrHash
                        )
                      ],
                    country: String,
                    dismiss_cookies: T::Boolean,
                    dismiss_popups: T::Boolean,
                    exclude_selectors: T::Array[String],
                    headers: T::Hash[Symbol, String],
                    include_frames: T::Boolean,
                    include_selectors: T::Array[String],
                    main_content_only: T::Boolean,
                    parsers:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::OrHash,
                    profile:
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Existing::OrHash,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::New::OrHash
                      ),
                    settle_animations: T::Boolean,
                    theme:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme::OrSymbol,
                    viewport:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Viewport::OrHash,
                    wait_for:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::WaitFor::Variants
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Browser steps run in order before capture. Requires a paid plan. Skips the
                  # cache.
                  actions: nil,
                  # Proxy country as a two-letter code, such as `US`. Case-insensitive.
                  country: nil,
                  # Accept cookie banners before actions and capture.
                  dismiss_cookies: nil,
                  # Close other popups before actions and capture.
                  dismiss_popups: nil,
                  # Remove elements matching these CSS selectors. Overrides `includeSelectors`.
                  exclude_selectors: nil,
                  # HTTP headers to send to the target site. Requests with headers skip the cache.
                  headers: nil,
                  # Include iframe content in HTML and text outputs. Screenshots always show visible
                  # frames.
                  include_frames: nil,
                  # Keep only elements matching these CSS selectors.
                  include_selectors: nil,
                  # Keep only the main content. Doesn't affect `screenshot`, `bytes`, or `product`.
                  main_content_only: nil,
                  # Document parsing options.
                  parsers: nil,
                  # Create or reuse an authenticated browser profile. Requires a paid plan and an
                  # HTTPS target. Profiles persist session state, bypass shared caches, and cannot
                  # be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
                  profile: nil,
                  # Wait for CSS animations to finish before capture. Defaults to `true` when
                  # `screenshot` is requested.
                  settle_animations: nil,
                  # Emulate a light or dark color scheme.
                  theme: nil,
                  # Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                  # default to 1440 × 900.
                  viewport: nil,
                  # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
                  # (2000 with frames or XML).
                  wait_for: nil
                )
                end

                sig do
                  override.returns(
                    {
                      actions:
                        T::Array[
                          T.any(
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Perform,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Wait,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::WaitFor
                          )
                        ],
                      country: String,
                      dismiss_cookies: T::Boolean,
                      dismiss_popups: T::Boolean,
                      exclude_selectors: T::Array[String],
                      headers: T::Hash[Symbol, String],
                      include_frames: T::Boolean,
                      include_selectors: T::Array[String],
                      main_content_only: T::Boolean,
                      parsers:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers,
                      profile:
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Existing,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::New
                        ),
                      settle_animations: T::Boolean,
                      theme:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme::OrSymbol,
                      viewport:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Viewport,
                      wait_for:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::WaitFor::Variants
                    }
                  )
                end
                def to_hash
                end

                module Action
                  extend ContextDev::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Perform,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Wait,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::WaitFor
                      )
                    end

                  class Perform < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Perform,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # One browser instruction, such as clicking a button or entering text.
                    sig { returns(String) }
                    attr_accessor :action

                    # Use `perform` for a plain-language browser instruction.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      params(action: String, type: Symbol).returns(
                        T.attached_class
                      )
                    end
                    def self.new(
                      # One browser instruction, such as clicking a button or entering text.
                      action:,
                      # Use `perform` for a plain-language browser instruction.
                      type: :perform
                    )
                    end

                    sig { override.returns({ action: String, type: Symbol }) }
                    def to_hash
                    end
                  end

                  class Scroll < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Use `scroll` to move through the page or a container.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                    sig do
                      returns(
                        T.nilable(
                          T.any(
                            Integer,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::OrSymbol
                          )
                        )
                      )
                    end
                    attr_reader :amount

                    sig do
                      params(
                        amount:
                          T.any(
                            Integer,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::OrSymbol
                          )
                      ).void
                    end
                    attr_writer :amount

                    # Direction to scroll.
                    sig do
                      returns(
                        T.nilable(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction::OrSymbol
                        )
                      )
                    end
                    attr_reader :direction

                    sig do
                      params(
                        direction:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction::OrSymbol
                      ).void
                    end
                    attr_writer :direction

                    # Maximum number of scroll steps for this action.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_scrolls

                    sig { params(max_scrolls: Integer).void }
                    attr_writer :max_scrolls

                    # Scroll this container. Omit to scroll the page.
                    sig { returns(T.nilable(String)) }
                    attr_reader :selector

                    sig { params(selector: String).void }
                    attr_writer :selector

                    sig do
                      params(
                        amount:
                          T.any(
                            Integer,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::OrSymbol
                          ),
                        direction:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction::OrSymbol,
                        max_scrolls: Integer,
                        selector: String,
                        type: Symbol
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                      amount: nil,
                      # Direction to scroll.
                      direction: nil,
                      # Maximum number of scroll steps for this action.
                      max_scrolls: nil,
                      # Scroll this container. Omit to scroll the page.
                      selector: nil,
                      # Use `scroll` to move through the page or a container.
                      type: :scroll
                    )
                    end

                    sig do
                      override.returns(
                        {
                          type: Symbol,
                          amount:
                            T.any(
                              Integer,
                              ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::OrSymbol
                            ),
                          direction:
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction::OrSymbol,
                          max_scrolls: Integer,
                          selector: String
                        }
                      )
                    end
                    def to_hash
                    end

                    # Distance per scroll: pixels, one `viewport`, or `max` to reach the end.
                    module Amount
                      extend ContextDev::Internal::Type::Union

                      Variants =
                        T.type_alias do
                          T.any(
                            Integer,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::TaggedSymbol
                          )
                        end

                      sig do
                        override.returns(
                          T::Array[
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::Variants
                          ]
                        )
                      end
                      def self.variants
                      end

                      TaggedSymbol =
                        T.type_alias do
                          T.all(
                            Symbol,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount
                          )
                        end
                      OrSymbol = T.type_alias { T.any(Symbol, String) }

                      VIEWPORT =
                        T.let(
                          :viewport,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::TaggedSymbol
                        )
                      MAX =
                        T.let(
                          :max,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Amount::TaggedSymbol
                        )
                    end

                    # Direction to scroll.
                    module Direction
                      extend ContextDev::Internal::Type::Enum

                      TaggedSymbol =
                        T.type_alias do
                          T.all(
                            Symbol,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction
                          )
                        end
                      OrSymbol = T.type_alias { T.any(Symbol, String) }

                      DOWN =
                        T.let(
                          :down,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction::TaggedSymbol
                        )
                      UP =
                        T.let(
                          :up,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction::TaggedSymbol
                        )
                      LEFT =
                        T.let(
                          :left,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction::TaggedSymbol
                        )
                      RIGHT =
                        T.let(
                          :right,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction::TaggedSymbol
                        )

                      sig do
                        override.returns(
                          T::Array[
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Scroll::Direction::TaggedSymbol
                          ]
                        )
                      end
                      def self.values
                      end
                    end
                  end

                  class Wait < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Wait,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Time to pause in milliseconds before the next action.
                    sig { returns(Integer) }
                    attr_accessor :milliseconds

                    # Use `wait` to pause for a fixed duration.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      params(milliseconds: Integer, type: Symbol).returns(
                        T.attached_class
                      )
                    end
                    def self.new(
                      # Time to pause in milliseconds before the next action.
                      milliseconds:,
                      # Use `wait` to pause for a fixed duration.
                      type: :wait
                    )
                    end

                    sig do
                      override.returns({ milliseconds: Integer, type: Symbol })
                    end
                    def to_hash
                    end
                  end

                  class WaitFor < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::WaitFor,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # CSS selector to wait for before continuing.
                    sig { returns(String) }
                    attr_accessor :selector

                    # Use `waitFor` to wait for a matching element.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      params(selector: String, type: Symbol).returns(
                        T.attached_class
                      )
                    end
                    def self.new(
                      # CSS selector to wait for before continuing.
                      selector:,
                      # Use `waitFor` to wait for a matching element.
                      type: :waitFor
                    )
                    end

                    sig { override.returns({ selector: String, type: Symbol }) }
                    def to_hash
                    end
                  end

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Action::Variants
                      ]
                    )
                  end
                  def self.variants
                  end
                end

                class Parsers < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # PDF page range and OCR.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf
                      )
                    )
                  end
                  attr_reader :pdf

                  sig do
                    params(
                      pdf:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::OrHash
                    ).void
                  end
                  attr_writer :pdf

                  # Document parsing options.
                  sig do
                    params(
                      pdf:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::OrHash
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # PDF page range and OCR.
                    pdf: nil
                  )
                  end

                  sig do
                    override.returns(
                      {
                        pdf:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf
                      }
                    )
                  end
                  def to_hash
                  end

                  class Pdf < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Last page to parse. Must be at least `startPage`.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :end_page

                    sig { params(end_page: Integer).void }
                    attr_writer :end_page

                    # Start each page in the Markdown with a `<!-- page N -->` line using its original
                    # 1-based page number; these responses are never served from cache.
                    sig { returns(T.nilable(T::Boolean)) }
                    attr_reader :include_numbered_pages

                    sig { params(include_numbered_pages: T::Boolean).void }
                    attr_writer :include_numbered_pages

                    # Set `auto` to read scanned pages with OCR.
                    sig do
                      returns(
                        T.nilable(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr::OrSymbol
                        )
                      )
                    end
                    attr_reader :ocr

                    sig do
                      params(
                        ocr:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr::OrSymbol
                      ).void
                    end
                    attr_writer :ocr

                    # First page to parse, starting at 1.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :start_page

                    sig { params(start_page: Integer).void }
                    attr_writer :start_page

                    # PDF page range and OCR.
                    sig do
                      params(
                        end_page: Integer,
                        include_numbered_pages: T::Boolean,
                        ocr:
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr::OrSymbol,
                        start_page: Integer
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Last page to parse. Must be at least `startPage`.
                      end_page: nil,
                      # Start each page in the Markdown with a `<!-- page N -->` line using its original
                      # 1-based page number; these responses are never served from cache.
                      include_numbered_pages: nil,
                      # Set `auto` to read scanned pages with OCR.
                      ocr: nil,
                      # First page to parse, starting at 1.
                      start_page: nil
                    )
                    end

                    sig do
                      override.returns(
                        {
                          end_page: Integer,
                          include_numbered_pages: T::Boolean,
                          ocr:
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr::OrSymbol,
                          start_page: Integer
                        }
                      )
                    end
                    def to_hash
                    end

                    # Set `auto` to read scanned pages with OCR.
                    module Ocr
                      extend ContextDev::Internal::Type::Enum

                      TaggedSymbol =
                        T.type_alias do
                          T.all(
                            Symbol,
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr
                          )
                        end
                      OrSymbol = T.type_alias { T.any(Symbol, String) }

                      OFF =
                        T.let(
                          :off,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr::TaggedSymbol
                        )
                      AUTO =
                        T.let(
                          :auto,
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr::TaggedSymbol
                        )

                      sig do
                        override.returns(
                          T::Array[
                            ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Parsers::Pdf::Ocr::TaggedSymbol
                          ]
                        )
                      end
                      def self.values
                      end
                    end
                  end
                end

                # Create or reuse an authenticated browser profile. Requires a paid plan and an
                # HTTPS target. Profiles persist session state, bypass shared caches, and cannot
                # be combined with ZDR, custom headers, raw bytes, or prebuilt parsers.
                module Profile
                  extend ContextDev::Internal::Type::Union

                  Variants =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Existing,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::New
                      )
                    end

                  class Existing < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Existing,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # The ID returned in profile.id by an earlier scrape.
                    sig { returns(String) }
                    attr_accessor :profile_id

                    # Reuse a saved browser profile.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    sig do
                      params(profile_id: String, type: Symbol).returns(
                        T.attached_class
                      )
                    end
                    def self.new(
                      # The ID returned in profile.id by an earlier scrape.
                      profile_id:,
                      # Reuse a saved browser profile.
                      type: :existing
                    )
                    end

                    sig do
                      override.returns({ profile_id: String, type: Symbol })
                    end
                    def to_hash
                    end
                  end

                  class New < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::New,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Username or email for the target website.
                    sig { returns(String) }
                    attr_accessor :identifier

                    # Sign in and create a browser profile.
                    sig { returns(Symbol) }
                    attr_accessor :type

                    # Optional label shown when listing profiles with `GET /org/browser/profiles`.
                    sig { returns(T.nilable(String)) }
                    attr_reader :description

                    sig { params(description: String).void }
                    attr_writer :description

                    # Password used to sign in. It is never stored in the profile.
                    sig { returns(String) }
                    attr_accessor :password

                    sig do
                      params(
                        identifier: String,
                        password: String,
                        description: String,
                        type: Symbol
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Username or email for the target website.
                      identifier:,
                      # Password used to sign in. It is never stored in the profile.
                      password:,
                      # Optional label shown when listing profiles with `GET /org/browser/profiles`.
                      description: nil,
                      # Sign in and create a browser profile.
                      type: :new
                    )
                    end

                    sig do
                      override.returns(
                        {
                          identifier: String,
                          password: String,
                          type: Symbol,
                          description: String
                        }
                      )
                    end
                    def to_hash
                    end
                  end

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Profile::Variants
                      ]
                    )
                  end
                  def self.variants
                  end
                end

                # Emulate a light or dark color scheme.
                module Theme
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  LIGHT =
                    T.let(
                      :light,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme::TaggedSymbol
                    )
                  DARK =
                    T.let(
                      :dark,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Theme::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end

                class Viewport < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::Viewport,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Browser viewport height in pixels.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :height

                  sig { params(height: Integer).void }
                  attr_writer :height

                  # Browser viewport width in pixels.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :width

                  sig { params(width: Integer).void }
                  attr_writer :width

                  # Browser size in pixels. Omit for 1920 × 1080. When provided, missing dimensions
                  # default to 1440 × 900.
                  sig do
                    params(height: Integer, width: Integer).returns(
                      T.attached_class
                    )
                  end
                  def self.new(
                    # Browser viewport height in pixels.
                    height: nil,
                    # Browser viewport width in pixels.
                    width: nil
                  )
                  end

                  sig { override.returns({ height: Integer, width: Integer }) }
                  def to_hash
                  end
                end

                # Milliseconds, or a CSS selector to wait for, after actions. Defaults to 500
                # (2000 with frames or XML).
                module WaitFor
                  extend ContextDev::Internal::Type::Union

                  Variants = T.type_alias { T.any(Integer, String) }

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::SharedParams::WaitFor::Variants
                      ]
                    )
                  end
                  def self.variants
                  end
                end
              end

              class TimeoutOpts < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Deadline in milliseconds.
                sig { returns(Integer) }
                attr_accessor :milliseconds

                # "fail" returns 408 at the deadline. "return-partial" returns available results;
                # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior::OrSymbol
                    )
                  )
                end
                attr_reader :behavior

                sig do
                  params(
                    behavior:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior::OrSymbol
                  ).void
                end
                attr_writer :behavior

                # Deadline for each page, using the same behavior and defaults as POST
                # /web/scrape.
                sig do
                  params(
                    milliseconds: Integer,
                    behavior:
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior::OrSymbol
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Deadline in milliseconds.
                  milliseconds:,
                  # "fail" returns 408 at the deadline. "return-partial" returns available results;
                  # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
                  behavior: nil
                )
                end

                sig do
                  override.returns(
                    {
                      milliseconds: Integer,
                      behavior:
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior::OrSymbol
                    }
                  )
                end
                def to_hash
                end

                # "fail" returns 408 at the deadline. "return-partial" returns available results;
                # inspect the response’s partial flag. "return-partial" requires at least 5000 ms.
                module Behavior
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  FAIL =
                    T.let(
                      :fail,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior::TaggedSymbol
                    )
                  RETURN_PARTIAL =
                    T.let(
                      :"return-partial",
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::TimeoutOpts::Behavior::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end

              # Batches persist their results. Only disabled is supported; enabled returns
              # ZDR_NOT_SUPPORTED.
              module Zdr
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Zdr
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                DISABLED =
                  T.let(
                    :disabled,
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Zdr::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::BatchUnifiedCrawlData::Zdr::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            sig do
              override.returns(
                T::Array[
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::Variants
                ]
              )
            end
            def self.variants
            end
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::BatchSubmitParams::Input::Variants]
          )
        end
        def self.variants
        end
      end

      class Webhook < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::BatchSubmitParams::Webhook,
              ContextDev::Internal::AnyHash
            )
          end

        # Public HTTP(S) URL that receives batch completion, failure, or cancellation
        # events.
        sig { returns(String) }
        attr_accessor :url

        # Webhook retry settings. Use {} for the default schedule.
        sig { returns(T.nilable(ContextDev::RetryConfig)) }
        attr_reader :retry_

        sig { params(retry_: ContextDev::RetryConfig::OrHash).void }
        attr_writer :retry_

        # Where to send the batch's final-status event. Omit `retry` for one attempt; `{}`
        # uses the default retry schedule.
        sig do
          params(url: String, retry_: ContextDev::RetryConfig::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # Public HTTP(S) URL that receives batch completion, failure, or cancellation
          # events.
          url:,
          # Webhook retry settings. Use {} for the default schedule.
          retry_: nil
        )
        end

        sig do
          override.returns({ url: String, retry_: ContextDev::RetryConfig })
        end
        def to_hash
        end
      end
    end
  end
end
