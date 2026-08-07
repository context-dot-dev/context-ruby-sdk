# typed: strong

module ContextDev
  module Models
    class BatchSubmitResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BatchSubmitResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Batch ID. Poll GET /batch/{batch_id} with it.
      sig { returns(String) }
      attr_accessor :id

      # The crawl controls as submitted, so the limits requested can be compared against
      # what the crawl reached.
      sig { returns(T.nilable(ContextDev::CrawlControls)) }
      attr_reader :crawl

      sig { params(crawl: T.nilable(ContextDev::CrawlControls::OrHash)).void }
      attr_writer :crawl

      # When the batch was created.
      sig { returns(String) }
      attr_accessor :created_at

      # What accepting this batch cost.
      sig { returns(ContextDev::Models::BatchSubmitResponse::Credits) }
      attr_reader :credits

      sig do
        params(
          credits: ContextDev::Models::BatchSubmitResponse::Credits::OrHash
        ).void
      end
      attr_writer :credits

      # What each page will be returned as.
      sig do
        returns(ContextDev::Models::BatchSubmitResponse::Format::TaggedSymbol)
      end
      attr_accessor :format_

      # What submission took in, and what it charged for.
      sig { returns(ContextDev::Intake) }
      attr_reader :input

      sig { params(input: ContextDev::Intake::OrHash).void }
      attr_writer :input

      # Rejected URLs, up to 100. These are not charged.
      sig do
        returns(T::Array[ContextDev::Models::BatchSubmitResponse::InvalidURL])
      end
      attr_accessor :invalid_urls

      # How pages will be selected.
      sig do
        returns(ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      # Always `queued`. An accepted batch has not started yet.
      sig do
        returns(ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Tags stored on the batch.
      sig { returns(T::Array[String]) }
      attr_accessor :tags

      # API key usage for this request.
      sig do
        returns(T.nilable(ContextDev::Models::BatchSubmitResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BatchSubmitResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Signing secret for the completion webhook, returned only here and never again.
      # Store it now; it is not repeated by GET /batch/{batch_id}.
      sig { returns(T.nilable(String)) }
      attr_reader :webhook_secret

      sig { params(webhook_secret: String).void }
      attr_writer :webhook_secret

      sig do
        params(
          id: String,
          crawl: T.nilable(ContextDev::CrawlControls::OrHash),
          created_at: String,
          credits: ContextDev::Models::BatchSubmitResponse::Credits::OrHash,
          format_: ContextDev::Models::BatchSubmitResponse::Format::OrSymbol,
          input: ContextDev::Intake::OrHash,
          invalid_urls:
            T::Array[
              ContextDev::Models::BatchSubmitResponse::InvalidURL::OrHash
            ],
          mode: ContextDev::Models::BatchSubmitResponse::Mode::OrSymbol,
          status: ContextDev::Models::BatchSubmitResponse::Status::OrSymbol,
          tags: T::Array[String],
          key_metadata:
            ContextDev::Models::BatchSubmitResponse::KeyMetadata::OrHash,
          webhook_secret: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Batch ID. Poll GET /batch/{batch_id} with it.
        id:,
        # The crawl controls as submitted, so the limits requested can be compared against
        # what the crawl reached.
        crawl:,
        # When the batch was created.
        created_at:,
        # What accepting this batch cost.
        credits:,
        # What each page will be returned as.
        format_:,
        # What submission took in, and what it charged for.
        input:,
        # Rejected URLs, up to 100. These are not charged.
        invalid_urls:,
        # How pages will be selected.
        mode:,
        # Always `queued`. An accepted batch has not started yet.
        status:,
        # Tags stored on the batch.
        tags:,
        # API key usage for this request.
        key_metadata: nil,
        # Signing secret for the completion webhook, returned only here and never again.
        # Store it now; it is not repeated by GET /batch/{batch_id}.
        webhook_secret: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            crawl: T.nilable(ContextDev::CrawlControls),
            created_at: String,
            credits: ContextDev::Models::BatchSubmitResponse::Credits,
            format_:
              ContextDev::Models::BatchSubmitResponse::Format::TaggedSymbol,
            input: ContextDev::Intake,
            invalid_urls:
              T::Array[ContextDev::Models::BatchSubmitResponse::InvalidURL],
            mode: ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol,
            status:
              ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol,
            tags: T::Array[String],
            key_metadata: ContextDev::Models::BatchSubmitResponse::KeyMetadata,
            webhook_secret: String
          }
        )
      end
      def to_hash
      end

      class Credits < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchSubmitResponse::Credits,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits just debited from your balance. Whatever the batch does not spend is
        # refunded when it settles.
        sig { returns(Integer) }
        attr_accessor :reserved

        # What accepting this batch cost.
        sig { params(reserved: Integer).returns(T.attached_class) }
        def self.new(
          # Credits just debited from your balance. Whatever the batch does not spend is
          # refunded when it settles.
          reserved:
        )
        end

        sig { override.returns({ reserved: Integer }) }
        def to_hash
        end
      end

      # What each page will be returned as.
      module Format
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchSubmitResponse::Format)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MARKDOWN =
          T.let(
            :markdown,
            ContextDev::Models::BatchSubmitResponse::Format::TaggedSymbol
          )
        HTML =
          T.let(
            :html,
            ContextDev::Models::BatchSubmitResponse::Format::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchSubmitResponse::Format::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class InvalidURL < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchSubmitResponse::InvalidURL,
              ContextDev::Internal::AnyHash
            )
          end

        # Why it was rejected.
        sig { returns(String) }
        attr_accessor :reason

        # Rejected URL.
        sig { returns(String) }
        attr_accessor :url

        sig { params(reason: String, url: String).returns(T.attached_class) }
        def self.new(
          # Why it was rejected.
          reason:,
          # Rejected URL.
          url:
        )
        end

        sig { override.returns({ reason: String, url: String }) }
        def to_hash
        end
      end

      # How pages will be selected.
      module Mode
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchSubmitResponse::Mode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SCRAPE =
          T.let(
            :scrape,
            ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol
          )
        CRAWL =
          T.let(
            :crawl,
            ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchSubmitResponse::Mode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # Always `queued`. An accepted batch has not started yet.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchSubmitResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(
            :queued,
            ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchSubmitResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchSubmitResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # The number of credits consumed by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # The number of credits remaining for your organization after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # API key usage for this request.
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
