# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Parse#handle
    class ParseHandleResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute markdown
      #   The file content as GitHub Flavored Markdown.
      #
      #   @return [String]
      required :markdown, String

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute success
      #   Always `true` for a successful parse.
      #
      #   @return [Boolean, ContextDev::Models::ParseHandleResponse::Success]
      required :success, enum: -> { ContextDev::Models::ParseHandleResponse::Success }

      # @!attribute type
      #   File type the input was parsed as.
      #
      #   @return [Symbol, ContextDev::Models::ParseHandleResponse::Type]
      required :type, enum: -> { ContextDev::Models::ParseHandleResponse::Type }

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::ParseHandleResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::ParseHandleResponse::KeyMetadata }

      # @!method initialize(markdown:, request_id:, success:, type:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::ParseHandleResponse} for more details.
      #
      #   @param markdown [String] The file content as GitHub Flavored Markdown.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param success [Boolean, ContextDev::Models::ParseHandleResponse::Success] Always `true` for a successful parse.
      #
      #   @param type [Symbol, ContextDev::Models::ParseHandleResponse::Type] File type the input was parsed as.
      #
      #   @param key_metadata [ContextDev::Models::ParseHandleResponse::KeyMetadata] Credits this request used and your remaining balance.

      # Always `true` for a successful parse.
      #
      # @see ContextDev::Models::ParseHandleResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # File type the input was parsed as.
      #
      # @see ContextDev::Models::ParseHandleResponse#type
      module Type
        extend ContextDev::Internal::Type::Enum

        WARC = :warc
        HTML = :html
        XML = :xml
        JSON = :json
        JSONL = :jsonl
        TEXT = :text
        CSV = :csv
        TSV = :tsv
        MARKDOWN = :markdown
        YAML = :yaml
        PYTHON = :python
        JAVA = :java
        JAVASCRIPT = :javascript
        PHP = :php
        SHELL = :shell
        RUBY = :ruby
        TYPESCRIPT = :typescript
        RTF = :rtf
        SRT = :srt
        CSS = :css
        SCSS = :scss
        LESS = :less
        STYLUS = :stylus
        SASS = :sass
        SVG = :svg
        PDF = :pdf
        DOCX = :docx
        DOC = :doc
        XLSX = :xlsx
        XLS = :xls
        PPTX = :pptx
        PPT = :ppt
        JPG = :jpg
        PNG = :png
        GIF = :gif
        BMP = :bmp
        TIFF = :tiff
        WEBP = :webp
        PPM = :ppm
        PBM = :pbm
        PGM = :pgm
        PNM = :pnm

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see ContextDev::Models::ParseHandleResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end
    end
  end
end
