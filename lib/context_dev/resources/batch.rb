# frozen_string_literal: true

module ContextDev
  module Resources
    class Batch
      # Check progress and get download links when the batch finishes. Also returns the
      # rejected-URL list from submission. The webhook signing secret is not repeated
      # here — it is returned once, by the submit response.
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
      # Page through the result records of a finished batch as JSON, in the same order
      # as the downloadable result files. Use this instead of downloading and parsing
      # the NDJSON files yourself.
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
      # Retrieve and normalize a person profile from identifiers.
      #
      # @overload submit(identifiers:, tags: nil, timeout_ms: nil, request_options: {})
      #
      # @param identifiers [ContextDev::Models::BatchSubmitParams::Identifiers] Known identifiers for the person. At least one identifier is required.
      #
      # @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BatchSubmitResponse]
      #
      # @see ContextDev::Models::BatchSubmitParams
      def submit(params)
        parsed, options = ContextDev::BatchSubmitParams.dump_request(params)
        @client.request(
          method: :post,
          path: "people/retrieve",
          body: parsed,
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
