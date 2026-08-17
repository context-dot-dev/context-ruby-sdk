# frozen_string_literal: true

module ContextDev
  module Resources
    class Parse
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::ParseHandleParams} for more details.
      #
      # Converts raw text, source code, web/data, PDF, Microsoft Office, and image bytes
      # into LLM-usable Markdown.
      #
      # @overload handle(body:, client: nil, extension: nil, include_images: nil, include_links: nil, ocr: nil, pdf: nil, shorten_base64_images: nil, tags: nil, use_main_content_only: nil, zdr: nil, request_options: {})
      #
      # @param body [Pathname, StringIO, IO, String, ContextDev::FilePart] Body param
      #
      # @param client [String] Query param: Optional client identifier used for usage attribution.
      #
      # @param extension [Symbol, ContextDev::Models::ParseHandleParams::Extension] Query param: Optional file extension hint, such as pdf, docx, xlsx, pptx, html,
      #
      # @param include_images [Boolean] Query param: Include image references in Markdown output
      #
      # @param include_links [Boolean] Query param: Preserve hyperlinks in Markdown output
      #
      # @param ocr [Boolean] Query param: When true for PDF inputs, OCR the selected pages that have no usabl
      #
      # @param pdf [ContextDev::Models::ParseHandleParams::Pdf] Query param: PDF page-range options as a JSON object, e.g. {"start": 2, "end": 5
      #
      # @param shorten_base64_images [Boolean] Query param: Shorten base64-encoded image data in the Markdown output
      #
      # @param tags [Array<String>] Query param: Optional comma-separated caller-defined tags for tracking this requ
      #
      # @param use_main_content_only [Boolean] Query param: Extract only the main content from HTML-like inputs
      #
      # @param zdr [Symbol, ContextDev::Models::ParseHandleParams::Zdr] Query param: Set to enabled to bypass shared caches and omit request and respons
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
