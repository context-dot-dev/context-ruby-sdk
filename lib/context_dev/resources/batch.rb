# frozen_string_literal: true

module ContextDev
  module Resources
    # Scrape many pages or crawl a site asynchronously.
    class Batch
      # Get batch progress and result download links. Result files are deleted 180 days
      # after the batch finishes.
      #
      # @overload retrieve(batch_id, request_options: {})
      #
      # @param batch_id [String] Batch ID.
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
      # List your batches, newest first, with optional filters.
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
      # @param tags [String, Array<String>] Tags to filter by (matches batches having any of them). Pass repeated `tags` par
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

      # Permanently delete a finished batch and its results. Its webhook deliveries can
      # no longer be retried.
      #
      # @overload delete(batch_id, request_options: {})
      #
      # @param batch_id [String] Batch ID.
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

      # Stop a batch from starting new pages. Pages already in progress finish before
      # the batch becomes cancelled.
      #
      # @overload cancel(batch_id, request_options: {})
      #
      # @param batch_id [String] Batch ID.
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
      # Page through a finished batch’s results as JSON. Results remain available for
      # 180 days.
      #
      # @overload get_results(batch_id, cursor: nil, limit: nil, request_options: {})
      #
      # @param batch_id [String] Batch ID.
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
      # Scrape up to 25,000 URLs, or crawl a site, asynchronously. Poll the batch ID or
      # receive a webhook when it finishes.
      #
      # @overload submit(input:, tags: nil, webhook: nil, webhook_url: nil, idempotency_key: nil, request_options: {})
      #
      # @param input [ContextDev::Models::BatchSubmitParams::Input::Scrape, ContextDev::Models::BatchSubmitParams::Input::Crawl] Body param: Choose a URL list or a site crawl.
      #
      # @param tags [Array<String>] Body param: Tags stored on the batch. Filter the batch list by them later.
      #
      # @param webhook [ContextDev::Models::BatchSubmitParams::Webhook] Body param: Where to send the batch's final-status event. Omit `retry` for one a
      #
      # @param webhook_url [String] Body param: Legacy URL notified when the batch finishes. Preserves one best-effo
      #
      # @param idempotency_key [String] Header param: Unique key per submission. Retrying with the same key and body ret
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
