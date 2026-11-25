# typed: strong

module ContextDev
  module Models
    class ScholarSearchResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::ScholarSearchResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Matching papers in the requested order.
      sig { returns(T::Array[ContextDev::Models::ScholarSearchResponse::Data]) }
      attr_accessor :data

      # Whether another page is available.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # Page summary.
      sig { returns(ContextDev::Models::ScholarSearchResponse::Meta) }
      attr_reader :meta

      sig do
        params(
          meta: ContextDev::Models::ScholarSearchResponse::Meta::OrHash
        ).void
      end
      attr_writer :meta

      # Cursor for the next page, or null on the last page.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(ContextDev::Models::ScholarSearchResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::ScholarSearchResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data:
            T::Array[ContextDev::Models::ScholarSearchResponse::Data::OrHash],
          has_more: T::Boolean,
          meta: ContextDev::Models::ScholarSearchResponse::Meta::OrHash,
          next_cursor: T.nilable(String),
          request_id: String,
          key_metadata:
            ContextDev::Models::ScholarSearchResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Matching papers in the requested order.
        data:,
        # Whether another page is available.
        has_more:,
        # Page summary.
        meta:,
        # Cursor for the next page, or null on the last page.
        next_cursor:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            data: T::Array[ContextDev::Models::ScholarSearchResponse::Data],
            has_more: T::Boolean,
            meta: ContextDev::Models::ScholarSearchResponse::Meta,
            next_cursor: T.nilable(String),
            request_id: String,
            key_metadata: ContextDev::Models::ScholarSearchResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::ScholarSearchResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        # Stable paper identifier.
        sig { returns(String) }
        attr_accessor :id

        # Format of the linked full text. jats is XML.
        sig do
          returns(
            ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat::TaggedSymbol
          )
        end
        attr_accessor :full_text_format

        # Direct link to the full text.
        sig { returns(String) }
        attr_accessor :full_text_url

        # Publication time in ISO 8601, or null when unknown.
        sig { returns(T.nilable(Time)) }
        attr_accessor :published_at

        # Matching passage, or opening passage for an ID-only query.
        sig { returns(String) }
        attr_accessor :snippet

        # Paper title.
        sig { returns(String) }
        attr_accessor :title

        # Paper landing page.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            id: String,
            full_text_format:
              ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat::OrSymbol,
            full_text_url: String,
            published_at: T.nilable(Time),
            snippet: String,
            title: String,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Stable paper identifier.
          id:,
          # Format of the linked full text. jats is XML.
          full_text_format:,
          # Direct link to the full text.
          full_text_url:,
          # Publication time in ISO 8601, or null when unknown.
          published_at:,
          # Matching passage, or opening passage for an ID-only query.
          snippet:,
          # Paper title.
          title:,
          # Paper landing page.
          url:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              full_text_format:
                ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat::TaggedSymbol,
              full_text_url: String,
              published_at: T.nilable(Time),
              snippet: String,
              title: String,
              url: String
            }
          )
        end
        def to_hash
        end

        # Format of the linked full text. jats is XML.
        module FullTextFormat
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PDF =
            T.let(
              :pdf,
              ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat::TaggedSymbol
            )
          HTML =
            T.let(
              :html,
              ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat::TaggedSymbol
            )
          JATS =
            T.let(
              :jats,
              ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::ScholarSearchResponse::Data::FullTextFormat::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Meta < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::ScholarSearchResponse::Meta,
              ContextDev::Internal::AnyHash
            )
          end

        # Papers in this page.
        sig { returns(Integer) }
        attr_accessor :count

        # Page summary.
        sig { params(count: Integer).returns(T.attached_class) }
        def self.new(
          # Papers in this page.
          count:
        )
        end

        sig { override.returns({ count: Integer }) }
        def to_hash
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::ScholarSearchResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
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
