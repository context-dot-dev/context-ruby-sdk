# typed: strong

module ContextDev
  module Resources
    # Convert uploaded files, such as PDFs and Office documents, into Markdown.
    class Parse
      # Convert a file to Markdown. Handles PDF, Word, Excel, PowerPoint, HTML, XML,
      # CSV, JSON, YAML, source code, subtitles, images, and WARC archives. Send the raw
      # bytes as the request body; set `ocr=true` to read scanned pages and images.
      sig do
        params(
          body: ContextDev::Internal::FileInput,
          client: String,
          extension: ContextDev::ParseHandleParams::Extension::OrSymbol,
          include_images: T::Boolean,
          include_links: T::Boolean,
          include_numbered_pages: T::Boolean,
          ocr: T::Boolean,
          pdf: ContextDev::ParseHandleParams::Pdf::OrHash,
          shorten_base64_images: T::Boolean,
          tags: T::Array[String],
          use_main_content_only: T::Boolean,
          zdr: ContextDev::ParseHandleParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::ParseHandleResponse)
      end
      def handle(
        # Body param
        body:,
        # Query param: Client identifier for usage attribution.
        client: nil,
        # Query param: File type hint, such as `pdf`, `docx`, `xlsx`, `pptx`, `html`,
        # `json`, `csv`, `md`, `py`, `rtf`, `jpg`, `png`, `txt`, `warc`, or `warc.gz`. Use
        # it when the `Content-Type` header is missing or generic.
        extension: nil,
        # Query param: Include image references in the Markdown.
        include_images: nil,
        # Query param: Keep link URLs in the Markdown.
        include_links: nil,
        # Query param: Start each PDF page in the Markdown with a `<!-- page N -->` line,
        # where `N` is the original 1-based page number.
        include_numbered_pages: nil,
        # Query param: Read text from images and scanned PDF pages with OCR, within the
        # `pdf` page range. Adds 1 credit per page read.
        ocr: nil,
        # Query param: PDF page range as a JSON object, such as `{"start": 2, "end": 5}`.
        pdf: nil,
        # Query param: Shorten inline base64 image data.
        shorten_base64_images: nil,
        # Query param: Comma-separated labels for this request, such as
        # `production,team-alpha`. Filter usage and request logs by them.
        tags: nil,
        # Query param: Keep only the main content, without navigation, headers, footers,
        # or sidebars. Applies to HTML-like inputs.
        use_main_content_only: nil,
        # Query param: `enabled` turns on zero data retention. Returns 403
        # `ZDR_NOT_ENABLED` unless your organization has ZDR.
        zdr: nil,
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
