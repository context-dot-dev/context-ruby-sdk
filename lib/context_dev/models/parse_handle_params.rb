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

      # @!attribute client
      #   Optional client identifier used for usage attribution.
      #
      #   @return [String, nil]
      optional :client, String

      # @!attribute extension
      #   Optional file extension hint, such as pdf, docx, xlsx, pptx, html, json, csv,
      #   md, py, rtf, jpg, png, or txt.
      #
      #   @return [Symbol, ContextDev::Models::ParseHandleParams::Extension, nil]
      optional :extension, enum: -> { ContextDev::ParseHandleParams::Extension }

      # @!attribute include_images
      #   Include image references in Markdown output
      #
      #   @return [Boolean, Symbol, ContextDev::Models::ParseHandleParams::IncludeImages, nil]
      optional :include_images, union: -> { ContextDev::ParseHandleParams::IncludeImages }

      # @!attribute include_links
      #   Preserve hyperlinks in Markdown output
      #
      #   @return [Boolean, Symbol, ContextDev::Models::ParseHandleParams::IncludeLinks, nil]
      optional :include_links, union: -> { ContextDev::ParseHandleParams::IncludeLinks }

      # @!attribute ocr
      #   When true for PDF inputs, detect and OCR images embedded in the selected pages,
      #   inserting recognized text at each image's position in page reading order while
      #   preserving the PDF text layer. pdf.start/pdf.end limit the inclusive page range.
      #   When false, no OCR runs.
      #
      #   @return [Boolean, Symbol, ContextDev::Models::ParseHandleParams::Ocr, nil]
      optional :ocr, union: -> { ContextDev::ParseHandleParams::Ocr }

      # @!attribute pdf
      #   PDF page-range options as a JSON object, e.g. {"start": 2, "end": 5}.
      #
      #   @return [ContextDev::Models::ParseHandleParams::Pdf, nil]
      optional :pdf, -> { ContextDev::ParseHandleParams::Pdf }

      # @!attribute shorten_base64_images
      #   Shorten base64-encoded image data in the Markdown output
      #
      #   @return [Boolean, Symbol, ContextDev::Models::ParseHandleParams::ShortenBase64Images, nil]
      optional :shorten_base64_images, union: -> { ContextDev::ParseHandleParams::ShortenBase64Images }

      # @!attribute tags
      #   Optional comma-separated caller-defined tags for tracking this request. Tags are
      #   recorded on the request's usage log and can be used to filter usage on the
      #   dashboard usage page. Up to 20 tags, each 1-50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute use_main_content_only
      #   Extract only the main content from HTML-like inputs
      #
      #   @return [Boolean, Symbol, ContextDev::Models::ParseHandleParams::UseMainContentOnly, nil]
      optional :use_main_content_only, union: -> { ContextDev::ParseHandleParams::UseMainContentOnly }

      # @!attribute zdr
      #   Set to enabled to bypass shared caches and omit request and response content
      #   from retained usage logs. Requires zero data retention to be enabled for your
      #   organization (contact support@context.dev), otherwise the request fails with
      #   ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      #
      #   @return [Symbol, ContextDev::Models::ParseHandleParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::ParseHandleParams::Zdr }

      # @!method initialize(body:, client: nil, extension: nil, include_images: nil, include_links: nil, ocr: nil, pdf: nil, shorten_base64_images: nil, tags: nil, use_main_content_only: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::ParseHandleParams} for more details.
      #
      #   @param body [Pathname, StringIO, IO, String, ContextDev::FilePart]
      #
      #   @param client [String] Optional client identifier used for usage attribution.
      #
      #   @param extension [Symbol, ContextDev::Models::ParseHandleParams::Extension] Optional file extension hint, such as pdf, docx, xlsx, pptx, html, json, csv, md
      #
      #   @param include_images [Boolean, Symbol, ContextDev::Models::ParseHandleParams::IncludeImages] Include image references in Markdown output
      #
      #   @param include_links [Boolean, Symbol, ContextDev::Models::ParseHandleParams::IncludeLinks] Preserve hyperlinks in Markdown output
      #
      #   @param ocr [Boolean, Symbol, ContextDev::Models::ParseHandleParams::Ocr] When true for PDF inputs, detect and OCR images embedded in the selected pages,
      #
      #   @param pdf [ContextDev::Models::ParseHandleParams::Pdf] PDF page-range options as a JSON object, e.g. {"start": 2, "end": 5}.
      #
      #   @param shorten_base64_images [Boolean, Symbol, ContextDev::Models::ParseHandleParams::ShortenBase64Images] Shorten base64-encoded image data in the Markdown output
      #
      #   @param tags [Array<String>] Optional comma-separated caller-defined tags for tracking this request. Tags are
      #
      #   @param use_main_content_only [Boolean, Symbol, ContextDev::Models::ParseHandleParams::UseMainContentOnly] Extract only the main content from HTML-like inputs
      #
      #   @param zdr [Symbol, ContextDev::Models::ParseHandleParams::Zdr] Set to enabled to bypass shared caches and omit request and response content fro
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Optional file extension hint, such as pdf, docx, xlsx, pptx, html, json, csv,
      # md, py, rtf, jpg, png, or txt.
      module Extension
        extend ContextDev::Internal::Type::Enum

        TXT = :txt
        TEXT = :text
        MD = :md
        MARKDOWN = :markdown
        HTML = :html
        HTM = :htm
        XHTML = :xhtml
        XML = :xml
        RSS = :rss
        ATOM = :atom
        CSV = :csv
        TSV = :tsv
        YAML = :yaml
        YML = :yml
        PY = :py
        JAVA = :java
        JS = :js
        JSX = :jsx
        MJS = :mjs
        CJS = :cjs
        JSON = :json
        JSONL = :jsonl
        NDJSON = :ndjson
        PHP = :php
        SH = :sh
        BASH = :bash
        ZSH = :zsh
        FISH = :fish
        RB = :rb
        TS = :ts
        TSX = :tsx
        RTF = :rtf
        SRT = :srt
        CSS = :css
        SCSS = :scss
        LESS = :less
        STYL = :styl
        SASS = :sass
        SVG = :svg
        PDF = :pdf
        DOCX = :docx
        DOC = :doc
        XLSX = :xlsx
        XLSM = :xlsm
        XLSB = :xlsb
        XLTX = :xltx
        XLTM = :xltm
        XLS = :xls
        PPTX = :pptx
        PPTM = :pptm
        PPSX = :ppsx
        PPSM = :ppsm
        POTX = :potx
        POTM = :potm
        PPT = :ppt
        PPS = :pps
        POT = :pot
        JPG = :jpg
        JPEG = :jpeg
        JPE = :jpe
        PNG = :png
        GIF = :gif
        BMP = :bmp
        TIFF = :tiff
        TIF = :tif
        WEBP = :webp
        PPM = :ppm
        PBM = :pbm
        PGM = :pgm
        PNM = :pnm

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Include image references in Markdown output
      module IncludeImages
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::ParseHandleParams::IncludeImages::TRUE }

        variant const: -> { ContextDev::Models::ParseHandleParams::IncludeImages::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::ParseHandleParams::IncludeImages::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
      end

      # Preserve hyperlinks in Markdown output
      module IncludeLinks
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::ParseHandleParams::IncludeLinks::TRUE }

        variant const: -> { ContextDev::Models::ParseHandleParams::IncludeLinks::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::ParseHandleParams::IncludeLinks::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
      end

      # When true for PDF inputs, detect and OCR images embedded in the selected pages,
      # inserting recognized text at each image's position in page reading order while
      # preserving the PDF text layer. pdf.start/pdf.end limit the inclusive page range.
      # When false, no OCR runs.
      module Ocr
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::ParseHandleParams::Ocr::TRUE }

        variant const: -> { ContextDev::Models::ParseHandleParams::Ocr::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::ParseHandleParams::Ocr::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        # @!attribute end_
        #   Last 1-based PDF page to parse. When omitted, parsing ends at the last page.
        #   Must be greater than or equal to start when both are provided.
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute start
        #   First 1-based PDF page to parse. When omitted, parsing starts at the first page.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, start: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::ParseHandleParams::Pdf} for more details.
        #
        #   PDF page-range options as a JSON object, e.g. {"start": 2, "end": 5}.
        #
        #   @param end_ [Integer] Last 1-based PDF page to parse. When omitted, parsing ends at the last page. Mus
        #
        #   @param start [Integer] First 1-based PDF page to parse. When omitted, parsing starts at the first page.
      end

      # Shorten base64-encoded image data in the Markdown output
      module ShortenBase64Images
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::ParseHandleParams::ShortenBase64Images::TRUE }

        variant const: -> { ContextDev::Models::ParseHandleParams::ShortenBase64Images::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::ParseHandleParams::ShortenBase64Images::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
      end

      # Extract only the main content from HTML-like inputs
      module UseMainContentOnly
        extend ContextDev::Internal::Type::Union

        variant ContextDev::Internal::Type::Boolean

        variant const: -> { ContextDev::Models::ParseHandleParams::UseMainContentOnly::TRUE }

        variant const: -> { ContextDev::Models::ParseHandleParams::UseMainContentOnly::FALSE }

        # @!method self.variants
        #   @return [Array(Boolean, Symbol)]

        define_sorbet_constant!(:Variants) do
          T.type_alias { T.any(T::Boolean, ContextDev::ParseHandleParams::UseMainContentOnly::TaggedSymbol) }
        end

        # @!group

        TRUE = :true
        FALSE = :false

        # @!endgroup
      end

      # Set to enabled to bypass shared caches and omit request and response content
      # from retained usage logs. Requires zero data retention to be enabled for your
      # organization (contact support@context.dev), otherwise the request fails with
      # ZDR_NOT_ENABLED. Successful ZDR responses include X-Context-ZDR: true.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        ENABLED = :enabled
        DISABLED = :disabled

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
