# typed: strong

module ContextDev
  module Resources
    # Scrape many pages or crawl a site asynchronously.
    class Batch
      # Check progress, and get download links once the batch finishes.
      sig do
        params(
          batch_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchRetrieveResponse)
      end
      def retrieve(
        # ID of the batch to retrieve or cancel.
        batch_id,
        request_options: {}
      )
      end

      # List your batches from newest to oldest. Filter by status or continue with a
      # cursor.
      sig do
        params(
          cursor: String,
          limit: Integer,
          q: String,
          search_type: ContextDev::BatchListParams::SearchType::OrSymbol,
          status: ContextDev::BatchListParams::Status::OrSymbol,
          tags: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchListResponse)
      end
      def list(
        # Cursor from the previous page.
        cursor: nil,
        # Batches per page. Defaults to 25.
        limit: nil,
        # Free-text search term, matched against the batch id, crawl source (start URL or
        # sitemap domain), and tags.
        q: nil,
        # `prefix` for as-you-type prefix matching (default), `exact` for full-token
        # matching.
        search_type: nil,
        # Filter by status.
        status: nil,
        # Comma-separated list of tags to filter by (matches batches having any of them).
        tags: nil,
        request_options: {}
      )
      end

      # Permanently delete a finished batch and its stored results. Active batches must
      # settle first.
      sig do
        params(
          batch_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchDeleteResponse)
      end
      def delete(
        # ID of the batch to retrieve or cancel.
        batch_id,
        request_options: {}
      )
      end

      # Stop a batch from starting new pages. In-progress pages finish, and unused
      # credits are refunded.
      sig do
        params(
          batch_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchCancelResponse)
      end
      def cancel(
        # ID of the batch to retrieve or cancel.
        batch_id,
        request_options: {}
      )
      end

      # Page through a finished batch's results as JSON instead of downloading the
      # NDJSON files.
      sig do
        params(
          batch_id: String,
          cursor: String,
          limit: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchGetResultsResponse)
      end
      def get_results(
        # ID of the batch to retrieve or cancel.
        batch_id,
        # next_cursor from the previous page.
        cursor: nil,
        # Records per page. Defaults to 25. A page can close early so its payload stays
        # under ~8 MB; rely on next_cursor rather than counting records.
        limit: nil,
        request_options: {}
      )
      end

      # Scrape 25K URLs or crawl large websites asynchronously.
      sig do
        params(
          input:
            T.any(
              ContextDev::BatchSubmitParams::Input::Scrape::OrHash,
              ContextDev::BatchSubmitParams::Input::Crawl::OrHash
            ),
          tags: T::Array[String],
          webhook_url: String,
          idempotency_key: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchSubmitResponse)
      end
      def submit(
        # Body param: Choose a URL list or a site crawl.
        input:,
        # Body param: Tags stored on the batch. Filter the batch list by them later.
        tags: nil,
        # Body param: URL notified when the batch finishes.
        webhook_url: nil,
        # Header param: Any string unique to this submission. Retries with the same key
        # return the original batch.
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
