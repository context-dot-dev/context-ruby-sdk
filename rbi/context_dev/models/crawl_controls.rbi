# typed: strong

module ContextDev
  module Models
    class CrawlControls < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ContextDev::CrawlControls, ContextDev::Internal::AnyHash)
        end

      # Whether links to subdomains were followed. Always false for a sitemap crawl.
      sig { returns(T::Boolean) }
      attr_accessor :follow_subdomains

      # Link depth limit. Always 0 for a sitemap crawl, which never follows links off
      # its URLs; null when a `start_url` crawl set no limit.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :max_depth

      # The `maxUrls` submitted with the crawl. A sitemap crawl scrapes only the URLs
      # its sitemap actually lists, up to this many, so `input.reserved` is often lower.
      sig { returns(Integer) }
      attr_accessor :max_pages

      # Where the crawl started.
      sig { returns(ContextDev::CrawlControls::Source::Variants) }
      attr_accessor :source

      # RE2 pattern URLs had to match to be crawled. Null when the crawl set none.
      sig { returns(T.nilable(String)) }
      attr_accessor :url_pattern

      # The crawl controls as submitted, so the limits requested can be compared against
      # what the crawl reached.
      sig do
        params(
          follow_subdomains: T::Boolean,
          max_depth: T.nilable(Integer),
          max_pages: Integer,
          source:
            T.any(
              ContextDev::CrawlControls::Source::UnionMember0::OrHash,
              ContextDev::CrawlControls::Source::UnionMember1::OrHash
            ),
          url_pattern: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether links to subdomains were followed. Always false for a sitemap crawl.
        follow_subdomains:,
        # Link depth limit. Always 0 for a sitemap crawl, which never follows links off
        # its URLs; null when a `start_url` crawl set no limit.
        max_depth:,
        # The `maxUrls` submitted with the crawl. A sitemap crawl scrapes only the URLs
        # its sitemap actually lists, up to this many, so `input.reserved` is often lower.
        max_pages:,
        # Where the crawl started.
        source:,
        # RE2 pattern URLs had to match to be crawled. Null when the crawl set none.
        url_pattern:
      )
      end

      sig do
        override.returns(
          {
            follow_subdomains: T::Boolean,
            max_depth: T.nilable(Integer),
            max_pages: Integer,
            source: ContextDev::CrawlControls::Source::Variants,
            url_pattern: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # Where the crawl started.
      module Source
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::CrawlControls::Source::UnionMember0,
              ContextDev::CrawlControls::Source::UnionMember1
            )
          end

        class UnionMember0 < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Source::UnionMember0,
                ContextDev::Internal::AnyHash
              )
            end

          sig do
            returns(
              ContextDev::CrawlControls::Source::UnionMember0::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Page the crawl started from.
          sig { returns(String) }
          attr_accessor :url

          sig do
            params(
              type:
                ContextDev::CrawlControls::Source::UnionMember0::Type::OrSymbol,
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
                  ContextDev::CrawlControls::Source::UnionMember0::Type::TaggedSymbol,
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
                T.all(
                  Symbol,
                  ContextDev::CrawlControls::Source::UnionMember0::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            START_URL =
              T.let(
                :start_url,
                ContextDev::CrawlControls::Source::UnionMember0::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::CrawlControls::Source::UnionMember0::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class UnionMember1 < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::CrawlControls::Source::UnionMember1,
                ContextDev::Internal::AnyHash
              )
            end

          # Domain whose sitemap supplied the pages.
          sig { returns(String) }
          attr_accessor :domain

          sig do
            returns(
              ContextDev::CrawlControls::Source::UnionMember1::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              domain: String,
              type:
                ContextDev::CrawlControls::Source::UnionMember1::Type::OrSymbol
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
                  ContextDev::CrawlControls::Source::UnionMember1::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::CrawlControls::Source::UnionMember1::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SITEMAP =
              T.let(
                :sitemap,
                ContextDev::CrawlControls::Source::UnionMember1::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::CrawlControls::Source::UnionMember1::Type::TaggedSymbol
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
