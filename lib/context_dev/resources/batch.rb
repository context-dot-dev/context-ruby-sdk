# frozen_string_literal: true

module ContextDev
  module Resources
    # Scrape up to 100,000 URLs or crawl a site asynchronously.
    class Batch
      # Retrieve a batch's status, progress, and credit usage, plus links to download
      # its results once it finishes. Result files are deleted 180 days after the batch
      # finishes.
      #
      # @overload retrieve(batch_id, request_options: {})
      #
      # @param batch_id [String] ID of the batch.
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
      # List your batches, newest first. Filter by status or tags, or search by batch
      # ID, crawl source, or tag.
      #
      # @overload list(cursor: nil, limit: nil, q: nil, search_type: nil, status: nil, tags: nil, request_options: {})
      #
      # @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      # @param limit [Integer] Maximum number of batches to return per page.
      #
      # @param q [String] Search term matched against batch IDs, crawl sources (start URL or sitemap domai
      #
      # @param search_type [Symbol, ContextDev::Models::BatchListParams::SearchType] How `q` matches: `prefix` matches the start of a term, for search-as-you-type, a
      #
      # @param status [Symbol, ContextDev::Models::BatchListParams::Status] Filter by batch status.
      #
      # @param tags [String, Array<String>] Comma-separated tags. Returns batches that have any of them. You can also repeat
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
      # @param batch_id [String] ID of the batch.
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

      # Stop a batch from starting new pages. Pages already in progress finish, then the
      # batch becomes `cancelled` and unused credits are refunded.
      #
      # @overload cancel(batch_id, request_options: {})
      #
      # @param batch_id [String] ID of the batch.
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
      # Page through a finished batch's results as JSON. Each record's `result` has the
      # same outputs and per-format errors as `POST /web/scrape`. Results are kept for
      # 180 days after the batch finishes.
      #
      # @overload get_results(batch_id, cursor: nil, limit: nil, request_options: {})
      #
      # @param batch_id [String] ID of the batch.
      #
      # @param cursor [String] Cursor from the previous page's `next_cursor`. Omit for the first page.
      #
      # @param limit [Integer] Maximum number of results to return per page. A page can hold fewer to stay unde
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
      # Scrape up to 100,000 URLs, or crawl a site, asynchronously with every Scrape
      # Anything format and option from `POST /web/scrape`. Poll `GET /batch/{batch_id}`
      # or pass `webhook` to be notified when the batch finishes. URLs and credits are
      # checked after the batch is accepted, so a batch that fails those checks ends as
      # `failed` with a `failure` code instead of returning an error.
      #
      # @overload submit(input:, policies: nil, tags: nil, webhook: nil, idempotency_key: nil, request_options: {})
      #
      # @param input [ContextDev::Models::BatchSubmitParams::Input::Scrape, ContextDev::Models::BatchSubmitParams::Input::Crawl] Body param: What to scrape: a list of URLs (`scrape`) or a site crawl (`crawl`).
      #
      # @param policies [Array<String>] Body param: Access policy IDs to apply to every page; each URL must pass all of
      #
      # @param tags [Array<String>] Body param: Tags to store on the batch. Filter `GET /batch/list` by them later.
      #
      # @param webhook [ContextDev::Models::BatchSubmitParams::Webhook] Body param: Webhook to notify when the batch finishes. Omit `retry` for a single
      #
      # @param idempotency_key [String] Header param: Unique key for this submission. Retrying with the same key and bod
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
