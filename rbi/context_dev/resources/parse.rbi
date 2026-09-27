# typed: strong

module ContextDev
  module Resources
    class Parse
      # Convert uploaded file bytes into Markdown and optional HTML.
      sig do
        params(
          body: ContextDev::Internal::FileInput,
          client: String,
          extension: ContextDev::ParseHandleParams::Extension::OrSymbol,
          include_images: T::Boolean,
          include_links: T::Boolean,
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
        # Query param: Optional client identifier used for usage attribution.
        client: nil,
        # Query param: Optional file extension hint, such as pdf, docx, xlsx, pptx, html,
        # json, csv, md, py, rtf, jpg, png, or txt.
        extension: nil,
        # Query param: Include image references in Markdown output
        include_images: nil,
        # Query param: Preserve hyperlinks in Markdown output
        include_links: nil,
        # Query param: Read text from images and scanned PDF pages. PDF page ranges still
        # apply.
        ocr: nil,
        # Query param: PDF page-range options as a JSON object, e.g. {"start": 2, "end":
        # 5}.
        pdf: nil,
        # Query param: Shorten base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Query param: Comma-separated labels for filtering usage, e.g.
        # `production,team-alpha`.
        tags: nil,
        # Query param: Extract only the main content from HTML-like inputs
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
