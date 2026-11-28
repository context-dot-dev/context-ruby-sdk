# typed: strong

module ContextDev
  module Models
    class Intake < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ContextDev::Intake, ContextDev::Internal::AnyHash)
        end

      # URLs dropped because another entry resolved to the same page. Sitemap crawls
      # report duplicates too, since sitemaps often list a page more than once.
      sig { returns(Integer) }
      attr_accessor :duplicates

      # URLs rejected as invalid. `null` for a crawl.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :invalid

      # Pages accepted for scraping. `progress` counts toward this total.
      sig { returns(Integer) }
      attr_accessor :reserved

      # `true` when `reserved` is a crawl ceiling, `false` when it is an exact URL
      # count.
      sig { returns(T::Boolean) }
      attr_accessor :reserved_is_ceiling

      # URLs in your list before validation and de-duplication. `null` for a crawl.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :submitted

      # Page counts from your submission.
      sig do
        params(
          duplicates: Integer,
          invalid: T.nilable(Integer),
          reserved: Integer,
          reserved_is_ceiling: T::Boolean,
          submitted: T.nilable(Integer)
        ).returns(T.attached_class)
      end
      def self.new(
        # URLs dropped because another entry resolved to the same page. Sitemap crawls
        # report duplicates too, since sitemaps often list a page more than once.
        duplicates:,
        # URLs rejected as invalid. `null` for a crawl.
        invalid:,
        # Pages accepted for scraping. `progress` counts toward this total.
        reserved:,
        # `true` when `reserved` is a crawl ceiling, `false` when it is an exact URL
        # count.
        reserved_is_ceiling:,
        # URLs in your list before validation and de-duplication. `null` for a crawl.
        submitted:
      )
      end

      sig do
        override.returns(
          {
            duplicates: Integer,
            invalid: T.nilable(Integer),
            reserved: Integer,
            reserved_is_ceiling: T::Boolean,
            submitted: T.nilable(Integer)
          }
        )
      end
      def to_hash
      end
    end
  end
end
