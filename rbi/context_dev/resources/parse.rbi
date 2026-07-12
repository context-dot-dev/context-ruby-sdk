# typed: strong

module ContextDev
  module Resources
    class Parse
      # Converts raw text, source code, web/data, PDF, Microsoft Office, and image bytes
      # into LLM-usable Markdown.
      sig do
        params(
          body: ContextDev::Internal::FileInput,
          base_url: String,
          extension: String,
          filename: String,
          include_images: T::Boolean,
          include_links: T::Boolean,
          ocr: T::Boolean,
          pdf_end: Integer,
          pdf_start: Integer,
          shorten_base64_images: T::Boolean,
          use_main_content_only: T::Boolean,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::ParseHandleResponse)
      end
      def handle(
        # Body param
        body:,
        # Query param: Optional HTTP(S) source document URL used to resolve relative links
        # and image references. Relative references remain relative when omitted.
        base_url: nil,
        # Query param: Optional file extension hint, such as pdf, docx, xlsx, pptx, html,
        # json, csv, md, py, rtf, jpg, png, or txt.
        extension: nil,
        # Query param: Optional filename hint used to infer the extension when extension
        # is omitted.
        filename: nil,
        # Query param: Include image references in Markdown output
        include_images: nil,
        # Query param: Preserve hyperlinks in Markdown output
        include_links: nil,
        # Query param: When true for PDF inputs, detect and OCR images embedded in the
        # selected pages, inserting recognized text at each image's position in page
        # reading order while preserving the PDF text layer. pdfStart/pdfEnd limit the
        # inclusive page range. This is separate from automatic scanned-PDF OCR fallback.
        ocr: nil,
        # Query param: Last 1-based PDF page to parse. When omitted, parsing ends at the
        # last page. Must be greater than or equal to pdfStart when both are provided.
        pdf_end: nil,
        # Query param: First 1-based PDF page to parse. When omitted, parsing starts at
        # the first page.
        pdf_start: nil,
        # Query param: Shorten base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Query param: Extract only the main content from HTML-like inputs
        use_main_content_only: nil,
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
