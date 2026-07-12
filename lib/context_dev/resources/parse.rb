# frozen_string_literal: true

module ContextDev
  module Resources
    class Parse
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::ParseHandleParams} for more details.
      #
      # Converts raw text, source code, web/data, PDF, Microsoft Office, and image bytes
      # into LLM-usable Markdown. The base request costs 1 credit. When OCR runs
      # (requires ocr=true), the entire call costs 5 credits; ocr=true requests where no
      # OCR ends up running still cost 1 credit.
      #
      # @overload handle(body:, extension: nil, include_images: nil, include_links: nil, ocr: nil, pdf: nil, shorten_base64_images: nil, use_main_content_only: nil, request_options: {})
      #
      # @param body [Pathname, StringIO, IO, String, ContextDev::FilePart] Body param
      #
      # @param extension [Symbol, ContextDev::Models::ParseHandleParams::Extension] Query param: Optional file extension hint. Case-insensitive; a leading dot is ac
      #
      # @param include_images [Boolean] Query param: Include image references in Markdown output
      #
      # @param include_links [Boolean] Query param: Preserve hyperlinks in Markdown output
      #
      # @param ocr [Boolean] Query param: Gates all OCR. When true, PDFs get embedded-image OCR (recognized t
      #
      # @param pdf [ContextDev::Models::ParseHandleParams::Pdf] Query param: PDF page-range controls. Use start/end to limit parsing (and OCR wh
      #
      # @param shorten_base64_images [Boolean] Query param: Shorten base64-encoded image data in the Markdown output
      #
      # @param use_main_content_only [Boolean] Query param: Extract only the main content from HTML-like inputs
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::ParseHandleResponse]
      #
      # @see ContextDev::Models::ParseHandleParams
      def handle(params)
        parsed, options = ContextDev::ParseHandleParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed.except(:body))
        @client.request(
          method: :post,
          path: "parse",
          query: query,
          headers: {"content-type" => "application/octet-stream"},
          body: parsed[:body],
          model: ContextDev::Models::ParseHandleResponse,
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
