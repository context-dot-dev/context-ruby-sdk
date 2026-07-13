# typed: strong

module ContextDev
  module Resources
    class Parse
      # Converts raw text, source code, web/data, PDF, Microsoft Office, and image bytes
      # into LLM-usable Markdown. The base request costs 1 credit. When OCR runs
      # (requires ocr=true), the entire call costs 5 credits; ocr=true requests where no
      # OCR ends up running still cost 1 credit.
      sig do
        params(
          body: ContextDev::Internal::FileInput,
          extension: ContextDev::ParseHandleParams::Extension::OrSymbol,
          include_images: T::Boolean,
          include_links: T::Boolean,
          ocr: T::Boolean,
          pdf: ContextDev::ParseHandleParams::Pdf::OrHash,
          shorten_base64_images: T::Boolean,
          tags: T::Array[String],
          use_main_content_only: T::Boolean,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(ContextDev::Models::ParseHandleResponse)
      end
      def handle(
        # Body param
        body:,
        # Query param: Optional file extension hint. Case-insensitive; a leading dot is
        # accepted (e.g. ".pdf").
        extension: nil,
        # Query param: Include image references in Markdown output
        include_images: nil,
        # Query param: Preserve hyperlinks in Markdown output
        include_links: nil,
        # Query param: Gates all OCR. When true, PDFs get embedded-image OCR (recognized
        # text inserted at each image's position in page reading order, preserving the
        # text layer; pdf.start/pdf.end limit the page range), scanned PDFs with no text
        # layer get full-document OCR, and raster images get their visible text
        # transcribed. When false, no OCR runs: scanned PDFs may yield no content and
        # images return only format/dimension metadata. Calls where OCR actually runs cost
        # 5 credits instead of 1.
        ocr: nil,
        # Query param: PDF page-range controls. Use start/end to limit parsing (and OCR
        # when ocr=true) to an inclusive 1-based page range.
        pdf: nil,
        # Query param: Shorten base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Query param: Optional comma-separated caller-defined tags for tracking this
        # request. Tags are recorded on the request's usage log and can be used to filter
        # usage on the dashboard usage page. Up to 20 tags, each 1-50 characters.
        tags: nil,
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
