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
      # @overload handle(body:, base_url: nil, extension: nil, filename: nil, include_images: nil, include_links: nil, ocr: nil, pdf_end: nil, pdf_start: nil, shorten_base64_images: nil, use_main_content_only: nil, request_options: {})
      #
      # @param body [Pathname, StringIO, IO, String, ContextDev::FilePart] Body param
      #
      # @param base_url [String] Query param: Optional HTTP(S) source document URL used to resolve relative links
      #
      # @param extension [String] Query param: Optional file extension hint, such as pdf, docx, xlsx, pptx, html,
      #
      # @param filename [String] Query param: Optional filename hint used to infer the extension when extension i
      #
      # @param include_images [Boolean] Query param: Include image references in Markdown output
      #
      # @param include_links [Boolean] Query param: Preserve hyperlinks in Markdown output
      #
      # @param ocr [Boolean] Query param: When true for PDF inputs, detect and OCR images embedded in the sel
      #
      # @param pdf_end [Integer] Query param: Last 1-based PDF page to parse. When omitted, parsing ends at the l
      #
      # @param pdf_start [Integer] Query param: First 1-based PDF page to parse. When omitted, parsing starts at th
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
