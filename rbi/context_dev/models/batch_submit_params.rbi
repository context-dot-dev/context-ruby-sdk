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
                ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML
              )
            )
          end
          attr_accessor :data

          # Scrape the pages in `data.urls`.
          sig { returns(Symbol) }
          attr_accessor :mode

          # Scrape a list of up to 25,000 URLs.
          sig do
            params(
              data:
                T.any(
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::OrHash,
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::OrHash
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
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML
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
                  ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML
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
              sig { returns(Symbol) }
              attr_accessor :format_

              # Pages to scrape. Maximum 25000.
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
                  urls:
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::URL::OrHash
                    ],
                  options:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::Markdown::Options::OrHash,
                  format_: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Pages to scrape. Maximum 25000.
                urls:,
                # Options for Markdown output.
                options: nil,
                # Return page content as Markdown.
                format_: :markdown
              )
              end

              sig do
                override.returns(
                  {
                    format_: Symbol,
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

                # Include image references in the Markdown.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_images

                sig { params(include_images: T::Boolean).void }
                attr_writer :include_images

                # Include links in the Markdown.
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

                # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                # detection/OCR to an inclusive 1-based page range.
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

                # Shorten inline base64 image data.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :shorten_base64_images

                sig { params(shorten_base64_images: T::Boolean).void }
                attr_writer :shorten_base64_images

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
                  # Include image references in the Markdown.
                  include_images: nil,
                  # Include links in the Markdown.
                  include_links: nil,
                  # Keep only elements matching these CSS selectors. Filtered pages ignore
                  # `maxAgeMs`.
                  include_selectors: nil,
                  # Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                  # year (31536000000 ms). `0` fetches fresh.
                  max_age_ms: nil,
                  # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  # detection/OCR to an inclusive 1-based page range.
                  pdf: nil,
                  # Wait for CSS animations to finish before extracting, on browser-rendered pages.
                  settle_animations: nil,
                  # Shorten inline base64 image data.
                  shorten_base64_images: nil,
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

                  # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                  # Must be greater than or equal to start when both are provided.
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

                  # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :start

                  sig { params(start: Integer).void }
                  attr_writer :start

                  # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  # detection/OCR to an inclusive 1-based page range.
                  sig do
                    params(
                      end_: Integer,
                      ocr: T::Boolean,
                      should_parse: T::Boolean,
                      start: Integer
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                    # Must be greater than or equal to start when both are provided.
                    end_: nil,
                    # Read scanned PDF pages with OCR; preserve pages that already have text.
                    ocr: nil,
                    # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                    should_parse: nil,
                    # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
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

            class HTML < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Return page content as HTML.
              sig { returns(Symbol) }
              attr_accessor :format_

              # Pages to scrape. Maximum 25000.
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
                  urls:
                    T::Array[
                      ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::URL::OrHash
                    ],
                  options:
                    ContextDev::BatchSubmitParams::Input::Scrape::Data::HTML::Options::OrHash,
                  format_: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # Pages to scrape. Maximum 25000.
                urls:,
                # Options for HTML output.
                options: nil,
                # Return page content as HTML.
                format_: :html
              )
              end

              sig do
                override.returns(
                  {
                    format_: Symbol,
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

                # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                # detection/OCR to an inclusive 1-based page range.
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
                  # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  # detection/OCR to an inclusive 1-based page range.
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

                  # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                  # Must be greater than or equal to start when both are provided.
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

                  # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :start

                  sig { params(start: Integer).void }
                  attr_writer :start

                  # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  # detection/OCR to an inclusive 1-based page range.
                  sig do
                    params(
                      end_: Integer,
                      ocr: T::Boolean,
                      should_parse: T::Boolean,
                      start: Integer
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                    # Must be greater than or equal to start when both are provided.
                    end_: nil,
                    # Read scanned PDF pages with OCR; preserve pages that already have text.
                    ocr: nil,
                    # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                    should_parse: nil,
                    # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
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
                ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML
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
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::OrHash
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
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML
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
                  ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML
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
              sig { returns(Symbol) }
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
                  source:
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::StartURL::OrHash,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Source::Sitemap::OrHash
                    ),
                  options:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::Markdown::Options::OrHash,
                  format_: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # How to find pages to crawl.
                source:,
                # Options for Markdown output.
                options: nil,
                # Return page content as Markdown.
                format_: :markdown
              )
              end

              sig do
                override.returns(
                  {
                    format_: Symbol,
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

                    # Follow links to subdomains.
                    sig { returns(T.nilable(T::Boolean)) }
                    attr_reader :follow_subdomains

                    sig { params(follow_subdomains: T::Boolean).void }
                    attr_writer :follow_subdomains

                    # Maximum link depth. Source pages are depth 0. No limit when omitted.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_depth

                    sig { params(max_depth: Integer).void }
                    attr_writer :max_depth

                    # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_urls

                    sig { params(max_urls: Integer).void }
                    attr_writer :max_urls

                    # RE2 pattern for URLs to include. The `start_url` itself is always included.
                    sig { returns(T.nilable(String)) }
                    attr_reader :regex

                    sig { params(regex: String).void }
                    attr_writer :regex

                    # Limits and filters for page discovery.
                    sig do
                      params(
                        follow_subdomains: T::Boolean,
                        max_depth: Integer,
                        max_urls: Integer,
                        regex: String
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Follow links to subdomains.
                      follow_subdomains: nil,
                      # Maximum link depth. Source pages are depth 0. No limit when omitted.
                      max_depth: nil,
                      # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                      max_urls: nil,
                      # RE2 pattern for URLs to include. The `start_url` itself is always included.
                      regex: nil
                    )
                    end

                    sig do
                      override.returns(
                        {
                          follow_subdomains: T::Boolean,
                          max_depth: Integer,
                          max_urls: Integer,
                          regex: String
                        }
                      )
                    end
                    def to_hash
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

                    # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_urls

                    sig { params(max_urls: Integer).void }
                    attr_writer :max_urls

                    # RE2 pattern; only sitemap URLs matching it are scraped.
                    sig { returns(T.nilable(String)) }
                    attr_reader :regex

                    sig { params(regex: String).void }
                    attr_writer :regex

                    # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    # URLs and never follows links off them, so there is no crawl depth here.
                    sig do
                      params(max_urls: Integer, regex: String).returns(
                        T.attached_class
                      )
                    end
                    def self.new(
                      # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                      max_urls: nil,
                      # RE2 pattern; only sitemap URLs matching it are scraped.
                      regex: nil
                    )
                    end

                    sig do
                      override.returns({ max_urls: Integer, regex: String })
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

                # Include image references in the Markdown.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :include_images

                sig { params(include_images: T::Boolean).void }
                attr_writer :include_images

                # Include links in the Markdown.
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

                # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                # detection/OCR to an inclusive 1-based page range.
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

                # Shorten inline base64 image data.
                sig { returns(T.nilable(T::Boolean)) }
                attr_reader :shorten_base64_images

                sig { params(shorten_base64_images: T::Boolean).void }
                attr_writer :shorten_base64_images

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
                  # Include image references in the Markdown.
                  include_images: nil,
                  # Include links in the Markdown.
                  include_links: nil,
                  # Keep only elements matching these CSS selectors. Filtered pages ignore
                  # `maxAgeMs`.
                  include_selectors: nil,
                  # Maximum cache age in milliseconds. Defaults to 3 days (259200000 ms). Maximum: 1
                  # year (31536000000 ms). `0` fetches fresh.
                  max_age_ms: nil,
                  # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  # detection/OCR to an inclusive 1-based page range.
                  pdf: nil,
                  # Wait for CSS animations to finish before extracting, on browser-rendered pages.
                  settle_animations: nil,
                  # Shorten inline base64 image data.
                  shorten_base64_images: nil,
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

                  # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                  # Must be greater than or equal to start when both are provided.
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

                  # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :start

                  sig { params(start: Integer).void }
                  attr_writer :start

                  # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  # detection/OCR to an inclusive 1-based page range.
                  sig do
                    params(
                      end_: Integer,
                      ocr: T::Boolean,
                      should_parse: T::Boolean,
                      start: Integer
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                    # Must be greater than or equal to start when both are provided.
                    end_: nil,
                    # Read scanned PDF pages with OCR; preserve pages that already have text.
                    ocr: nil,
                    # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                    should_parse: nil,
                    # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
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

            class HTML < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Return page content as HTML.
              sig { returns(Symbol) }
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
                  source:
                    T.any(
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::StartURL::OrHash,
                      ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Source::Sitemap::OrHash
                    ),
                  options:
                    ContextDev::BatchSubmitParams::Input::Crawl::Data::HTML::Options::OrHash,
                  format_: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # How to find pages to crawl.
                source:,
                # Options for HTML output.
                options: nil,
                # Return page content as HTML.
                format_: :html
              )
              end

              sig do
                override.returns(
                  {
                    format_: Symbol,
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

                    # Follow links to subdomains.
                    sig { returns(T.nilable(T::Boolean)) }
                    attr_reader :follow_subdomains

                    sig { params(follow_subdomains: T::Boolean).void }
                    attr_writer :follow_subdomains

                    # Maximum link depth. Source pages are depth 0. No limit when omitted.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_depth

                    sig { params(max_depth: Integer).void }
                    attr_writer :max_depth

                    # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_urls

                    sig { params(max_urls: Integer).void }
                    attr_writer :max_urls

                    # RE2 pattern for URLs to include. The `start_url` itself is always included.
                    sig { returns(T.nilable(String)) }
                    attr_reader :regex

                    sig { params(regex: String).void }
                    attr_writer :regex

                    # Limits and filters for page discovery.
                    sig do
                      params(
                        follow_subdomains: T::Boolean,
                        max_depth: Integer,
                        max_urls: Integer,
                        regex: String
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Follow links to subdomains.
                      follow_subdomains: nil,
                      # Maximum link depth. Source pages are depth 0. No limit when omitted.
                      max_depth: nil,
                      # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                      max_urls: nil,
                      # RE2 pattern for URLs to include. The `start_url` itself is always included.
                      regex: nil
                    )
                    end

                    sig do
                      override.returns(
                        {
                          follow_subdomains: T::Boolean,
                          max_depth: Integer,
                          max_urls: Integer,
                          regex: String
                        }
                      )
                    end
                    def to_hash
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

                    # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                    sig { returns(T.nilable(Integer)) }
                    attr_reader :max_urls

                    sig { params(max_urls: Integer).void }
                    attr_writer :max_urls

                    # RE2 pattern; only sitemap URLs matching it are scraped.
                    sig { returns(T.nilable(String)) }
                    attr_reader :regex

                    sig { params(regex: String).void }
                    attr_writer :regex

                    # Limits and filters for the sitemap URLs. A sitemap batch scrapes exactly those
                    # URLs and never follows links off them, so there is no crawl depth here.
                    sig do
                      params(max_urls: Integer, regex: String).returns(
                        T.attached_class
                      )
                    end
                    def self.new(
                      # Maximum pages to fetch. Unused reserved credits are refunded. Maximum 25000.
                      max_urls: nil,
                      # RE2 pattern; only sitemap URLs matching it are scraped.
                      regex: nil
                    )
                    end

                    sig do
                      override.returns({ max_urls: Integer, regex: String })
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

                # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                # detection/OCR to an inclusive 1-based page range.
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
                  # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  # detection/OCR to an inclusive 1-based page range.
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

                  # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                  # Must be greater than or equal to start when both are provided.
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

                  # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
                  sig { returns(T.nilable(Integer)) }
                  attr_reader :start

                  sig { params(start: Integer).void }
                  attr_writer :start

                  # PDF parsing controls. Use start/end to limit text extraction and embedded-image
                  # detection/OCR to an inclusive 1-based page range.
                  sig do
                    params(
                      end_: Integer,
                      ocr: T::Boolean,
                      should_parse: T::Boolean,
                      start: Integer
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
                    # Must be greater than or equal to start when both are provided.
                    end_: nil,
                    # Read scanned PDF pages with OCR; preserve pages that already have text.
                    ocr: nil,
                    # Parse PDF URLs. When false, PDFs fail with `PDF_SKIPPED`.
                    should_parse: nil,
                    # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
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
