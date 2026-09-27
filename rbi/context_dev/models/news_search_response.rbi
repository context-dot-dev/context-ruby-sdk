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

      # Articles matching the search, in the requested order.
      sig { returns(T::Array[ContextDev::Models::NewsSearchResponse::Data]) }
      attr_accessor :data

      # True when more results are available beyond this page.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # Summary information about this response.
      sig { returns(ContextDev::Models::NewsSearchResponse::Meta) }
      attr_reader :meta

      sig do
        params(meta: ContextDev::Models::NewsSearchResponse::Meta::OrHash).void
      end
      attr_writer :meta

      # Pass as cursor in the next request to fetch the following page. Null when there
      # are no more results.
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
        # Articles matching the search, in the requested order.
        data:,
        # True when more results are available beyond this page.
        has_more:,
        # Summary information about this response.
        meta:,
        # Pass as cursor in the next request to fetch the following page. Null when there
        # are no more results.
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

        # Stable unique identifier for this article. Use it to deduplicate or reference an
        # article across requests.
        sig { returns(String) }
        attr_accessor :id

        # Bylined authors. Empty when no byline is available.
        sig { returns(T::Array[String]) }
        attr_accessor :authors

        # Short summary or excerpt of the article, when the publisher provides one.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # Lead image for the article, when one is available.
        sig { returns(T.nilable(String)) }
        attr_accessor :image_url

        # Language the article is written in, as a lowercase ISO 639-1 code such as en.
        # Null when unknown.
        sig { returns(T.nilable(String)) }
        attr_accessor :language

        # How the article relates to the company you searched for.
        sig { returns(ContextDev::Models::NewsSearchResponse::Data::Match) }
        attr_reader :match

        sig do
          params(
            match: ContextDev::Models::NewsSearchResponse::Data::Match::OrHash
          ).void
        end
        attr_writer :match

        # When the article was published, as an ISO 8601 timestamp. Null when the
        # publisher does not state a reliable date.
        sig { returns(T.nilable(Time)) }
        attr_accessor :published_at

        # The publication that published the article.
        sig { returns(ContextDev::Models::NewsSearchResponse::Data::Source) }
        attr_reader :source

        sig do
          params(
            source: ContextDev::Models::NewsSearchResponse::Data::Source::OrHash
          ).void
        end
        attr_writer :source

        # Shared by articles covering the same story on the same day. Use it to group or
        # collapse syndicated copies of one announcement across outlets.
        sig { returns(String) }
        attr_accessor :story_id

        # Article headline.
        sig { returns(String) }
        attr_accessor :title

        # Kind of coverage. Use it to separate independent reporting (editorial) from
        # company-issued content (press_release, regulatory_filing, advisory).
        sig do
          returns(
            ContextDev::Models::NewsSearchResponse::Data::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Link to the article on the publisher site.
        sig { returns(String) }
        attr_accessor :url

        sig do
          params(
            id: String,
            authors: T::Array[String],
            description: T.nilable(String),
            image_url: T.nilable(String),
            language: T.nilable(String),
            match: ContextDev::Models::NewsSearchResponse::Data::Match::OrHash,
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
          # Stable unique identifier for this article. Use it to deduplicate or reference an
          # article across requests.
          id:,
          # Bylined authors. Empty when no byline is available.
          authors:,
          # Short summary or excerpt of the article, when the publisher provides one.
          description:,
          # Lead image for the article, when one is available.
          image_url:,
          # Language the article is written in, as a lowercase ISO 639-1 code such as en.
          # Null when unknown.
          language:,
          # How the article relates to the company you searched for.
          match:,
          # When the article was published, as an ISO 8601 timestamp. Null when the
          # publisher does not state a reliable date.
          published_at:,
          # The publication that published the article.
          source:,
          # Shared by articles covering the same story on the same day. Use it to group or
          # collapse syndicated copies of one announcement across outlets.
          story_id:,
          # Article headline.
          title:,
          # Kind of coverage. Use it to separate independent reporting (editorial) from
          # company-issued content (press_release, regulatory_filing, advisory).
          type:,
          # Link to the article on the publisher site.
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
              match: ContextDev::Models::NewsSearchResponse::Data::Match,
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

          # How confident the match is, from 0 to 1. Null when a score is unavailable.
          sig { returns(T.nilable(Float)) }
          attr_accessor :confidence

          # primary when the article is mainly about the company, secondary when the company
          # is mentioned but is not the main subject.
          sig do
            returns(
              ContextDev::Models::NewsSearchResponse::Data::Match::Level::TaggedSymbol
            )
          end
          attr_accessor :level

          # How the article relates to the company you searched for.
          sig do
            params(
              confidence: T.nilable(Float),
              level:
                ContextDev::Models::NewsSearchResponse::Data::Match::Level::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # How confident the match is, from 0 to 1. Null when a score is unavailable.
            confidence:,
            # primary when the article is mainly about the company, secondary when the company
            # is mentioned but is not the main subject.
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

          # primary when the article is mainly about the company, secondary when the company
          # is mentioned but is not the main subject.
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

          # True when Context observed this article in the publisher-owned feed.
          sig { returns(T::Boolean) }
          attr_accessor :direct

          # Website domain of the publication.
          sig { returns(String) }
          attr_accessor :domain

          # Name of the publication, such as Reuters.
          sig { returns(String) }
          attr_accessor :name

          # The publication that published the article.
          sig do
            params(direct: T::Boolean, domain: String, name: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # True when Context observed this article in the publisher-owned feed.
            direct:,
            # Website domain of the publication.
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

        # Kind of coverage. Use it to separate independent reporting (editorial) from
        # company-issued content (press_release, regulatory_filing, advisory).
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

        # Number of articles in this page.
        sig { returns(Integer) }
        attr_accessor :count

        # Summary information about this response.
        sig { params(count: Integer).returns(T.attached_class) }
        def self.new(
          # Number of articles in this page.
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
