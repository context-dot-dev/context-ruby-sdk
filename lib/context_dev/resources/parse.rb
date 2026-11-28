# frozen_string_literal: true

module ContextDev
  module Resources
    # Convert uploaded files, such as PDFs and Office documents, into Markdown.
    class Parse
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::ParseHandleParams} for more details.
      #
      # Convert a file to Markdown. Handles PDF, Word, Excel, PowerPoint, HTML, XML,
      # CSV, JSON, YAML, source code, subtitles, images, and WARC archives. Send the raw
      # bytes as the request body; set `ocr=true` to read scanned pages and images.
      #
      # @overload handle(body:, client: nil, extension: nil, include_images: nil, include_links: nil, include_numbered_pages: nil, ocr: nil, pdf: nil, shorten_base64_images: nil, tags: nil, use_main_content_only: nil, zdr: nil, request_options: {})
      #
      # @param body [Pathname, StringIO, IO, String, ContextDev::FilePart] Body param
      #
      # @param client [String] Query param: Client identifier for usage attribution.
      #
      # @param extension [Symbol, ContextDev::Models::ParseHandleParams::Extension] Query param: File type hint, such as `pdf`, `docx`, `xlsx`, `pptx`, `html`, `jso
      #
      # @param include_images [Boolean] Query param: Include image references in the Markdown.
      #
      # @param include_links [Boolean] Query param: Keep link URLs in the Markdown.
      #
      # @param include_numbered_pages [Boolean] Query param: Start each PDF page in the Markdown with a `<!-- page N -->` line,
      #
      # @param ocr [Boolean] Query param: Read text from images and scanned PDF pages with OCR, within the `p
      #
      # @param pdf [ContextDev::Models::ParseHandleParams::Pdf] Query param: PDF page range as a JSON object, such as `{"start": 2, "end": 5}`.
      #
      # @param shorten_base64_images [Boolean] Query param: Shorten inline base64 image data.
      #
      # @param tags [Array<String>] Query param: Comma-separated labels for this request, such as `production,team-a
      #
      # @param use_main_content_only [Boolean] Query param: Keep only the main content, without navigation, headers, footers, o
      #
      # @param zdr [Symbol, ContextDev::Models::ParseHandleParams::Zdr] Query param: `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLE
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
