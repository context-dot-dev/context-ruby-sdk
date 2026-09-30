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
      #   @return [Boolean, nil]
      optional :include_images, ContextDev::Internal::Type::Boolean

      # @!attribute include_links
      #   Preserve hyperlinks in Markdown output
      #
      #   @return [Boolean, nil]
      optional :include_links, ContextDev::Internal::Type::Boolean

      # @!attribute ocr
      #   Read text from images and scanned PDF pages. PDF page ranges still apply.
      #
      #   @return [Boolean, nil]
      optional :ocr, ContextDev::Internal::Type::Boolean

      # @!attribute pdf
      #   PDF page-range options as a JSON object, e.g. {"start": 2, "end": 5}.
      #
      #   @return [ContextDev::Models::ParseHandleParams::Pdf, nil]
      optional :pdf, -> { ContextDev::ParseHandleParams::Pdf }

      # @!attribute shorten_base64_images
      #   Shorten base64-encoded image data in the Markdown output
      #
      #   @return [Boolean, nil]
      optional :shorten_base64_images, ContextDev::Internal::Type::Boolean

      # @!attribute tags
      #   Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute use_main_content_only
      #   Extract only the main content from HTML-like inputs
      #
      #   @return [Boolean, nil]
      optional :use_main_content_only, ContextDev::Internal::Type::Boolean

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
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
      #   @param include_images [Boolean] Include image references in Markdown output
      #
      #   @param include_links [Boolean] Preserve hyperlinks in Markdown output
      #
      #   @param ocr [Boolean] Read text from images and scanned PDF pages. PDF page ranges still apply.
      #
      #   @param pdf [ContextDev::Models::ParseHandleParams::Pdf] PDF page-range options as a JSON object, e.g. {"start": 2, "end": 5}.
      #
      #   @param shorten_base64_images [Boolean] Shorten base64-encoded image data in the Markdown output
      #
      #   @param tags [Array<String>] Comma-separated labels for filtering usage, e.g. `production,team-alpha`.
      #
      #   @param use_main_content_only [Boolean] Extract only the main content from HTML-like inputs
      #
      #   @param zdr [Symbol, ContextDev::Models::ParseHandleParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
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

      class Pdf < ContextDev::Internal::Type::BaseModel
        # @!attribute end_
        #   Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must
        #   be >= start.
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute start
        #   First 1-based PDF page to parse.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, start: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::ParseHandleParams::Pdf} for more details.
        #
        #   PDF page-range options as a JSON object, e.g. {"start": 2, "end": 5}.
        #
        #   @param end_ [Integer] Last PDF page to parse (1-based, inclusive). Defaults to the final page. Must be
        #
        #   @param start [Integer] First 1-based PDF page to parse.
      end

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
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
