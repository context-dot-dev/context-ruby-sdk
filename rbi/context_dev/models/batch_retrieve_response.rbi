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

      # Batch ID.
      sig { returns(String) }
      attr_accessor :id

      # Crawl settings as submitted.
      sig { returns(T.nilable(ContextDev::CrawlControls)) }
      attr_reader :crawl

      sig { params(crawl: T.nilable(ContextDev::CrawlControls::OrHash)).void }
      attr_writer :crawl

      # Batch credit usage and settlement.
      sig { returns(ContextDev::Models::BatchRetrieveResponse::Credits) }
      attr_reader :credits

      sig do
        params(
          credits: ContextDev::Models::BatchRetrieveResponse::Credits::OrHash
        ).void
      end
      attr_writer :credits

      # A failure of the batch as a whole, distinct from the per-page failures in
      # `page_errors`.
      sig { returns(T.nilable(ContextDev::Failure)) }
      attr_reader :failure

      sig { params(failure: T.nilable(ContextDev::Failure::OrHash)).void }
      attr_writer :failure

      # Outputs requested for each page. Matches input.data.formats on submission.
      sig { returns(ContextDev::Models::BatchRetrieveResponse::Formats) }
      attr_reader :formats

      sig do
        params(
          formats: ContextDev::Models::BatchRetrieveResponse::Formats::OrHash
        ).void
      end
      attr_writer :formats

      # What the submission accepted.
      sig { returns(ContextDev::Intake) }
      attr_reader :input

      sig { params(input: ContextDev::Intake::OrHash).void }
      attr_writer :input

      # Rejected URLs (first 100).
      sig do
        returns(T::Array[ContextDev::Models::BatchRetrieveResponse::InvalidURL])
      end
      attr_accessor :invalid_urls

      # `scrape` (URL list) or `crawl`.
      sig do
        returns(ContextDev::Models::BatchRetrieveResponse::Mode::TaggedSymbol)
      end
      attr_accessor :mode

      # Individual page failures grouped by error code, sorted by count. Unrelated to
      # `failure`, which is the batch itself failing.
      sig { returns(T::Array[ContextDev::PageErrorCount]) }
      attr_accessor :page_errors

      # Pages attempted so far. Use `status` to check completion.
      sig { returns(ContextDev::Models::BatchRetrieveResponse::Progress) }
      attr_reader :progress

      sig do
        params(
          progress: ContextDev::Models::BatchRetrieveResponse::Progress::OrHash
        ).void
      end
      attr_writer :progress

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Result download links; null until the batch finishes. Files are deleted 180 days
      # after the batch finishes.
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

      # Credits this request used and your remaining balance.
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

      # Access policy IDs applied to every page.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :policies

      sig { params(policies: T::Array[String]).void }
      attr_writer :policies

      # Batch completion delivery ID, when available.
      sig { returns(T.nilable(String)) }
      attr_reader :webhook_delivery_id

      sig { params(webhook_delivery_id: String).void }
      attr_writer :webhook_delivery_id

      sig do
        params(
          id: String,
          crawl: T.nilable(ContextDev::CrawlControls::OrHash),
          credits: ContextDev::Models::BatchRetrieveResponse::Credits::OrHash,
          failure: T.nilable(ContextDev::Failure::OrHash),
          formats: ContextDev::Models::BatchRetrieveResponse::Formats::OrHash,
          input: ContextDev::Intake::OrHash,
          invalid_urls:
            T::Array[
              ContextDev::Models::BatchRetrieveResponse::InvalidURL::OrHash
            ],
          mode: ContextDev::Models::BatchRetrieveResponse::Mode::OrSymbol,
          page_errors: T::Array[ContextDev::PageErrorCount::OrHash],
          progress: ContextDev::Models::BatchRetrieveResponse::Progress::OrHash,
          request_id: String,
          results:
            T.nilable(
              ContextDev::Models::BatchRetrieveResponse::Results::OrHash
            ),
          status: ContextDev::Models::BatchRetrieveResponse::Status::OrSymbol,
          tags: T::Array[String],
          timing: ContextDev::Models::BatchRetrieveResponse::Timing::OrHash,
          key_metadata:
            ContextDev::Models::BatchRetrieveResponse::KeyMetadata::OrHash,
          policies: T::Array[String],
          webhook_delivery_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Batch ID.
        id:,
        # Crawl settings as submitted.
        crawl:,
        # Batch credit usage and settlement.
        credits:,
        # A failure of the batch as a whole, distinct from the per-page failures in
        # `page_errors`.
        failure:,
        # Outputs requested for each page. Matches input.data.formats on submission.
        formats:,
        # What the submission accepted.
        input:,
        # Rejected URLs (first 100).
        invalid_urls:,
        # `scrape` (URL list) or `crawl`.
        mode:,
        # Individual page failures grouped by error code, sorted by count. Unrelated to
        # `failure`, which is the batch itself failing.
        page_errors:,
        # Pages attempted so far. Use `status` to check completion.
        progress:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Result download links; null until the batch finishes. Files are deleted 180 days
        # after the batch finishes.
        results:,
        # Current state. `completed`, `cancelled`, and `failed` are final.
        status:,
        # Tags stored on the batch at submission.
        tags:,
        timing:,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # Access policy IDs applied to every page.
        policies: nil,
        # Batch completion delivery ID, when available.
        webhook_delivery_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            crawl: T.nilable(ContextDev::CrawlControls),
            credits: ContextDev::Models::BatchRetrieveResponse::Credits,
            failure: T.nilable(ContextDev::Failure),
            formats: ContextDev::Models::BatchRetrieveResponse::Formats,
            input: ContextDev::Intake,
            invalid_urls:
              T::Array[ContextDev::Models::BatchRetrieveResponse::InvalidURL],
            mode: ContextDev::Models::BatchRetrieveResponse::Mode::TaggedSymbol,
            page_errors: T::Array[ContextDev::PageErrorCount],
            progress: ContextDev::Models::BatchRetrieveResponse::Progress,
            request_id: String,
            results:
              T.nilable(ContextDev::Models::BatchRetrieveResponse::Results),
            status:
              ContextDev::Models::BatchRetrieveResponse::Status::TaggedSymbol,
            tags: T::Array[String],
            timing: ContextDev::Models::BatchRetrieveResponse::Timing,
            key_metadata:
              ContextDev::Models::BatchRetrieveResponse::KeyMetadata,
            policies: T::Array[String],
            webhook_delivery_id: String
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

        # `reserved` minus `refunded` plus `ocr_charged`.
        sig { returns(Integer) }
        attr_accessor :net

        # OCR usage charged when the batch settles.
        sig { returns(Integer) }
        attr_accessor :ocr_charged

        # Credits returned for unsuccessful pages when the batch settles.
        sig { returns(Integer) }
        attr_accessor :refunded

        # Credits held when the batch was accepted.
        sig { returns(Integer) }
        attr_accessor :reserved

        # Batch credit usage and settlement.
        sig do
          params(
            net: Integer,
            ocr_charged: Integer,
            refunded: Integer,
            reserved: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # `reserved` minus `refunded` plus `ocr_charged`.
          net:,
          # OCR usage charged when the batch settles.
          ocr_charged:,
          # Credits returned for unsuccessful pages when the batch settles.
          refunded:,
          # Credits held when the batch was accepted.
          reserved:
        )
        end

        sig do
          override.returns(
            {
              net: Integer,
              ocr_charged: Integer,
              refunded: Integer,
              reserved: Integer
            }
          )
        end
        def to_hash
        end
      end

      class Formats < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchRetrieveResponse::Formats,
              ContextDev::Internal::AnyHash
            )
          end

        # The original HTTP response body.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :bytes

        sig { params(bytes: T::Boolean).void }
        attr_writer :bytes

        # Markdown excerpts relevant to `highlightsParams.query`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :highlights

        sig { params(highlights: T::Boolean).void }
        attr_writer :highlights

        # Rendered HTML.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :html

        sig { params(html: T::Boolean).void }
        attr_writer :html

        # Images found on the page.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :images

        sig { params(images: T::Boolean).void }
        attr_writer :images

        # An object matching `jsonParams.schema`, extracted from the page.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :json

        sig { params(json: T::Boolean).void }
        attr_writer :json

        # Page content as Markdown.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :markdown

        sig { params(markdown: T::Boolean).void }
        attr_writer :markdown

        # Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :parse

        sig { params(parse: T::Boolean).void }
        attr_writer :parse

        # Product details such as name, price, and availability.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :product

        sig { params(product: T::Boolean).void }
        attr_writer :product

        # A screenshot of the page.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :screenshot

        sig { params(screenshot: T::Boolean).void }
        attr_writer :screenshot

        # Outputs requested for each page. Matches input.data.formats on submission.
        sig do
          params(
            bytes: T::Boolean,
            highlights: T::Boolean,
            html: T::Boolean,
            images: T::Boolean,
            json: T::Boolean,
            markdown: T::Boolean,
            parse: T::Boolean,
            product: T::Boolean,
            screenshot: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          # The original HTTP response body.
          bytes: nil,
          # Markdown excerpts relevant to `highlightsParams.query`.
          highlights: nil,
          # Rendered HTML.
          html: nil,
          # Images found on the page.
          images: nil,
          # An object matching `jsonParams.schema`, extracted from the page.
          json: nil,
          # Page content as Markdown.
          markdown: nil,
          # Fields extracted with custom rules or a prebuilt parser, returned as `parsed`.
          parse: nil,
          # Product details such as name, price, and availability.
          product: nil,
          # A screenshot of the page.
          screenshot: nil
        )
        end

        sig do
          override.returns(
            {
              bytes: T::Boolean,
              highlights: T::Boolean,
              html: T::Boolean,
              images: T::Boolean,
              json: T::Boolean,
              markdown: T::Boolean,
              parse: T::Boolean,
              product: T::Boolean,
              screenshot: T::Boolean
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

      # `scrape` (URL list) or `crawl`.
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

        # Accepted pages not yet attempted. Unused crawl capacity is excluded after
        # completion.
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
          # Accepted pages not yet attempted. Unused crawl capacity is excluded after
          # completion.
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

        # When these links expire (24 hours after this response).
        sig { returns(String) }
        attr_accessor :expires_at

        # Result files. Order is not guaranteed.
        sig do
          returns(
            T::Array[ContextDev::Models::BatchRetrieveResponse::Results::File]
          )
        end
        attr_accessor :files

        # Result download links; null until the batch finishes. Files are deleted 180 days
        # after the batch finishes.
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
          # When these links expire (24 hours after this response).
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

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchRetrieveResponse::KeyMetadata,
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
