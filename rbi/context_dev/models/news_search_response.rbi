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

      sig { returns(T::Array[ContextDev::Models::NewsSearchResponse::Data]) }
      attr_accessor :data

      sig { returns(T::Boolean) }
      attr_accessor :has_more

      sig { returns(ContextDev::Models::NewsSearchResponse::Meta) }
      attr_reader :meta

      sig do
        params(meta: ContextDev::Models::NewsSearchResponse::Meta::OrHash).void
      end
      attr_writer :meta

      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
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
          key_metadata:
            ContextDev::Models::NewsSearchResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        has_more:,
        meta:,
        next_cursor:,
        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
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

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T::Array[String]) }
        attr_accessor :authors

        sig { returns(T.nilable(String)) }
        attr_accessor :description

        sig { returns(T.nilable(String)) }
        attr_accessor :image_url

        sig { returns(T.nilable(String)) }
        attr_accessor :language

        sig { returns(ContextDev::Models::NewsSearchResponse::Data::Match) }
        attr_reader :match

        sig do
          params(
            match: ContextDev::Models::NewsSearchResponse::Data::Match::OrHash
          ).void
        end
        attr_writer :match

        sig { returns(T.nilable(Time)) }
        attr_accessor :published_at

        sig { returns(ContextDev::Models::NewsSearchResponse::Data::Source) }
        attr_reader :source

        sig do
          params(
            source: ContextDev::Models::NewsSearchResponse::Data::Source::OrHash
          ).void
        end
        attr_writer :source

        # Groups matching normalized headlines published on the same UTC day.
        sig { returns(String) }
        attr_accessor :story_id

        sig { returns(String) }
        attr_accessor :title

        sig do
          returns(
            ContextDev::Models::NewsSearchResponse::Data::Type::TaggedSymbol
          )
        end
        attr_accessor :type

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
          id:,
          authors:,
          description:,
          image_url:,
          language:,
          match:,
          published_at:,
          source:,
          # Groups matching normalized headlines published on the same UTC day.
          story_id:,
          title:,
          type:,
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

          sig { returns(T.nilable(Float)) }
          attr_accessor :confidence

          sig do
            returns(
              ContextDev::Models::NewsSearchResponse::Data::Match::Level::TaggedSymbol
            )
          end
          attr_accessor :level

          sig do
            params(
              confidence: T.nilable(Float),
              level:
                ContextDev::Models::NewsSearchResponse::Data::Match::Level::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(confidence:, level:)
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

          sig { returns(String) }
          attr_accessor :domain

          sig { returns(String) }
          attr_accessor :name

          sig do
            params(direct: T::Boolean, domain: String, name: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # True when Context observed this article in the publisher-owned feed.
            direct:,
            domain:,
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

        sig { returns(Integer) }
        attr_accessor :count

        sig { params(count: Integer).returns(T.attached_class) }
        def self.new(count:)
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

        # The number of credits consumed by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # The number of credits remaining for your organization after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The number of credits consumed by this request.
          credits_consumed:,
          # The number of credits remaining for your organization after this request.
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
