# frozen_string_literal: true

module ContextDev
  module Resources
    # Scrape many pages or crawl a site asynchronously.
    class Batch
      # Check progress, and get download links once the batch finishes.
      #
      # @overload retrieve(batch_id, request_options: {})
      #
      # @param batch_id [String] ID of the batch to retrieve or cancel.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BatchRetrieveResponse]
      #
      # @see ContextDev::Models::BatchRetrieveParams
      def retrieve(batch_id, params = {})
        @client.request(
          method: :get,
          path: ["batch/%1$s", batch_id],
          model: ContextDev::Models::BatchRetrieveResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BatchListParams} for more details.
      #
      # List your batches from newest to oldest. Filter by status or continue with a
      # cursor.
      #
      # @overload list(cursor: nil, limit: nil, q: nil, search_type: nil, status: nil, tags: nil, request_options: {})
      #
      # @param cursor [String] Cursor from the previous page.
      #
      # @param limit [Integer] Batches per page. Defaults to 25.
      #
      # @param q [String] Free-text search term, matched against the batch id, crawl source (start URL or
      #
      # @param search_type [Symbol, ContextDev::Models::BatchListParams::SearchType] `prefix` for as-you-type prefix matching (default), `exact` for full-token match
      #
      # @param status [Symbol, ContextDev::Models::BatchListParams::Status] Filter by status.
      #
      # @param tags [String] Comma-separated list of tags to filter by (matches batches having any of them).
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BatchListResponse]
      #
      # @see ContextDev::Models::BatchListParams
      def list(params = {})
        parsed, options = ContextDev::BatchListParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "batch/list",
          query: query,
          model: ContextDev::Models::BatchListResponse,
          options: options
        )
      end

      # Permanently delete a finished batch and its stored results. Active batches must
      # settle first.
      #
      # @overload delete(batch_id, request_options: {})
      #
      # @param batch_id [String] ID of the batch to retrieve or cancel.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BatchDeleteResponse]
      #
      # @see ContextDev::Models::BatchDeleteParams
      def delete(batch_id, params = {})
        @client.request(
          method: :delete,
          path: ["batch/%1$s", batch_id],
          model: ContextDev::Models::BatchDeleteResponse,
          options: params[:request_options]
        )
      end

      # Stop a batch from starting new pages. In-progress pages finish, and unused
      # credits are refunded.
      #
      # @overload cancel(batch_id, request_options: {})
      #
      # @param batch_id [String] ID of the batch to retrieve or cancel.
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BatchCancelResponse]
      #
      # @see ContextDev::Models::BatchCancelParams
      def cancel(batch_id, params = {})
        @client.request(
          method: :post,
          path: ["batch/%1$s/cancel", batch_id],
          model: ContextDev::Models::BatchCancelResponse,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BatchGetResultsParams} for more details.
      #
      # Page through a finished batch's results as JSON instead of downloading the
      # NDJSON files.
      #
      # @overload get_results(batch_id, cursor: nil, limit: nil, request_options: {})
      #
      # @param batch_id [String] ID of the batch to retrieve or cancel.
      #
      # @param cursor [String] next_cursor from the previous page.
      #
      # @param limit [Integer] Records per page. Defaults to 25. A page can close early so its payload stays un
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BatchGetResultsResponse]
      #
      # @see ContextDev::Models::BatchGetResultsParams
      def get_results(batch_id, params = {})
        parsed, options = ContextDev::BatchGetResultsParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: ["batch/%1$s/results", batch_id],
          query: query,
          model: ContextDev::Models::BatchGetResultsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BatchSubmitParams} for more details.
      #
      # Scrape 25K URLs or crawl large websites asynchronously.
      #
      # @overload submit(input:, tags: nil, webhook_url: nil, idempotency_key: nil, request_options: {})
      #
      # @param input [ContextDev::Models::BatchSubmitParams::Input::Scrape, ContextDev::Models::BatchSubmitParams::Input::Crawl] Body param: Choose a URL list or a site crawl.
      #
      # @param tags [Array<String>] Body param: Tags stored on the batch. Filter the batch list by them later.
      #
      # @param webhook_url [String] Body param: URL notified when the batch finishes.
      #
      # @param idempotency_key [String] Header param: Any string unique to this submission. Retries with the same key re
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BatchSubmitResponse]
      #
      # @see ContextDev::Models::BatchSubmitParams
      def submit(params)
        parsed, options = ContextDev::BatchSubmitParams.dump_request(params)
        header_params = {idempotency_key: "idempotency-key"}
        @client.request(
          method: :post,
          path: "batch/submit",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: ContextDev::Models::BatchSubmitResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [ContextDev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
