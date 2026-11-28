# typed: strong

module ContextDev
  module Models
    class NewsSearchResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::NewsSearchResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Articles on this page, in the requested order.
      sig { returns(T::Array[ContextDev::Models::NewsSearchResponse::Data]) }
      attr_accessor :data

      # Whether more results are available after this page.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # Summary of this page.
      sig { returns(ContextDev::Models::NewsSearchResponse::Meta) }
      attr_reader :meta

      sig do
        params(meta: ContextDev::Models::NewsSearchResponse::Meta::OrHash).void
      end
      attr_writer :meta

      # Pass as `cursor` to fetch the next page. `null` on the last page.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(T.nilable(ContextDev::Models::NewsSearchResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::NewsSearchResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data: T::Array[ContextDev::Models::NewsSearchResponse::Data::OrHash],
          has_more: T::Boolean,
          meta: ContextDev::Models::NewsSearchResponse::Meta::OrHash,
          next_cursor: T.nilable(String),
          request_id: String,
          key_metadata:
            ContextDev::Models::NewsSearchResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Articles on this page, in the requested order.
        data:,
        # Whether more results are available after this page.
        has_more:,
        # Summary of this page.
        meta:,
        # Pass as `cursor` to fetch the next page. `null` on the last page.
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
            data: T::Array[ContextDev::Models::NewsSearchResponse::Data],
            has_more: T::Boolean,
            meta: ContextDev::Models::NewsSearchResponse::Meta,
            next_cursor: T.nilable(String),
            request_id: String,
            key_metadata: ContextDev::Models::NewsSearchResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::NewsSearchResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        # Unique ID of the article. It stays the same across requests, so you can use it
        # to deduplicate.
        sig { returns(String) }
        attr_accessor :id

        # Authors named in the byline. Empty when there is no byline.
        sig { returns(T::Array[String]) }
        attr_accessor :authors

        # Summary or excerpt of the article. For natural-language searches, it includes
        # the matching passages, up to 2,000 characters.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # URL of the article's lead image. `null` when there is none.
        sig { returns(T.nilable(String)) }
        attr_accessor :image_url

        # Language of the article, as an ISO 639-1 code such as `en`. `null` when unknown.
        sig { returns(T.nilable(String)) }
        attr_accessor :language

        # How the article relates to the company you searched for. `null` for
        # natural-language searches.
        sig do
          returns(
            T.nilable(ContextDev::Models::NewsSearchResponse::Data::Match)
          )
        end
        attr_reader :match

        sig do
          params(
            match:
              T.nilable(
                ContextDev::Models::NewsSearchResponse::Data::Match::OrHash
              )
          ).void
        end
        attr_writer :match

        # When the article was published. `null` when the publisher does not give a
        # reliable date.
        sig { returns(T.nilable(Time)) }
        attr_accessor :published_at

        # Publication that published the article.
        sig { returns(ContextDev::Models::NewsSearchResponse::Data::Source) }
        attr_reader :source

        sig do
          params(
            source: ContextDev::Models::NewsSearchResponse::Data::Source::OrHash
          ).void
        end
        attr_writer :source

        # ID shared by articles that cover the same story on the same day. Use it to group
        # syndicated copies of one announcement across outlets.
        sig { returns(String) }
        attr_accessor :story_id

        # Headline of the article.
        sig { returns(String) }
        attr_accessor :title

        # Type of coverage. Use it to separate independent reporting (`editorial`) from
        # company-issued content (`press_release`, `regulatory_filing`, `advisory`).
        sig do
          returns(
            ContextDev::Models::NewsSearchResponse::Data::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # URL of the article on the publisher's site.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            id: String,
            authors: T::Array[String],
            description: T.nilable(String),
            image_url: T.nilable(String),
            language: T.nilable(String),
            match:
              T.nilable(
                ContextDev::Models::NewsSearchResponse::Data::Match::OrHash
              ),
            published_at: T.nilable(Time),
            source:
              ContextDev::Models::NewsSearchResponse::Data::Source::OrHash,
            story_id: String,
            title: String,
            type: ContextDev::Models::NewsSearchResponse::Data::Type::OrSymbol,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique ID of the article. It stays the same across requests, so you can use it
          # to deduplicate.
          id:,
          # Authors named in the byline. Empty when there is no byline.
          authors:,
          # Summary or excerpt of the article. For natural-language searches, it includes
          # the matching passages, up to 2,000 characters.
          description:,
          # URL of the article's lead image. `null` when there is none.
          image_url:,
          # Language of the article, as an ISO 639-1 code such as `en`. `null` when unknown.
          language:,
          # How the article relates to the company you searched for. `null` for
          # natural-language searches.
          match:,
          # When the article was published. `null` when the publisher does not give a
          # reliable date.
          published_at:,
          # Publication that published the article.
          source:,
          # ID shared by articles that cover the same story on the same day. Use it to group
          # syndicated copies of one announcement across outlets.
          story_id:,
          # Headline of the article.
          title:,
          # Type of coverage. Use it to separate independent reporting (`editorial`) from
          # company-issued content (`press_release`, `regulatory_filing`, `advisory`).
          type:,
          # URL of the article on the publisher's site.
          url:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              authors: T::Array[String],
              description: T.nilable(String),
              image_url: T.nilable(String),
              language: T.nilable(String),
              match:
                T.nilable(ContextDev::Models::NewsSearchResponse::Data::Match),
              published_at: T.nilable(Time),
              source: ContextDev::Models::NewsSearchResponse::Data::Source,
              story_id: String,
              title: String,
              type:
                ContextDev::Models::NewsSearchResponse::Data::Type::TaggedSymbol,
              url: String
            }
          )
        end
        def to_hash
        end

        class Match < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::NewsSearchResponse::Data::Match,
                ContextDev::Internal::AnyHash
              )
            end

          # Confidence in the match, from 0 to 1. `null` when no score is available.
          sig { returns(T.nilable(Float)) }
          attr_accessor :confidence

          # `primary` when the article is mainly about the company; `secondary` when the
          # company is mentioned but is not the main subject.
          sig do
            returns(
              ContextDev::Models::NewsSearchResponse::Data::Match::Level::TaggedSymbol
            )
          end
          attr_accessor :level

          # How the article relates to the company you searched for. `null` for
          # natural-language searches.
          sig do
            params(
              confidence: T.nilable(Float),
              level:
                ContextDev::Models::NewsSearchResponse::Data::Match::Level::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Confidence in the match, from 0 to 1. `null` when no score is available.
            confidence:,
            # `primary` when the article is mainly about the company; `secondary` when the
            # company is mentioned but is not the main subject.
            level:
          )
          end

          sig do
            override.returns(
              {
                confidence: T.nilable(Float),
                level:
                  ContextDev::Models::NewsSearchResponse::Data::Match::Level::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # `primary` when the article is mainly about the company; `secondary` when the
          # company is mentioned but is not the main subject.
          module Level
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::NewsSearchResponse::Data::Match::Level
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PRIMARY =
              T.let(
                :primary,
                ContextDev::Models::NewsSearchResponse::Data::Match::Level::TaggedSymbol
              )
            SECONDARY =
              T.let(
                :secondary,
                ContextDev::Models::NewsSearchResponse::Data::Match::Level::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::NewsSearchResponse::Data::Match::Level::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Source < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::NewsSearchResponse::Data::Source,
                ContextDev::Internal::AnyHash
              )
            end

          # Whether the article came directly from the publisher's own feed rather than
          # through an aggregator.
          sig { returns(T::Boolean) }
          attr_accessor :direct

          # Website domain of the publication, such as `reuters.com`.
          sig { returns(String) }
          attr_accessor :domain

          # Name of the publication, such as Reuters.
          sig { returns(String) }
          attr_accessor :name

          # Publication that published the article.
          sig do
            params(direct: T::Boolean, domain: String, name: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Whether the article came directly from the publisher's own feed rather than
            # through an aggregator.
            direct:,
            # Website domain of the publication, such as `reuters.com`.
            domain:,
            # Name of the publication, such as Reuters.
            name:
          )
          end

          sig do
            override.returns(
              { direct: T::Boolean, domain: String, name: String }
            )
          end
          def to_hash
          end
        end

        # Type of coverage. Use it to separate independent reporting (`editorial`) from
        # company-issued content (`press_release`, `regulatory_filing`, `advisory`).
        module Type
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::Models::NewsSearchResponse::Data::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EDITORIAL =
            T.let(
              :editorial,
              ContextDev::Models::NewsSearchResponse::Data::Type::TaggedSymbol
            )
          PRESS_RELEASE =
            T.let(
              :press_release,
              ContextDev::Models::NewsSearchResponse::Data::Type::TaggedSymbol
            )
          REGULATORY_FILING =
            T.let(
              :regulatory_filing,
              ContextDev::Models::NewsSearchResponse::Data::Type::TaggedSymbol
            )
          ADVISORY =
            T.let(
              :advisory,
              ContextDev::Models::NewsSearchResponse::Data::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::NewsSearchResponse::Data::Type::TaggedSymbol
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
              ContextDev::Models::NewsSearchResponse::Meta,
              ContextDev::Internal::AnyHash
            )
          end

        # Number of articles on this page.
        sig { returns(Integer) }
        attr_accessor :count

        # Summary of this page.
        sig { params(count: Integer).returns(T.attached_class) }
        def self.new(
          # Number of articles on this page.
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
              ContextDev::Models::NewsSearchResponse::KeyMetadata,
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
