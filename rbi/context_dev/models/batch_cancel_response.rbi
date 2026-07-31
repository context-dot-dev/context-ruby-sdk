# typed: strong

module ContextDev
  module Models
    class BatchCancelResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BatchCancelResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Batch ID used to retrieve or cancel the job.
      sig { returns(String) }
      attr_accessor :id

      # The crawl controls as submitted, so the limits requested can be compared against
      # what the crawl reached.
      sig { returns(T.nilable(ContextDev::CrawlControls)) }
      attr_reader :crawl

      sig { params(crawl: T.nilable(ContextDev::CrawlControls::OrHash)).void }
      attr_writer :crawl

      # What this batch has done to your credit balance.
      sig { returns(ContextDev::Models::BatchCancelResponse::Credits) }
      attr_reader :credits

      sig do
        params(
          credits: ContextDev::Models::BatchCancelResponse::Credits::OrHash
        ).void
      end
      attr_writer :credits

      # A failure of the batch as a whole, distinct from the per-page failures in
      # `page_errors`.
      sig { returns(T.nilable(ContextDev::Failure)) }
      attr_reader :failure

      sig { params(failure: T.nilable(ContextDev::Failure::OrHash)).void }
      attr_writer :failure

      # What each page is returned as. Matches `input.data.format` on the submit
      # request.
      sig do
        returns(ContextDev::Models::BatchCancelResponse::Format::TaggedSymbol)
      end
      attr_accessor :format_

      # What submission took in, and what it charged for.
      sig { returns(ContextDev::Intake) }
      attr_reader :input

      sig { params(input: ContextDev::Intake::OrHash).void }
      attr_writer :input

      # How pages were selected. Matches `input.mode` on the submit request.
      sig do
        returns(ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      # Individual page failures grouped by error code, sorted by count. Unrelated to
      # `failure`, which is the batch itself failing.
      sig { returns(T::Array[ContextDev::PageErrorCount]) }
      attr_accessor :page_errors

      # Pages attempted so far. Use `status` to check completion.
      sig { returns(ContextDev::Models::BatchCancelResponse::Progress) }
      attr_reader :progress

      sig do
        params(
          progress: ContextDev::Models::BatchCancelResponse::Progress::OrHash
        ).void
      end
      attr_writer :progress

      # Download links, available once the batch reaches a final status and null before
      # then. GET /batch/{batch_id}/results serves the same records as paginated JSON.
      sig do
        returns(T.nilable(ContextDev::Models::BatchCancelResponse::Results))
      end
      attr_reader :results

      sig do
        params(
          results:
            T.nilable(ContextDev::Models::BatchCancelResponse::Results::OrHash)
        ).void
      end
      attr_writer :results

      # Current state. `completed`, `cancelled`, and `failed` are final.
      sig do
        returns(ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol)
      end
      attr_accessor :status

      # Tags stored on the batch at submission.
      sig { returns(T::Array[String]) }
      attr_accessor :tags

      sig { returns(ContextDev::Models::BatchCancelResponse::Timing) }
      attr_reader :timing

      sig do
        params(
          timing: ContextDev::Models::BatchCancelResponse::Timing::OrHash
        ).void
      end
      attr_writer :timing

      # API key usage for this request.
      sig do
        returns(T.nilable(ContextDev::Models::BatchCancelResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BatchCancelResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          id: String,
          crawl: T.nilable(ContextDev::CrawlControls::OrHash),
          credits: ContextDev::Models::BatchCancelResponse::Credits::OrHash,
          failure: T.nilable(ContextDev::Failure::OrHash),
          format_: ContextDev::Models::BatchCancelResponse::Format::OrSymbol,
          input: ContextDev::Intake::OrHash,
          mode: ContextDev::Models::BatchCancelResponse::Mode::OrSymbol,
          page_errors: T::Array[ContextDev::PageErrorCount::OrHash],
          progress: ContextDev::Models::BatchCancelResponse::Progress::OrHash,
          results:
            T.nilable(ContextDev::Models::BatchCancelResponse::Results::OrHash),
          status: ContextDev::Models::BatchCancelResponse::Status::OrSymbol,
          tags: T::Array[String],
          timing: ContextDev::Models::BatchCancelResponse::Timing::OrHash,
          key_metadata:
            ContextDev::Models::BatchCancelResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Batch ID used to retrieve or cancel the job.
        id:,
        # The crawl controls as submitted, so the limits requested can be compared against
        # what the crawl reached.
        crawl:,
        # What this batch has done to your credit balance.
        credits:,
        # A failure of the batch as a whole, distinct from the per-page failures in
        # `page_errors`.
        failure:,
        # What each page is returned as. Matches `input.data.format` on the submit
        # request.
        format_:,
        # What submission took in, and what it charged for.
        input:,
        # How pages were selected. Matches `input.mode` on the submit request.
        mode:,
        # Individual page failures grouped by error code, sorted by count. Unrelated to
        # `failure`, which is the batch itself failing.
        page_errors:,
        # Pages attempted so far. Use `status` to check completion.
        progress:,
        # Download links, available once the batch reaches a final status and null before
        # then. GET /batch/{batch_id}/results serves the same records as paginated JSON.
        results:,
        # Current state. `completed`, `cancelled`, and `failed` are final.
        status:,
        # Tags stored on the batch at submission.
        tags:,
        timing:,
        # API key usage for this request.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            crawl: T.nilable(ContextDev::CrawlControls),
            credits: ContextDev::Models::BatchCancelResponse::Credits,
            failure: T.nilable(ContextDev::Failure),
            format_:
              ContextDev::Models::BatchCancelResponse::Format::TaggedSymbol,
            input: ContextDev::Intake,
            mode: ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol,
            page_errors: T::Array[ContextDev::PageErrorCount],
            progress: ContextDev::Models::BatchCancelResponse::Progress,
            results:
              T.nilable(ContextDev::Models::BatchCancelResponse::Results),
            status:
              ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol,
            tags: T::Array[String],
            timing: ContextDev::Models::BatchCancelResponse::Timing,
            key_metadata: ContextDev::Models::BatchCancelResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Credits < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchCancelResponse::Credits,
              ContextDev::Internal::AnyHash
            )
          end

        # `reserved` minus `refunded` — what the batch has cost so far. Equal to
        # `reserved` until the batch settles.
        sig { returns(Integer) }
        attr_accessor :net

        # Credits returned for pages that did not succeed. Stays 0 until the batch reaches
        # a final status, then settles in one movement.
        sig { returns(Integer) }
        attr_accessor :refunded

        # Credits debited from your balance the moment the batch was accepted. This is a
        # charge, not a forecast — the whole amount leaves the balance up front.
        sig { returns(Integer) }
        attr_accessor :reserved

        # What this batch has done to your credit balance.
        sig do
          params(net: Integer, refunded: Integer, reserved: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # `reserved` minus `refunded` — what the batch has cost so far. Equal to
          # `reserved` until the batch settles.
          net:,
          # Credits returned for pages that did not succeed. Stays 0 until the batch reaches
          # a final status, then settles in one movement.
          refunded:,
          # Credits debited from your balance the moment the batch was accepted. This is a
          # charge, not a forecast — the whole amount leaves the balance up front.
          reserved:
        )
        end

        sig do
          override.returns(
            { net: Integer, refunded: Integer, reserved: Integer }
          )
        end
        def to_hash
        end
      end

      # What each page is returned as. Matches `input.data.format` on the submit
      # request.
      module Format
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchCancelResponse::Format)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        MARKDOWN =
          T.let(
            :markdown,
            ContextDev::Models::BatchCancelResponse::Format::TaggedSymbol
          )
        HTML =
          T.let(
            :html,
            ContextDev::Models::BatchCancelResponse::Format::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchCancelResponse::Format::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # How pages were selected. Matches `input.mode` on the submit request.
      module Mode
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::BatchCancelResponse::Mode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        SCRAPE =
          T.let(
            :scrape,
            ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol
          )
        CRAWL =
          T.let(
            :crawl,
            ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchCancelResponse::Mode::TaggedSymbol
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
              ContextDev::Models::BatchCancelResponse::Progress,
              ContextDev::Internal::AnyHash
            )
          end

        # Pages that could not be scraped.
        sig { returns(Integer) }
        attr_accessor :failed

        # Reserved pages not yet attempted. A cancelled batch keeps reporting the URLs it
        # never reached; a crawl whose `input.reserved_is_ceiling` is true reports 0 once
        # final, because its unspent budget was never real pages.
        sig { returns(Integer) }
        attr_accessor :pending

        # Pages scraped successfully.
        sig { returns(Integer) }
        attr_accessor :succeeded

        # Pages attempted so far. Use `status` to check completion.
        sig do
          params(failed: Integer, pending: Integer, succeeded: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Pages that could not be scraped.
          failed:,
          # Reserved pages not yet attempted. A cancelled batch keeps reporting the URLs it
          # never reached; a crawl whose `input.reserved_is_ceiling` is true reports 0 once
          # final, because its unspent budget was never real pages.
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
              ContextDev::Models::BatchCancelResponse::Results,
              ContextDev::Internal::AnyHash
            )
          end

        # When the download URLs expire.
        sig { returns(String) }
        attr_accessor :expires_at

        # Result files. Order is not guaranteed.
        sig do
          returns(
            T::Array[ContextDev::Models::BatchCancelResponse::Results::File]
          )
        end
        attr_accessor :files

        # Download links, available once the batch reaches a final status and null before
        # then. GET /batch/{batch_id}/results serves the same records as paginated JSON.
        sig do
          params(
            expires_at: String,
            files:
              T::Array[
                ContextDev::Models::BatchCancelResponse::Results::File::OrHash
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
                T::Array[ContextDev::Models::BatchCancelResponse::Results::File]
            }
          )
        end
        def to_hash
        end

        class File < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchCancelResponse::Results::File,
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
            T.all(Symbol, ContextDev::Models::BatchCancelResponse::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        QUEUED =
          T.let(
            :queued,
            ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol
          )
        RUNNING =
          T.let(
            :running,
            ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol
          )
        CANCELLING =
          T.let(
            :cancelling,
            ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol
          )
        COMPLETED =
          T.let(
            :completed,
            ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol
          )
        CANCELLED =
          T.let(
            :cancelled,
            ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol
          )
        FAILED =
          T.let(
            :failed,
            ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchCancelResponse::Status::TaggedSymbol
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
              ContextDev::Models::BatchCancelResponse::Timing,
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

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchCancelResponse::KeyMetadata,
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
