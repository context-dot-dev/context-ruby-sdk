# typed: strong

module ContextDev
  module Resources
    class Batch
      # Check progress and get download links when the batch finishes. Also returns the
      # rejected-URL list and webhook signing secret from submission, so nothing is lost
      # if the submit response was dropped.
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

      # Page through the result records of a finished batch as JSON, in the same order
      # as the downloadable result files. Use this instead of downloading and parsing
      # the NDJSON files yourself.
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

      # Retrieve and normalize a person profile from identifiers.
      sig do
        params(
          identifiers: ContextDev::BatchSubmitParams::Identifiers::OrHash,
          tags: T::Array[String],
          timeout_ms: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::BatchSubmitResponse)
      end
      def submit(
        # Known identifiers for the person. At least one identifier is required.
        identifiers:,
        # Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
        tags: nil,
        # Optional timeout in milliseconds for the request. If the request takes longer
        # than this value, it will be aborted with a 408 status code. Maximum allowed
        # value is 300000ms (5 minutes).
        timeout_ms: nil,
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
