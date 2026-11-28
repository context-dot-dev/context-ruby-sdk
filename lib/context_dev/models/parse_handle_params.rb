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
      #   Client identifier for usage attribution.
      #
      #   @return [String, nil]
      optional :client, String

      # @!attribute extension
      #   File type hint, such as `pdf`, `docx`, `xlsx`, `pptx`, `html`, `json`, `csv`,
      #   `md`, `py`, `rtf`, `jpg`, `png`, `txt`, `warc`, or `warc.gz`. Use it when the
      #   `Content-Type` header is missing or generic.
      #
      #   @return [Symbol, ContextDev::Models::ParseHandleParams::Extension, nil]
      optional :extension, enum: -> { ContextDev::ParseHandleParams::Extension }

      # @!attribute include_images
      #   Include image references in the Markdown.
      #
      #   @return [Boolean, nil]
      optional :include_images, ContextDev::Internal::Type::Boolean

      # @!attribute include_links
      #   Keep link URLs in the Markdown.
      #
      #   @return [Boolean, nil]
      optional :include_links, ContextDev::Internal::Type::Boolean

      # @!attribute include_numbered_pages
      #   Start each PDF page in the Markdown with a `<!-- page N -->` line, where `N` is
      #   the original 1-based page number.
      #
      #   @return [Boolean, nil]
      optional :include_numbered_pages, ContextDev::Internal::Type::Boolean

      # @!attribute ocr
      #   Read text from images and scanned PDF pages with OCR, within the `pdf` page
      #   range. Adds 1 credit per page read.
      #
      #   @return [Boolean, nil]
      optional :ocr, ContextDev::Internal::Type::Boolean

      # @!attribute pdf
      #   PDF page range as a JSON object, such as `{"start": 2, "end": 5}`.
      #
      #   @return [ContextDev::Models::ParseHandleParams::Pdf, nil]
      optional :pdf, -> { ContextDev::ParseHandleParams::Pdf }

      # @!attribute shorten_base64_images
      #   Shorten inline base64 image data.
      #
      #   @return [Boolean, nil]
      optional :shorten_base64_images, ContextDev::Internal::Type::Boolean

      # @!attribute tags
      #   Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #   usage and request logs by them.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute use_main_content_only
      #   Keep only the main content, without navigation, headers, footers, or sidebars.
      #   Applies to HTML-like inputs.
      #
      #   @return [Boolean, nil]
      optional :use_main_content_only, ContextDev::Internal::Type::Boolean

      # @!attribute zdr
      #   `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      #   your organization has ZDR.
      #
      #   @return [Symbol, ContextDev::Models::ParseHandleParams::Zdr, nil]
      optional :zdr, enum: -> { ContextDev::ParseHandleParams::Zdr }

      # @!method initialize(body:, client: nil, extension: nil, include_images: nil, include_links: nil, include_numbered_pages: nil, ocr: nil, pdf: nil, shorten_base64_images: nil, tags: nil, use_main_content_only: nil, zdr: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::ParseHandleParams} for more details.
      #
      #   @param body [Pathname, StringIO, IO, String, ContextDev::FilePart]
      #
      #   @param client [String] Client identifier for usage attribution.
      #
      #   @param extension [Symbol, ContextDev::Models::ParseHandleParams::Extension] File type hint, such as `pdf`, `docx`, `xlsx`, `pptx`, `html`, `json`, `csv`, `m
      #
      #   @param include_images [Boolean] Include image references in the Markdown.
      #
      #   @param include_links [Boolean] Keep link URLs in the Markdown.
      #
      #   @param include_numbered_pages [Boolean] Start each PDF page in the Markdown with a `<!-- page N -->` line, where `N` is
      #
      #   @param ocr [Boolean] Read text from images and scanned PDF pages with OCR, within the `pdf` page rang
      #
      #   @param pdf [ContextDev::Models::ParseHandleParams::Pdf] PDF page range as a JSON object, such as `{"start": 2, "end": 5}`.
      #
      #   @param shorten_base64_images [Boolean] Shorten inline base64 image data.
      #
      #   @param tags [Array<String>] Comma-separated labels for this request, such as `production,team-alpha`. Filter
      #
      #   @param use_main_content_only [Boolean] Keep only the main content, without navigation, headers, footers, or sidebars. A
      #
      #   @param zdr [Symbol, ContextDev::Models::ParseHandleParams::Zdr] `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless you
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # File type hint, such as `pdf`, `docx`, `xlsx`, `pptx`, `html`, `json`, `csv`,
      # `md`, `py`, `rtf`, `jpg`, `png`, `txt`, `warc`, or `warc.gz`. Use it when the
      # `Content-Type` header is missing or generic.
      module Extension
        extend ContextDev::Internal::Type::Enum

        WARC = :warc
        WARC_GZ = :"warc.gz"
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
        #   Last page to parse. Defaults to the last page. Must be at least `start`.
        #
        #   @return [Integer, nil]
        optional :end_, Integer, api_name: :end

        # @!attribute start
        #   First page to parse, starting at 1.
        #
        #   @return [Integer, nil]
        optional :start, Integer

        # @!method initialize(end_: nil, start: nil)
        #   PDF page range as a JSON object, such as `{"start": 2, "end": 5}`.
        #
        #   @param end_ [Integer] Last page to parse. Defaults to the last page. Must be at least `start`.
        #
        #   @param start [Integer] First page to parse, starting at 1.
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
