# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Parse#handle
    class ParseHandleParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Pathname, StringIO, IO, String, ContextDev::FilePart]
      required :body, ContextDev::Internal::Type::FileInput

      # @!attribute base_url
      #   Optional HTTP(S) source document URL used to resolve relative links and image
      #   references. Relative references remain relative when omitted.
      #
      #   @return [String, nil]
      optional :base_url, String

      # @!attribute extension
      #   Optional file extension hint, such as pdf, docx, xlsx, pptx, html, json, csv,
      #   md, py, rtf, jpg, png, or txt.
      #
      #   @return [String, nil]
      optional :extension, String

      # @!attribute filename
      #   Optional filename hint used to infer the extension when extension is omitted.
      #
      #   @return [String, nil]
      optional :filename, String

      # @!attribute include_images
      #   Include image references in Markdown output
      #
      #   @return [Boolean, nil]
      optional :include_images, ContextDev::Internal::Type::Boolean

      # @!attribute include_links
      #   Preserve hyperlinks in Markdown output
      #
      #   @return [Boolean, nil]
      optional :include_links, ContextDev::Internal::Type::Boolean

      # @!attribute ocr
      #   When true for PDF inputs, detect and OCR images embedded in the selected pages,
      #   inserting recognized text at each image's position in page reading order while
      #   preserving the PDF text layer. pdfStart/pdfEnd limit the inclusive page range.
      #   This is separate from automatic scanned-PDF OCR fallback.
      #
      #   @return [Boolean, nil]
      optional :ocr, ContextDev::Internal::Type::Boolean

      # @!attribute pdf_end
      #   Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
      #   Must be greater than or equal to pdfStart when both are provided.
      #
      #   @return [Integer, nil]
      optional :pdf_end, Integer

      # @!attribute pdf_start
      #   First 1-based PDF page to parse. When omitted, parsing starts at the first page.
      #
      #   @return [Integer, nil]
      optional :pdf_start, Integer

      # @!attribute shorten_base64_images
      #   Shorten base64-encoded image data in the Markdown output
      #
      #   @return [Boolean, nil]
      optional :shorten_base64_images, ContextDev::Internal::Type::Boolean

      # @!attribute use_main_content_only
      #   Extract only the main content from HTML-like inputs
      #
      #   @return [Boolean, nil]
      optional :use_main_content_only, ContextDev::Internal::Type::Boolean

      # @!method initialize(body:, base_url: nil, extension: nil, filename: nil, include_images: nil, include_links: nil, ocr: nil, pdf_end: nil, pdf_start: nil, shorten_base64_images: nil, use_main_content_only: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::ParseHandleParams} for more details.
      #
      #   @param body [Pathname, StringIO, IO, String, ContextDev::FilePart]
      #
      #   @param base_url [String] Optional HTTP(S) source document URL used to resolve relative links and image re
      #
      #   @param extension [String] Optional file extension hint, such as pdf, docx, xlsx, pptx, html, json, csv, md
      #
      #   @param filename [String] Optional filename hint used to infer the extension when extension is omitted.
      #
      #   @param include_images [Boolean] Include image references in Markdown output
      #
      #   @param include_links [Boolean] Preserve hyperlinks in Markdown output
      #
      #   @param ocr [Boolean] When true for PDF inputs, detect and OCR images embedded in the selected pages,
      #
      #   @param pdf_end [Integer] Last 1-based PDF page to parse. When omitted, parsing ends at the last page. Mus
      #
      #   @param pdf_start [Integer] First 1-based PDF page to parse. When omitted, parsing starts at the first page.
      #
      #   @param shorten_base64_images [Boolean] Shorten base64-encoded image data in the Markdown output
      #
      #   @param use_main_content_only [Boolean] Extract only the main content from HTML-like inputs
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
