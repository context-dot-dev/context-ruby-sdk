# typed: strong

module ContextDev
  module Models
    class ParseHandleParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::ParseHandleParams, ContextDev::Internal::AnyHash)
        end

      sig { returns(ContextDev::Internal::FileInput) }
      attr_accessor :body

      # Optional HTTP(S) source document URL used to resolve relative links and image
      # references. Relative references remain relative when omitted.
      sig { returns(T.nilable(String)) }
      attr_reader :base_url

      sig { params(base_url: String).void }
      attr_writer :base_url

      # Optional file extension hint, such as pdf, docx, xlsx, pptx, html, json, csv,
      # md, py, rtf, jpg, png, or txt.
      sig { returns(T.nilable(String)) }
      attr_reader :extension

      sig { params(extension: String).void }
      attr_writer :extension

      # Optional filename hint used to infer the extension when extension is omitted.
      sig { returns(T.nilable(String)) }
      attr_reader :filename

      sig { params(filename: String).void }
      attr_writer :filename

      # Include image references in Markdown output
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_images

      sig { params(include_images: T::Boolean).void }
      attr_writer :include_images

      # Preserve hyperlinks in Markdown output
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_links

      sig { params(include_links: T::Boolean).void }
      attr_writer :include_links

      # When true for PDF inputs, detect and OCR images embedded in the selected pages,
      # inserting recognized text at each image's position in page reading order while
      # preserving the PDF text layer. pdfStart/pdfEnd limit the inclusive page range.
      # This is separate from automatic scanned-PDF OCR fallback.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :ocr

      sig { params(ocr: T::Boolean).void }
      attr_writer :ocr

      # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
      # Must be greater than or equal to pdfStart when both are provided.
      sig { returns(T.nilable(Integer)) }
      attr_reader :pdf_end

      sig { params(pdf_end: Integer).void }
      attr_writer :pdf_end

      # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
      sig { returns(T.nilable(Integer)) }
      attr_reader :pdf_start

      sig { params(pdf_start: Integer).void }
      attr_writer :pdf_start

      # Shorten base64-encoded image data in the Markdown output
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :shorten_base64_images

      sig { params(shorten_base64_images: T::Boolean).void }
      attr_writer :shorten_base64_images

      # Extract only the main content from HTML-like inputs
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :use_main_content_only

      sig { params(use_main_content_only: T::Boolean).void }
      attr_writer :use_main_content_only

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
        ).returns(T.attached_class)
      end
      def self.new(
        body:,
        # Optional HTTP(S) source document URL used to resolve relative links and image
        # references. Relative references remain relative when omitted.
        base_url: nil,
        # Optional file extension hint, such as pdf, docx, xlsx, pptx, html, json, csv,
        # md, py, rtf, jpg, png, or txt.
        extension: nil,
        # Optional filename hint used to infer the extension when extension is omitted.
        filename: nil,
        # Include image references in Markdown output
        include_images: nil,
        # Preserve hyperlinks in Markdown output
        include_links: nil,
        # When true for PDF inputs, detect and OCR images embedded in the selected pages,
        # inserting recognized text at each image's position in page reading order while
        # preserving the PDF text layer. pdfStart/pdfEnd limit the inclusive page range.
        # This is separate from automatic scanned-PDF OCR fallback.
        ocr: nil,
        # Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
        # Must be greater than or equal to pdfStart when both are provided.
        pdf_end: nil,
        # First 1-based PDF page to parse. When omitted, parsing starts at the first page.
        pdf_start: nil,
        # Shorten base64-encoded image data in the Markdown output
        shorten_base64_images: nil,
        # Extract only the main content from HTML-like inputs
        use_main_content_only: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
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
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
