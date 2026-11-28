# typed: strong

module ContextDev
  module Resources
    # Scrape up to 100,000 URLs or crawl a site asynchronously.
    class Batch
      # Retrieve a batch's status, progress, and credit usage, plus links to download
      # its results once it finishes. Result files are deleted 180 days after the batch
      # finishes.
      sig do
        params(
          batch_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchRetrieveResponse)
      end
      def retrieve(
        # ID of the batch.
        batch_id,
        request_options: {}
      )
      end

      # List your batches, newest first. Filter by status or tags, or search by batch
      # ID, crawl source, or tag.
      sig do
        params(
          cursor: String,
          limit: Integer,
          q: String,
          search_type: ContextDev::BatchListParams::SearchType::OrSymbol,
          status: ContextDev::BatchListParams::Status::OrSymbol,
          tags: ContextDev::BatchListParams::Tags::Variants,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchListResponse)
      end
      def list(
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of batches to return per page.
        limit: nil,
        # Search term matched against batch IDs, crawl sources (start URL or sitemap
        # domain), and tags.
        q: nil,
        # How `q` matches: `prefix` matches the start of a term, for search-as-you-type,
        # and `exact` matches whole terms. Defaults to `prefix`.
        search_type: nil,
        # Filter by batch status.
        status: nil,
        # Comma-separated tags. Returns batches that have any of them. You can also repeat
        # the `tags` parameter.
        tags: nil,
        request_options: {}
      )
      end

      # Permanently delete a finished batch and its results. Its webhook deliveries can
      # no longer be retried.
      sig do
        params(
          batch_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchDeleteResponse)
      end
      def delete(
        # ID of the batch.
        batch_id,
        request_options: {}
      )
      end

      # Stop a batch from starting new pages. Pages already in progress finish, then the
      # batch becomes `cancelled` and unused credits are refunded.
      sig do
        params(
          batch_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchCancelResponse)
      end
      def cancel(
        # ID of the batch.
        batch_id,
        request_options: {}
      )
      end

      # Page through a finished batch's results as JSON. Each record's `result` has the
      # same outputs and per-format errors as `POST /web/scrape`. Results are kept for
      # 180 days after the batch finishes.
      sig do
        params(
          batch_id: String,
          cursor: String,
          limit: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchGetResultsResponse)
      end
      def get_results(
        # ID of the batch.
        batch_id,
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of results to return per page. A page can hold fewer to stay
        # under about 8 MB, so page with `next_cursor` instead of counting records.
        limit: nil,
        request_options: {}
      )
      end

      # Scrape up to 100,000 URLs, or crawl a site, asynchronously with every Scrape
      # Anything format and option from `POST /web/scrape`. Poll `GET /batch/{batch_id}`
      # or pass `webhook` to be notified when the batch finishes. URLs and credits are
      # checked after the batch is accepted, so a batch that fails those checks ends as
      # `failed` with a `failure` code instead of returning an error.
      sig do
        params(
          input:
            T.any(
              ContextDev::BatchSubmitParams::Input::Scrape::OrHash,
              ContextDev::BatchSubmitParams::Input::Crawl::OrHash
            ),
          policies: T::Array[String],
          tags: T::Array[String],
          webhook: ContextDev::BatchSubmitParams::Webhook::OrHash,
          idempotency_key: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchSubmitResponse)
      end
      def submit(
        # Body param: What to scrape: a list of URLs (`scrape`) or a site crawl (`crawl`).
        input:,
        # Body param: Access policy IDs to apply to every page; each URL must pass all of
        # them. Requires access policies enabled for your organization; otherwise returns
        # `ACCESS_POLICIES_NOT_ENABLED`.
        policies: nil,
        # Body param: Tags to store on the batch. Filter `GET /batch/list` by them later.
        tags: nil,
        # Body param: Webhook to notify when the batch finishes. Omit `retry` for a single
        # attempt, or pass `retry: {}` for the default retry schedule.
        webhook: nil,
        # Header param: Unique key for this submission. Retrying with the same key and
        # body returns the original batch instead of creating another; a different body
        # returns `409`.
        idempotency_key: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: ContextDev::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
