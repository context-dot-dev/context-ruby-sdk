# typed: strong

module ContextDev
  module Resources
    class Parse
      # Converts raw text, source code, web/data, PDF, Microsoft Office, and image bytes
      # into LLM-usable Markdown.
      sig do
        params(
          body: ContextDev::Internal::FileInput,
          client: String,
          extension: ContextDev::ParseHandleParams::Extension::OrSymbol,
          include_images:
            T.any(
              T::Boolean,
              ContextDev::ParseHandleParams::IncludeImages::OrSymbol
            ),
          include_links:
            T.any(
              T::Boolean,
              ContextDev::ParseHandleParams::IncludeLinks::OrSymbol
            ),
          ocr: T.any(T::Boolean, ContextDev::ParseHandleParams::Ocr::OrSymbol),
          pdf: ContextDev::ParseHandleParams::Pdf::OrHash,
          shorten_base64_images:
            T.any(
              T::Boolean,
              ContextDev::ParseHandleParams::ShortenBase64Images::OrSymbol
            ),
          tags: T::Array[String],
          use_main_content_only:
            T.any(
              T::Boolean,
              ContextDev::ParseHandleParams::UseMainContentOnly::OrSymbol
            ),
          zdr: ContextDev::ParseHandleParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::ParseHandleResponse)
      end
      def handle(
        # Body param
        body:,
        # Query param: Optional client identifier used for usage attribution.
        client: nil,
        # Query param: Optional file extension hint, such as pdf, docx, xlsx, pptx, html,
        # json, csv, md, py, rtf, jpg, png, or txt.
        extension: nil,
        # Query param: Include image references in Markdown output
        include_images: nil,
        # Query param: Preserve hyperlinks in Markdown output
        include_links: nil,
        # Query param: When true for PDF inputs, detect and OCR images embedded in the
        # selected pages, inserting recognized text at each image's position in page
        # reading order while preserving the PDF text layer. pdf.start/pdf.end limit the
        # inclusive page range. When false, all OCR is disabled, including the automatic
        # scanned-PDF fallback.
        ocr: nil,
        # Query param: PDF page-range options as a JSON object, e.g. {"start": 2, "end":
        # 5}.
        pdf: nil,
        # Query param: Shorten base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Query param: Optional comma-separated caller-defined tags for tracking this
        # request. Tags are recorded on the request's usage log and can be used to filter
        # usage on the dashboard usage page. Up to 20 tags, each 1-50 characters.
        tags: nil,
        # Query param: Extract only the main content from HTML-like inputs
        use_main_content_only: nil,
        # Query param: Set to enabled to bypass shared caches and omit request and
        # response content from retained usage logs. Requires zero data retention to be
        # enabled for your organization (contact support@context.dev), otherwise the
        # request fails with ZDR_NOT_ENABLED. Successful ZDR responses include
        # X-Context-ZDR: true.
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
