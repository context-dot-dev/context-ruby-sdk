# typed: strong

module ContextDev
  module Models
    class CrawlControls < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ContextDev::CrawlControls, ContextDev::Internal::AnyHash)
        end

      # Matchers for the pages the crawl skipped. `null` when it skipped none.
      sig do
        returns(
          T.nilable(T::Array[ContextDev::CrawlControls::Exclude::Variants])
        )
      end
      attr_accessor :exclude

      # Regex that excluded matching URLs from the crawl. `null` when the crawl set
      # none.
      sig { returns(T.nilable(String)) }
      attr_accessor :exclude_url_pattern

      # Matchers for the links the crawl followed. `null` when it followed every link.
      sig do
        returns(
          T.nilable(T::Array[ContextDev::CrawlControls::Follow::Variants])
        )
      end
      attr_accessor :follow

      # Whether links to subdomains were followed. Always `false` for a sitemap crawl.
      sig { returns(T::Boolean) }
      attr_accessor :follow_subdomains

      # Languages whose pages were followed. `null` when all languages were.
      sig { returns(T.nilable(ContextDev::CrawlControls::Languages::Variants)) }
      attr_accessor :languages

      # Maximum link depth. Always `0` for a sitemap crawl; `null` when a `start_url`
      # crawl set no limit.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_depth

      # The `maxUrls` submitted with the crawl. A sitemap crawl scrapes only the URLs
      # its sitemap lists, up to this many, so `input.reserved` can be lower.
      sig { returns(Integer) }
      attr_accessor :max_pages

      # Matchers for the pages the crawl returned. `null` when it returned every fetched
      # page.
      sig do
        returns(
          T.nilable(T::Array[ContextDev::CrawlControls::Scrape::Variants])
        )
      end
      attr_accessor :scrape

      # Where the crawl started.
      sig { returns(ContextDev::CrawlControls::Source::Variants) }
      attr_accessor :source

      # Regex that URLs had to match to be crawled. `null` when the crawl set none.
      sig { returns(T.nilable(String)) }
      attr_accessor :url_pattern

      # Crawl settings as submitted.
      sig do
        params(
          exclude:
            T.nilable(
              T::Array[
                T.any(
                  ContextDev::CrawlControls::Exclude::Regex::OrHash,
                  ContextDev::CrawlControls::Exclude::Product::OrHash
                )
              ]
            ),
          exclude_url_pattern: T.nilable(String),
          follow:
            T.nilable(
              T::Array[
                T.any(
                  ContextDev::CrawlControls::Follow::Regex::OrHash,
                  ContextDev::CrawlControls::Follow::Pagination::OrHash,
                  ContextDev::CrawlControls::Follow::Product::OrHash
                )
              ]
            ),
          follow_subdomains: T::Boolean,
          languages:
            T.nilable(
              T.any(
                ContextDev::CrawlControls::Languages::OrSymbol,
                T::Array[
                  ContextDev::CrawlControls::Languages::UnionMember1::OrSymbol
                ]
              )
            ),
          max_depth: T.nilable(Integer),
          max_pages: Integer,
          scrape:
            T.nilable(
              T::Array[
                T.any(
                  ContextDev::CrawlControls::Scrape::Regex::OrHash,
                  ContextDev::CrawlControls::Scrape::Product::OrHash
                )
              ]
            ),
          source:
            T.any(
              ContextDev::CrawlControls::Source::StartURL::OrHash,
              ContextDev::CrawlControls::Source::Sitemap::OrHash
            ),
          url_pattern: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Matchers for the pages the crawl skipped. `null` when it skipped none.
        exclude:,
        # Regex that excluded matching URLs from the crawl. `null` when the crawl set
        # none.
        exclude_url_pattern:,
        # Matchers for the links the crawl followed. `null` when it followed every link.
        follow:,
        # Whether links to subdomains were followed. Always `false` for a sitemap crawl.
        follow_subdomains:,
        # Languages whose pages were followed. `null` when all languages were.
        languages:,
        # Maximum link depth. Always `0` for a sitemap crawl; `null` when a `start_url`
        # crawl set no limit.
        max_depth:,
        # The `maxUrls` submitted with the crawl. A sitemap crawl scrapes only the URLs
        # its sitemap lists, up to this many, so `input.reserved` can be lower.
        max_pages:,
        # Matchers for the pages the crawl returned. `null` when it returned every fetched
        # page.
        scrape:,
        # Where the crawl started.
        source:,
        # Regex that URLs had to match to be crawled. `null` when the crawl set none.
        url_pattern:
      )
      end

      sig do
        override.returns(
          {
            exclude:
              T.nilable(T::Array[ContextDev::CrawlControls::Exclude::Variants]),
            exclude_url_pattern: T.nilable(String),
            follow:
              T.nilable(T::Array[ContextDev::CrawlControls::Follow::Variants]),
            follow_subdomains: T::Boolean,
            languages:
              T.nilable(ContextDev::CrawlControls::Languages::Variants),
            max_depth: T.nilable(Integer),
            max_pages: Integer,
            scrape:
              T.nilable(T::Array[ContextDev::CrawlControls::Scrape::Variants]),
            source: ContextDev::CrawlControls::Source::Variants,
            url_pattern: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Selects pages by URL pattern or by kind of page.
      module Exclude
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::CrawlControls::Exclude::Regex,
              ContextDev::CrawlControls::Exclude::Product
            )
          end

        class Regex < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Exclude::Regex,
                ContextDev::Internal::AnyHash
              )
            end

          # Match pages by URL pattern.
          sig { returns(Symbol) }
          attr_accessor :kind

          # Regular expression matched against the page URL.
          sig { returns(String) }
          attr_accessor :pattern

          # Pages whose URL matches a regex pattern.
          sig do
            params(pattern: String, kind: Symbol).returns(T.attached_class)
          end
          def self.new(
            # Regular expression matched against the page URL.
            pattern:,
            # Match pages by URL pattern.
            kind: :regex
          )
          end

          sig { override.returns({ kind: Symbol, pattern: String }) }
          def to_hash
          end
        end

        class Product < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Exclude::Product,
                ContextDev::Internal::AnyHash
              )
            end

          # Match product detail pages.
          sig { returns(Symbol) }
          attr_accessor :kind

          # Product detail pages.
          sig { params(kind: Symbol).returns(T.attached_class) }
          def self.new(
            # Match product detail pages.
            kind: :product
          )
          end

          sig { override.returns({ kind: Symbol }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::CrawlControls::Exclude::Variants]
          )
        end
        def self.variants
        end
      end

      # Selects links by URL pattern, by kind of page, or as the next page of a list.
      module Follow
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::CrawlControls::Follow::Regex,
              ContextDev::CrawlControls::Follow::Pagination,
              ContextDev::CrawlControls::Follow::Product
            )
          end

        class Regex < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Follow::Regex,
                ContextDev::Internal::AnyHash
              )
            end

          # Match pages by URL pattern.
          sig { returns(Symbol) }
          attr_accessor :kind

          # Regular expression matched against the page URL.
          sig { returns(String) }
          attr_accessor :pattern

          # Pages whose URL matches a regex pattern.
          sig do
            params(pattern: String, kind: Symbol).returns(T.attached_class)
          end
          def self.new(
            # Regular expression matched against the page URL.
            pattern:,
            # Match pages by URL pattern.
            kind: :regex
          )
          end

          sig { override.returns({ kind: Symbol, pattern: String }) }
          def to_hash
          end
        end

        class Pagination < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Follow::Pagination,
                ContextDev::Internal::AnyHash
              )
            end

          # Match the further pages of a paginated list.
          sig { returns(Symbol) }
          attr_accessor :kind

          # Further pages of a paginated list, such as page 2 of a catalog.
          sig { params(kind: Symbol).returns(T.attached_class) }
          def self.new(
            # Match the further pages of a paginated list.
            kind: :pagination
          )
          end

          sig { override.returns({ kind: Symbol }) }
          def to_hash
          end
        end

        class Product < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Follow::Product,
                ContextDev::Internal::AnyHash
              )
            end

          # Match product detail pages.
          sig { returns(Symbol) }
          attr_accessor :kind

          # Product detail pages.
          sig { params(kind: Symbol).returns(T.attached_class) }
          def self.new(
            # Match product detail pages.
            kind: :product
          )
          end

          sig { override.returns({ kind: Symbol }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::CrawlControls::Follow::Variants]
          )
        end
        def self.variants
        end
      end

      # Languages whose pages were followed. `null` when all languages were.
      module Languages
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::CrawlControls::Languages::TaggedSymbol,
              T::Array[
                ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
              ]
            )
          end

        module UnionMember1
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::CrawlControls::Languages::UnionMember1)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AM =
            T.let(
              :am,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          AR =
            T.let(
              :ar,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          AZ =
            T.let(
              :az,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          BE =
            T.let(
              :be,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          BG =
            T.let(
              :bg,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          BN =
            T.let(
              :bn,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          CA =
            T.let(
              :ca,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          CEB =
            T.let(
              :ceb,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          CS =
            T.let(
              :cs,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          CY =
            T.let(
              :cy,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          DA =
            T.let(
              :da,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          DE =
            T.let(
              :de,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          EL =
            T.let(
              :el,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          EN =
            T.let(
              :en,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          ES =
            T.let(
              :es,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          ET =
            T.let(
              :et,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          EU =
            T.let(
              :eu,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          FA =
            T.let(
              :fa,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          FI =
            T.let(
              :fi,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          FR =
            T.let(
              :fr,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          GU =
            T.let(
              :gu,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          HA =
            T.let(
              :ha,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          HAW =
            T.let(
              :haw,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          HE =
            T.let(
              :he,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          HI =
            T.let(
              :hi,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          HR =
            T.let(
              :hr,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          HU =
            T.let(
              :hu,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          HY =
            T.let(
              :hy,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          ID =
            T.let(
              :id,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          IS =
            T.let(
              :is,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          IT =
            T.let(
              :it,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          JA =
            T.let(
              :ja,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          KA =
            T.let(
              :ka,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          KK =
            T.let(
              :kk,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          KN =
            T.let(
              :kn,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          KO =
            T.let(
              :ko,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          KU =
            T.let(
              :ku,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          KY =
            T.let(
              :ky,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          LO =
            T.let(
              :lo,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          LT =
            T.let(
              :lt,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          LV =
            T.let(
              :lv,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          MK =
            T.let(
              :mk,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          ML =
            T.let(
              :ml,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          MN =
            T.let(
              :mn,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          MR =
            T.let(
              :mr,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          MS =
            T.let(
              :ms,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          NE =
            T.let(
              :ne,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          NL =
            T.let(
              :nl,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          NO =
            T.let(
              :no,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          OR =
            T.let(
              :or,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          PA =
            T.let(
              :pa,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          PL =
            T.let(
              :pl,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          PS =
            T.let(
              :ps,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          PT =
            T.let(
              :pt,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          RO =
            T.let(
              :ro,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          RU =
            T.let(
              :ru,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          SK =
            T.let(
              :sk,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          SL =
            T.let(
              :sl,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          SO =
            T.let(
              :so,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          SQ =
            T.let(
              :sq,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          SR =
            T.let(
              :sr,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          SV =
            T.let(
              :sv,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          SW =
            T.let(
              :sw,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          TA =
            T.let(
              :ta,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          TE =
            T.let(
              :te,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          TH =
            T.let(
              :th,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          TL =
            T.let(
              :tl,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          TR =
            T.let(
              :tr,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          UK =
            T.let(
              :uk,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          UR =
            T.let(
              :ur,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          UZ =
            T.let(
              :uz,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          VI =
            T.let(
              :vi,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          YO =
            T.let(
              :yo,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )
          ZH =
            T.let(
              :zh,
              ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::CrawlControls::Languages::UnionMember1::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::CrawlControls::Languages::Variants]
          )
        end
        def self.variants
        end

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::CrawlControls::Languages) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SAME_AS_START_URL =
          T.let(
            :same_as_start_url,
            ContextDev::CrawlControls::Languages::TaggedSymbol
          )

        UnionMember1Array =
          T.let(
            ContextDev::Internal::Type::ArrayOf[
              enum: ContextDev::CrawlControls::Languages::UnionMember1
            ],
            ContextDev::Internal::Type::Converter
          )
      end

      # Selects pages by URL pattern or by kind of page.
      module Scrape
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::CrawlControls::Scrape::Regex,
              ContextDev::CrawlControls::Scrape::Product
            )
          end

        class Regex < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Scrape::Regex,
                ContextDev::Internal::AnyHash
              )
            end

          # Match pages by URL pattern.
          sig { returns(Symbol) }
          attr_accessor :kind

          # Regular expression matched against the page URL.
          sig { returns(String) }
          attr_accessor :pattern

          # Pages whose URL matches a regex pattern.
          sig do
            params(pattern: String, kind: Symbol).returns(T.attached_class)
          end
          def self.new(
            # Regular expression matched against the page URL.
            pattern:,
            # Match pages by URL pattern.
            kind: :regex
          )
          end

          sig { override.returns({ kind: Symbol, pattern: String }) }
          def to_hash
          end
        end

        class Product < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Scrape::Product,
                ContextDev::Internal::AnyHash
              )
            end

          # Match product detail pages.
          sig { returns(Symbol) }
          attr_accessor :kind

          # Product detail pages.
          sig { params(kind: Symbol).returns(T.attached_class) }
          def self.new(
            # Match product detail pages.
            kind: :product
          )
          end

          sig { override.returns({ kind: Symbol }) }
          def to_hash
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::CrawlControls::Scrape::Variants]
          )
        end
        def self.variants
        end
      end

      # Where the crawl started.
      module Source
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::CrawlControls::Source::StartURL,
              ContextDev::CrawlControls::Source::Sitemap
            )
          end

        class StartURL < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Source::StartURL,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::CrawlControls::Source::StartURL::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Page the crawl started from.
          sig { returns(String) }
          attr_accessor :url

          # The crawl discovered pages by following links from one URL.
          sig do
            params(
              type: ContextDev::CrawlControls::Source::StartURL::Type::OrSymbol,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            type:,
            # Page the crawl started from.
            url:
          )
          end

          sig do
            override.returns(
              {
                type:
                  ContextDev::CrawlControls::Source::StartURL::Type::TaggedSymbol,
                url: String
              }
            )
          end
          def to_hash
          end

          module Type
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, ContextDev::CrawlControls::Source::StartURL::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            START_URL =
              T.let(
                :start_url,
                ContextDev::CrawlControls::Source::StartURL::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::CrawlControls::Source::StartURL::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Sitemap < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Source::Sitemap,
                ContextDev::Internal::AnyHash
              )
            end

          # Domain whose sitemap supplied the pages.
          sig { returns(String) }
          attr_accessor :domain

          sig do
            returns(
              ContextDev::CrawlControls::Source::Sitemap::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The crawl scraped the pages listed in the domain's sitemap.
          sig do
            params(
              domain: String,
              type: ContextDev::CrawlControls::Source::Sitemap::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Domain whose sitemap supplied the pages.
            domain:,
            type:
          )
          end

          sig do
            override.returns(
              {
                domain: String,
                type:
                  ContextDev::CrawlControls::Source::Sitemap::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, ContextDev::CrawlControls::Source::Sitemap::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SITEMAP =
              T.let(
                :sitemap,
                ContextDev::CrawlControls::Source::Sitemap::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::CrawlControls::Source::Sitemap::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[ContextDev::CrawlControls::Source::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
