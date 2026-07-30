# typed: strong

module ContextDev
  module Models
    class BatchRetrieveResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BatchRetrieveResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Batch ID used to retrieve or cancel the job.
      sig { returns(String) }
      attr_accessor :id

      # Reserved and used credits.
      sig { returns(ContextDev::Models::BatchRetrieveResponse::Credits) }
      attr_reader :credits

      sig do
        params(
          credits: ContextDev::Models::BatchRetrieveResponse::Credits::OrHash
        ).void
      end
      attr_writer :credits

      # Batch-level error. Null unless `status` is `failed`.
      sig do
        returns(T.nilable(ContextDev::Models::BatchRetrieveResponse::Error))
      end
      attr_reader :error

      sig do
        params(
          error:
            T.nilable(ContextDev::Models::BatchRetrieveResponse::Error::OrHash)
        ).void
      end
      attr_writer :error

      # Page failures grouped by error code.
      sig do
        returns(T::Array[ContextDev::Models::BatchRetrieveResponse::Error])
      end
      attr_accessor :errors

      # Submission counts.
      sig { returns(ContextDev::Models::BatchRetrieveResponse::Input) }
      attr_reader :input

      sig do
        params(
          input: ContextDev::Models::BatchRetrieveResponse::Input::OrHash
        ).void
      end
      attr_writer :input

      # Rejected URLs, up to 100. These are not charged.
      sig do
        returns(T::Array[ContextDev::Models::BatchRetrieveResponse::InvalidURL])
      end
      attr_accessor :invalid_urls

      # How pages are selected.
      sig do
        returns(ContextDev::Models::BatchRetrieveResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      # Current processing counts. Use `status` to check completion.
      sig { returns(ContextDev::Models::BatchRetrieveResponse::Progress) }
      attr_reader :progress

      sig do
        params(
          progress: ContextDev::Models::BatchRetrieveResponse::Progress::OrHash
        ).void
      end
      attr_writer :progress

      # Download links available when the batch finishes. GET /batch/{batch_id}/results
      # serves the same records as paginated JSON.
      sig do
        returns(T.nilable(ContextDev::Models::BatchRetrieveResponse::Results))
      end
      attr_reader :results

      sig do
        params(
          results:
            T.nilable(
              ContextDev::Models::BatchRetrieveResponse::Results::OrHash
            )
        ).void
      end
      attr_writer :results

      # Current state. `completed`, `cancelled`, and `failed` are final.
      sig do
        returns(ContextDev::Models::BatchRetrieveResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Tags stored on the batch at submission.
      sig { returns(T::Array[String]) }
      attr_accessor :tags

      sig { returns(ContextDev::Models::BatchRetrieveResponse::Timing) }
      attr_reader :timing

      sig do
        params(
          timing: ContextDev::Models::BatchRetrieveResponse::Timing::OrHash
        ).void
      end
      attr_writer :timing

      # Output format.
      sig do
        returns(ContextDev::Models::BatchRetrieveResponse::Type::TaggedSymbol)
      end
      attr_accessor :type

      # API key usage for this request.
      sig do
        returns(
          T.nilable(ContextDev::Models::BatchRetrieveResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BatchRetrieveResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Webhook signing secret. Also returned by GET /batch/{batch_id}.
      sig { returns(T.nilable(String)) }
      attr_reader :webhook_secret

      sig { params(webhook_secret: String).void }
      attr_writer :webhook_secret

      sig do
        params(
          id: String,
          credits: ContextDev::Models::BatchRetrieveResponse::Credits::OrHash,
          error:
            T.nilable(ContextDev::Models::BatchRetrieveResponse::Error::OrHash),
          errors:
            T::Array[ContextDev::Models::BatchRetrieveResponse::Error::OrHash],
          input: ContextDev::Models::BatchRetrieveResponse::Input::OrHash,
          invalid_urls:
            T::Array[
              ContextDev::Models::BatchRetrieveResponse::InvalidURL::OrHash
            ],
          mode: ContextDev::Models::BatchRetrieveResponse::Mode::OrSymbol,
          progress: ContextDev::Models::BatchRetrieveResponse::Progress::OrHash,
          results:
            T.nilable(
              ContextDev::Models::BatchRetrieveResponse::Results::OrHash
            ),
          status: ContextDev::Models::BatchRetrieveResponse::Status::OrSymbol,
          tags: T::Array[String],
          timing: ContextDev::Models::BatchRetrieveResponse::Timing::OrHash,
          type: ContextDev::Models::BatchRetrieveResponse::Type::OrSymbol,
          key_metadata:
            ContextDev::Models::BatchRetrieveResponse::KeyMetadata::OrHash,
          webhook_secret: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Batch ID used to retrieve or cancel the job.
        id:,
        # Reserved and used credits.
        credits:,
        # Batch-level error. Null unless `status` is `failed`.
        error:,
        # Page failures grouped by error code.
        errors:,
        # Submission counts.
        input:,
        # Rejected URLs, up to 100. These are not charged.
        invalid_urls:,
        # How pages are selected.
        mode:,
        # Current processing counts. Use `status` to check completion.
        progress:,
        # Download links available when the batch finishes. GET /batch/{batch_id}/results
        # serves the same records as paginated JSON.
        results:,
        # Current state. `completed`, `cancelled`, and `failed` are final.
        status:,
        # Tags stored on the batch at submission.
        tags:,
        timing:,
        # Output format.
        type:,
        # API key usage for this request.
        key_metadata: nil,
        # Webhook signing secret. Also returned by GET /batch/{batch_id}.
        webhook_secret: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            credits: ContextDev::Models::BatchRetrieveResponse::Credits,
            error: T.nilable(ContextDev::Models::BatchRetrieveResponse::Error),
            errors: T::Array[ContextDev::Models::BatchRetrieveResponse::Error],
            input: ContextDev::Models::BatchRetrieveResponse::Input,
            invalid_urls:
              T::Array[ContextDev::Models::BatchRetrieveResponse::InvalidURL],
            mode: ContextDev::Models::BatchRetrieveResponse::Mode::TaggedSymbol,
            progress: ContextDev::Models::BatchRetrieveResponse::Progress,
            results:
              T.nilable(ContextDev::Models::BatchRetrieveResponse::Results),
            status:
              ContextDev::Models::BatchRetrieveResponse::Status::TaggedSymbol,
            tags: T::Array[String],
            timing: ContextDev::Models::BatchRetrieveResponse::Timing,
            type: ContextDev::Models::BatchRetrieveResponse::Type::TaggedSymbol,
            key_metadata:
              ContextDev::Models::BatchRetrieveResponse::KeyMetadata,
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
              ContextDev::Models::BatchRetrieveResponse::Credits,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits used by successful pages.
        sig { returns(Integer) }
        attr_accessor :charged

        # Credits reserved when the batch was accepted.
        sig { returns(Integer) }
        attr_accessor :estimated

        # Reserved and used credits.
        sig do
          params(charged: Integer, estimated: Integer).returns(T.attached_class)
        end
        def self.new(
          # Credits used by successful pages.
          charged:,
          # Credits reserved when the batch was accepted.
          estimated:
        )
        end

        sig { override.returns({ charged: Integer, estimated: Integer }) }
        def to_hash
        end
      end

      class Error < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchRetrieveResponse::Error,
              ContextDev::Internal::AnyHash
            )
          end

        # Batch error code.
        sig { returns(String) }
        attr_accessor :code

        # Batch error message.
        sig { returns(String) }
        attr_accessor :message

        # Batch-level error. Null unless `status` is `failed`.
        sig { params(code: String, message: String).returns(T.attached_class) }
        def self.new(
          # Batch error code.
          code:,
          # Batch error message.
          message:
        )
        end

        sig { override.returns({ code: String, message: String }) }
        def to_hash
        end
      end

      class Input < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchRetrieveResponse::Input,
              ContextDev::Internal::AnyHash
            )
          end

        # Pages accepted, or the crawl page limit. Credits are reserved for this count.
        sig { returns(Integer) }
        attr_accessor :accepted

        # Duplicate URL and `itemId` pairs skipped. Always 0 for crawls.
        sig { returns(Integer) }
        attr_accessor :duplicates

        # Pages rejected during validation.
        sig { returns(Integer) }
        attr_accessor :invalid

        # Pages submitted before validation. For a crawl, the page limit.
        sig { returns(Integer) }
        attr_accessor :submitted

        # Submission counts.
        sig do
          params(
            accepted: Integer,
            duplicates: Integer,
            invalid: Integer,
            submitted: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Pages accepted, or the crawl page limit. Credits are reserved for this count.
          accepted:,
          # Duplicate URL and `itemId` pairs skipped. Always 0 for crawls.
          duplicates:,
          # Pages rejected during validation.
          invalid:,
          # Pages submitted before validation. For a crawl, the page limit.
          submitted:
        )
        end

        sig do
          override.returns(
            {
              accepted: Integer,
              duplicates: Integer,
              invalid: Integer,
              submitted: Integer
            }
          )
        end
        def to_hash
        end
      end

      class InvalidURL < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchRetrieveResponse::InvalidURL,
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

      # How pages are selected.
      module Mode
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchRetrieveResponse::Mode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SCRAPE =
          T.let(
            :scrape,
            ContextDev::Models::BatchRetrieveResponse::Mode::TaggedSymbol
          )
        CRAWL =
          T.let(
            :crawl,
            ContextDev::Models::BatchRetrieveResponse::Mode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchRetrieveResponse::Mode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Progress < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchRetrieveResponse::Progress,
              ContextDev::Internal::AnyHash
            )
          end

        # Pages that could not be scraped.
        sig { returns(Integer) }
        attr_accessor :failed

        # Accepted pages not yet attempted. Always 0 once the batch completes; a crawl can
        # finish under its page limit when the site has no more reachable pages.
        sig { returns(Integer) }
        attr_accessor :pending

        # Pages scraped successfully.
        sig { returns(Integer) }
        attr_accessor :succeeded

        # Current processing counts. Use `status` to check completion.
        sig do
          params(failed: Integer, pending: Integer, succeeded: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Pages that could not be scraped.
          failed:,
          # Accepted pages not yet attempted. Always 0 once the batch completes; a crawl can
          # finish under its page limit when the site has no more reachable pages.
          pending:,
          # Pages scraped successfully.
          succeeded:
        )
        end

        sig do
          override.returns(
            { failed: Integer, pending: Integer, succeeded: Integer }
          )
        end
        def to_hash
        end
      end

      class Results < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchRetrieveResponse::Results,
              ContextDev::Internal::AnyHash
            )
          end

        # When the download URLs expire.
        sig { returns(String) }
        attr_accessor :expires_at

        # Result files. Order is not guaranteed.
        sig do
          returns(
            T::Array[ContextDev::Models::BatchRetrieveResponse::Results::File]
          )
        end
        attr_accessor :files

        # Download links available when the batch finishes. GET /batch/{batch_id}/results
        # serves the same records as paginated JSON.
        sig do
          params(
            expires_at: String,
            files:
              T::Array[
                ContextDev::Models::BatchRetrieveResponse::Results::File::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # When the download URLs expire.
          expires_at:,
          # Result files. Order is not guaranteed.
          files:
        )
        end

        sig do
          override.returns(
            {
              expires_at: String,
              files:
                T::Array[
                  ContextDev::Models::BatchRetrieveResponse::Results::File
                ]
            }
          )
        end
        def to_hash
        end

        class File < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchRetrieveResponse::Results::File,
                ContextDev::Internal::AnyHash
              )
            end

          # Compressed file size in bytes.
          sig { returns(Integer) }
          attr_accessor :bytes

          # Results in this file.
          sig { returns(Integer) }
          attr_accessor :items

          # Temporary URL for a gzipped NDJSON file.
          sig { returns(String) }
          attr_accessor :url

          sig do
            params(bytes: Integer, items: Integer, url: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Compressed file size in bytes.
            bytes:,
            # Results in this file.
            items:,
            # Temporary URL for a gzipped NDJSON file.
            url:
          )
          end

          sig do
            override.returns({ bytes: Integer, items: Integer, url: String })
          end
          def to_hash
          end
        end
      end

      # Current state. `completed`, `cancelled`, and `failed` are final.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchRetrieveResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(
            :queued,
            ContextDev::Models::BatchRetrieveResponse::Status::TaggedSymbol
          )
        RUNNING =
          T.let(
            :running,
            ContextDev::Models::BatchRetrieveResponse::Status::TaggedSymbol
          )
        CANCELLING =
          T.let(
            :cancelling,
            ContextDev::Models::BatchRetrieveResponse::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            ContextDev::Models::BatchRetrieveResponse::Status::TaggedSymbol
          )
        CANCELLED =
          T.let(
            :cancelled,
            ContextDev::Models::BatchRetrieveResponse::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            ContextDev::Models::BatchRetrieveResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchRetrieveResponse::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class Timing < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchRetrieveResponse::Timing,
              ContextDev::Internal::AnyHash
            )
          end

        # When processing finished. Null while active.
        sig { returns(T.nilable(String)) }
        attr_accessor :completed_at

        # When the batch was created.
        sig { returns(String) }
        attr_accessor :created_at

        # When processing started. Null while queued.
        sig { returns(T.nilable(String)) }
        attr_accessor :started_at

        sig do
          params(
            completed_at: T.nilable(String),
            created_at: String,
            started_at: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # When processing finished. Null while active.
          completed_at:,
          # When the batch was created.
          created_at:,
          # When processing started. Null while queued.
          started_at:
        )
        end

        sig do
          override.returns(
            {
              completed_at: T.nilable(String),
              created_at: String,
              started_at: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      # Output format.
      module Type
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchRetrieveResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MARKDOWN =
          T.let(
            :markdown,
            ContextDev::Models::BatchRetrieveResponse::Type::TaggedSymbol
          )
        HTML =
          T.let(
            :html,
            ContextDev::Models::BatchRetrieveResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchRetrieveResponse::Type::TaggedSymbol
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
              ContextDev::Models::BatchRetrieveResponse::KeyMetadata,
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
