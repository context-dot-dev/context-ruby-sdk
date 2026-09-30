# typed: strong

module ContextDev
  module Resources
    # Scrape many pages or crawl a site asynchronously.
    class Batch
      # Get batch progress and result download links. Result files are deleted 7 days
      # after the batch finishes.
      sig do
        params(
          batch_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchRetrieveResponse)
      end
      def retrieve(
        # Batch ID.
        batch_id,
        request_options: {}
      )
      end

      # List your batches, newest first, with optional filters.
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
        # Tags to filter by (matches batches having any of them). Pass repeated `tags`
        # params or one comma-separated list, e.g. `tags=docs,competitor`.
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
        # Batch ID.
        batch_id,
        request_options: {}
      )
      end

      # Stop a batch from starting new pages. Pages already in progress finish before
      # the batch becomes cancelled.
      sig do
        params(
          batch_id: String,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchCancelResponse)
      end
      def cancel(
        # Batch ID.
        batch_id,
        request_options: {}
      )
      end

      # Page through a finished batch’s results as JSON. Results remain available for 7
      # days.
      sig do
        params(
          batch_id: String,
          cursor: String,
          limit: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchGetResultsResponse)
      end
      def get_results(
        # Batch ID.
        batch_id,
        # next_cursor from the previous page.
        cursor: nil,
        # Records per page. Defaults to 25. A page can close early so its payload stays
        # under ~8 MB; rely on next_cursor rather than counting records.
        limit: nil,
        request_options: {}
      )
      end

      # Scrape up to 25,000 URLs, or crawl a site, asynchronously. Poll the batch ID or
      # receive a webhook when it finishes.
      sig do
        params(
          input:
            T.any(
              ContextDev::BatchSubmitParams::Input::Scrape::OrHash,
              ContextDev::BatchSubmitParams::Input::Crawl::OrHash
            ),
          tags: T::Array[String],
          webhook: ContextDev::BatchSubmitParams::Webhook::OrHash,
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
        # Body param: Where to send the batch's final-status event. Omit `retry` for one
        # attempt; `{}` uses the default retry schedule.
        webhook: nil,
        # Body param: Legacy URL notified when the batch finishes. Preserves one
        # best-effort attempt. Cannot be combined with webhook.
        webhook_url: nil,
        # Header param: Unique key per submission. Retrying with the same key and body
        # returns the original batch; a different body returns `409`.
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
