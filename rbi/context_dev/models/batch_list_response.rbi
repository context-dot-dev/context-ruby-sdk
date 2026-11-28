# typed: strong

module ContextDev
  module Models
    class BatchListResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BatchListResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Batches on this page.
      sig do
        returns(
          T.nilable(T::Array[ContextDev::Models::BatchListResponse::Data])
        )
      end
      attr_reader :data

      sig do
        params(
          data: T::Array[ContextDev::Models::BatchListResponse::Data::OrHash]
        ).void
      end
      attr_writer :data

      # Whether more results are available after this page.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_more

      sig { params(has_more: T::Boolean).void }
      attr_writer :has_more

      # Credits this request used and your remaining balance.
      sig do
        returns(T.nilable(ContextDev::Models::BatchListResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BatchListResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Pass as `cursor` to fetch the next page. `null` on the last page.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      sig do
        params(
          request_id: String,
          data: T::Array[ContextDev::Models::BatchListResponse::Data::OrHash],
          has_more: T::Boolean,
          key_metadata:
            ContextDev::Models::BatchListResponse::KeyMetadata::OrHash,
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Batches on this page.
        data: nil,
        # Whether more results are available after this page.
        has_more: nil,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # Pass as `cursor` to fetch the next page. `null` on the last page.
        next_cursor: nil
      )
      end

      sig do
        override.returns(
          {
            request_id: String,
            data: T::Array[ContextDev::Models::BatchListResponse::Data],
            has_more: T::Boolean,
            key_metadata: ContextDev::Models::BatchListResponse::KeyMetadata,
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchListResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        # Unique ID of the batch.
        sig { returns(String) }
        attr_accessor :id

        # Crawl settings as submitted.
        sig { returns(T.nilable(ContextDev::CrawlControls)) }
        attr_reader :crawl

        sig { params(crawl: T.nilable(ContextDev::CrawlControls::OrHash)).void }
        attr_writer :crawl

        # Credits reserved, refunded, and charged for the batch.
        sig { returns(ContextDev::Models::BatchListResponse::Data::Credits) }
        attr_reader :credits

        sig do
          params(
            credits:
              ContextDev::Models::BatchListResponse::Data::Credits::OrHash
          ).void
        end
        attr_writer :credits

        # Why the batch as a whole failed. Individual page failures are counted in
        # `page_errors`.
        sig { returns(T.nilable(ContextDev::Failure)) }
        attr_reader :failure

        sig { params(failure: T.nilable(ContextDev::Failure::OrHash)).void }
        attr_writer :failure

        # Formats requested for each page, as submitted in `input.data.formats`.
        sig { returns(ContextDev::Models::BatchListResponse::Data::Formats) }
        attr_reader :formats

        sig do
          params(
            formats:
              ContextDev::Models::BatchListResponse::Data::Formats::OrHash
          ).void
        end
        attr_writer :formats

        # Page counts from your submission.
        sig { returns(ContextDev::Intake) }
        attr_reader :input

        sig { params(input: ContextDev::Intake::OrHash).void }
        attr_writer :input

        # `scrape` for a URL list, `crawl` for a site crawl.
        sig do
          returns(
            ContextDev::Models::BatchListResponse::Data::Mode::TaggedSymbol
          )
        end
        attr_accessor :mode

        # Page failures grouped by error code, most common first. For the batch itself
        # failing, see `failure`.
        sig { returns(T::Array[ContextDev::PageErrorCount]) }
        attr_accessor :page_errors

        # Page counts so far. Check `status` to know when the batch is done.
        sig { returns(ContextDev::Models::BatchListResponse::Data::Progress) }
        attr_reader :progress

        sig do
          params(
            progress:
              ContextDev::Models::BatchListResponse::Data::Progress::OrHash
          ).void
        end
        attr_writer :progress

        # Links to download the results. `null` until the batch finishes; the files are
        # deleted 180 days after that.
        sig do
          returns(
            T.nilable(ContextDev::Models::BatchListResponse::Data::Results)
          )
        end
        attr_reader :results

        sig do
          params(
            results:
              T.nilable(
                ContextDev::Models::BatchListResponse::Data::Results::OrHash
              )
          ).void
        end
        attr_writer :results

        # Current state. `pending` batches are being validated or are waiting for a slot
        # under your plan's concurrent batch limit, `queued` batches are ready to start,
        # and `running` batches are scraping. `completed`, `cancelled`, and `failed` are
        # final.
        sig do
          returns(
            ContextDev::Models::BatchListResponse::Data::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Tags set when the batch was submitted.
        sig { returns(T::Array[String]) }
        attr_accessor :tags

        # When the batch was created, started, and finished.
        sig { returns(ContextDev::Models::BatchListResponse::Data::Timing) }
        attr_reader :timing

        sig do
          params(
            timing: ContextDev::Models::BatchListResponse::Data::Timing::OrHash
          ).void
        end
        attr_writer :timing

        # Access policy IDs applied to every page.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :policies

        sig { params(policies: T::Array[String]).void }
        attr_writer :policies

        # An asynchronous scrape or crawl job.
        sig do
          params(
            id: String,
            crawl: T.nilable(ContextDev::CrawlControls::OrHash),
            credits:
              ContextDev::Models::BatchListResponse::Data::Credits::OrHash,
            failure: T.nilable(ContextDev::Failure::OrHash),
            formats:
              ContextDev::Models::BatchListResponse::Data::Formats::OrHash,
            input: ContextDev::Intake::OrHash,
            mode: ContextDev::Models::BatchListResponse::Data::Mode::OrSymbol,
            page_errors: T::Array[ContextDev::PageErrorCount::OrHash],
            progress:
              ContextDev::Models::BatchListResponse::Data::Progress::OrHash,
            results:
              T.nilable(
                ContextDev::Models::BatchListResponse::Data::Results::OrHash
              ),
            status:
              ContextDev::Models::BatchListResponse::Data::Status::OrSymbol,
            tags: T::Array[String],
            timing: ContextDev::Models::BatchListResponse::Data::Timing::OrHash,
            policies: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique ID of the batch.
          id:,
          # Crawl settings as submitted.
          crawl:,
          # Credits reserved, refunded, and charged for the batch.
          credits:,
          # Why the batch as a whole failed. Individual page failures are counted in
          # `page_errors`.
          failure:,
          # Formats requested for each page, as submitted in `input.data.formats`.
          formats:,
          # Page counts from your submission.
          input:,
          # `scrape` for a URL list, `crawl` for a site crawl.
          mode:,
          # Page failures grouped by error code, most common first. For the batch itself
          # failing, see `failure`.
          page_errors:,
          # Page counts so far. Check `status` to know when the batch is done.
          progress:,
          # Links to download the results. `null` until the batch finishes; the files are
          # deleted 180 days after that.
          results:,
          # Current state. `pending` batches are being validated or are waiting for a slot
          # under your plan's concurrent batch limit, `queued` batches are ready to start,
          # and `running` batches are scraping. `completed`, `cancelled`, and `failed` are
          # final.
          status:,
          # Tags set when the batch was submitted.
          tags:,
          # When the batch was created, started, and finished.
          timing:,
          # Access policy IDs applied to every page.
          policies: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              crawl: T.nilable(ContextDev::CrawlControls),
              credits: ContextDev::Models::BatchListResponse::Data::Credits,
              failure: T.nilable(ContextDev::Failure),
              formats: ContextDev::Models::BatchListResponse::Data::Formats,
              input: ContextDev::Intake,
              mode:
                ContextDev::Models::BatchListResponse::Data::Mode::TaggedSymbol,
              page_errors: T::Array[ContextDev::PageErrorCount],
              progress: ContextDev::Models::BatchListResponse::Data::Progress,
              results:
                T.nilable(ContextDev::Models::BatchListResponse::Data::Results),
              status:
                ContextDev::Models::BatchListResponse::Data::Status::TaggedSymbol,
              tags: T::Array[String],
              timing: ContextDev::Models::BatchListResponse::Data::Timing,
              policies: T::Array[String]
            }
          )
        end
        def to_hash
        end

        class Credits < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchListResponse::Data::Credits,
                ContextDev::Internal::AnyHash
              )
            end

          # `reserved` minus `refunded` plus `ocr_charged`.
          sig { returns(Integer) }
          attr_accessor :net

          # Credits charged for OCR when the batch finishes.
          sig { returns(Integer) }
          attr_accessor :ocr_charged

          # Credits returned when the batch finishes, such as for failed or unattempted
          # pages.
          sig { returns(Integer) }
          attr_accessor :refunded

          # Credits reserved before scraping starts. `0` while `pending`.
          sig { returns(Integer) }
          attr_accessor :reserved

          # Credits reserved, refunded, and charged for the batch.
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
            # Credits charged for OCR when the batch finishes.
            ocr_charged:,
            # Credits returned when the batch finishes, such as for failed or unattempted
            # pages.
            refunded:,
            # Credits reserved before scraping starts. `0` while `pending`.
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
                ContextDev::Models::BatchListResponse::Data::Formats,
                ContextDev::Internal::AnyHash
              )
            end

          # Return the original HTTP response body.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :bytes

          sig { params(bytes: T::Boolean).void }
          attr_writer :bytes

          # Return Markdown excerpts relevant to `highlightsParams.query`.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :highlights

          sig { params(highlights: T::Boolean).void }
          attr_writer :highlights

          # Return the rendered HTML.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :html

          sig { params(html: T::Boolean).void }
          attr_writer :html

          # Return the images found on the page.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :images

          sig { params(images: T::Boolean).void }
          attr_writer :images

          # Return an object matching `jsonParams.schema`, extracted from the page text and
          # embedded data such as JSON-LD, meta tags, and framework state.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :json

          sig { params(json: T::Boolean).void }
          attr_writer :json

          # Return the page content, or a video transcript, as Markdown.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :markdown

          sig { params(markdown: T::Boolean).void }
          attr_writer :markdown

          # Return fields extracted with custom rules or a prebuilt parser, as `parsed`.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :parse

          sig { params(parse: T::Boolean).void }
          attr_writer :parse

          # Return product details such as name, price, and availability.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :product

          sig { params(product: T::Boolean).void }
          attr_writer :product

          # Return a screenshot of the page.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :screenshot

          sig { params(screenshot: T::Boolean).void }
          attr_writer :screenshot

          # Formats requested for each page, as submitted in `input.data.formats`.
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
            # Return the original HTTP response body.
            bytes: nil,
            # Return Markdown excerpts relevant to `highlightsParams.query`.
            highlights: nil,
            # Return the rendered HTML.
            html: nil,
            # Return the images found on the page.
            images: nil,
            # Return an object matching `jsonParams.schema`, extracted from the page text and
            # embedded data such as JSON-LD, meta tags, and framework state.
            json: nil,
            # Return the page content, or a video transcript, as Markdown.
            markdown: nil,
            # Return fields extracted with custom rules or a prebuilt parser, as `parsed`.
            parse: nil,
            # Return product details such as name, price, and availability.
            product: nil,
            # Return a screenshot of the page.
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

        # `scrape` for a URL list, `crawl` for a site crawl.
        module Mode
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::Models::BatchListResponse::Data::Mode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SCRAPE =
            T.let(
              :scrape,
              ContextDev::Models::BatchListResponse::Data::Mode::TaggedSymbol
            )
          CRAWL =
            T.let(
              :crawl,
              ContextDev::Models::BatchListResponse::Data::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::BatchListResponse::Data::Mode::TaggedSymbol
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
                ContextDev::Models::BatchListResponse::Data::Progress,
                ContextDev::Internal::AnyHash
              )
            end

          # Pages that could not be scraped.
          sig { returns(Integer) }
          attr_accessor :failed

          # Accepted pages not yet attempted. A link-following crawl reports `0` once it
          # finishes, since its unused page budget is not counted.
          sig { returns(Integer) }
          attr_accessor :pending

          # Pages scraped successfully.
          sig { returns(Integer) }
          attr_accessor :succeeded

          # Page counts so far. Check `status` to know when the batch is done.
          sig do
            params(
              failed: Integer,
              pending: Integer,
              succeeded: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Pages that could not be scraped.
            failed:,
            # Accepted pages not yet attempted. A link-following crawl reports `0` once it
            # finishes, since its unused page budget is not counted.
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
                ContextDev::Models::BatchListResponse::Data::Results,
                ContextDev::Internal::AnyHash
              )
            end

          # When these links expire, 24 hours after this response. Retrieve the batch again
          # for fresh links.
          sig { returns(String) }
          attr_accessor :expires_at

          # Result files, in no particular order.
          sig do
            returns(
              T::Array[
                ContextDev::Models::BatchListResponse::Data::Results::File
              ]
            )
          end
          attr_accessor :files

          # Links to download the results. `null` until the batch finishes; the files are
          # deleted 180 days after that.
          sig do
            params(
              expires_at: String,
              files:
                T::Array[
                  ContextDev::Models::BatchListResponse::Data::Results::File::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # When these links expire, 24 hours after this response. Retrieve the batch again
            # for fresh links.
            expires_at:,
            # Result files, in no particular order.
            files:
          )
          end

          sig do
            override.returns(
              {
                expires_at: String,
                files:
                  T::Array[
                    ContextDev::Models::BatchListResponse::Data::Results::File
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
                  ContextDev::Models::BatchListResponse::Data::Results::File,
                  ContextDev::Internal::AnyHash
                )
              end

            # Compressed file size in bytes.
            sig { returns(Integer) }
            attr_accessor :bytes

            # Number of result records in this file.
            sig { returns(Integer) }
            attr_accessor :items

            # Temporary download URL for a gzipped NDJSON file of result records.
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
              # Number of result records in this file.
              items:,
              # Temporary download URL for a gzipped NDJSON file of result records.
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

        # Current state. `pending` batches are being validated or are waiting for a slot
        # under your plan's concurrent batch limit, `queued` batches are ready to start,
        # and `running` batches are scraping. `completed`, `cancelled`, and `failed` are
        # final.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, ContextDev::Models::BatchListResponse::Data::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PENDING =
            T.let(
              :pending,
              ContextDev::Models::BatchListResponse::Data::Status::TaggedSymbol
            )
          QUEUED =
            T.let(
              :queued,
              ContextDev::Models::BatchListResponse::Data::Status::TaggedSymbol
            )
          RUNNING =
            T.let(
              :running,
              ContextDev::Models::BatchListResponse::Data::Status::TaggedSymbol
            )
          CANCELLING =
            T.let(
              :cancelling,
              ContextDev::Models::BatchListResponse::Data::Status::TaggedSymbol
            )
          COMPLETED =
            T.let(
              :completed,
              ContextDev::Models::BatchListResponse::Data::Status::TaggedSymbol
            )
          CANCELLED =
            T.let(
              :cancelled,
              ContextDev::Models::BatchListResponse::Data::Status::TaggedSymbol
            )
          FAILED =
            T.let(
              :failed,
              ContextDev::Models::BatchListResponse::Data::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::BatchListResponse::Data::Status::TaggedSymbol
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
                ContextDev::Models::BatchListResponse::Data::Timing,
                ContextDev::Internal::AnyHash
              )
            end

          # When the batch reached a final status. `null` until then.
          sig { returns(T.nilable(String)) }
          attr_accessor :completed_at

          # When the batch was created.
          sig { returns(String) }
          attr_accessor :created_at

          # When scraping started. `null` until the batch is `running`.
          sig { returns(T.nilable(String)) }
          attr_accessor :started_at

          # When the batch was created, started, and finished.
          sig do
            params(
              completed_at: T.nilable(String),
              created_at: String,
              started_at: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # When the batch reached a final status. `null` until then.
            completed_at:,
            # When the batch was created.
            created_at:,
            # When scraping started. `null` until the batch is `running`.
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
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchListResponse::KeyMetadata,
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
