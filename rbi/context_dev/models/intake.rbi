# typed: strong

module ContextDev
  module Models
    class Intake < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ContextDev::Intake, ContextDev::Internal::AnyHash)
        end

      # URLs dropped before reserving because another entry resolved to the same page.
      # Non-zero for sitemap crawls too, whose sitemaps routinely list a page more than
      # once.
      sig { returns(Integer) }
      attr_accessor :duplicates

      # Rejected input URLs; `null` for a crawl.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :invalid

      # Pages accepted; progress counts toward this total.
      sig { returns(Integer) }
      attr_accessor :reserved

      # True when `reserved` is a crawl ceiling; false when it is an exact URL count.
      sig { returns(T::Boolean) }
      attr_accessor :reserved_is_ceiling

      # URLs in the list you sent, before validation and de-duplication. Null for a
      # crawl, which is given a source rather than a list.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :submitted

      # What the submission accepted.
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
        # URLs dropped before reserving because another entry resolved to the same page.
        # Non-zero for sitemap crawls too, whose sitemaps routinely list a page more than
        # once.
        duplicates:,
        # Rejected input URLs; `null` for a crawl.
        invalid:,
        # Pages accepted; progress counts toward this total.
        reserved:,
        # True when `reserved` is a crawl ceiling; false when it is an exact URL count.
        reserved_is_ceiling:,
        # URLs in the list you sent, before validation and de-duplication. Null for a
        # crawl, which is given a source rather than a list.
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
