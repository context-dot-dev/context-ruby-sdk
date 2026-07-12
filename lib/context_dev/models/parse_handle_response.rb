# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Parse#handle
    class ParseHandleResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute markdown
      #   Input bytes converted to GitHub Flavored Markdown
      #
      #   @return [String]
      required :markdown, String

      # @!attribute success
      #   Indicates success
      #
      #   @return [Boolean, ContextDev::Models::ParseHandleResponse::Success]
      required :success, enum: -> { ContextDev::Models::ParseHandleResponse::Success }

      # @!attribute type
      #   Detected content type used for parsing
      #
      #   @return [Symbol, ContextDev::Models::ParseHandleResponse::Type]
      required :type, enum: -> { ContextDev::Models::ParseHandleResponse::Type }

      # @!attribute key_metadata
      #   Metadata about the API key used for the request. Included in every response
      #   whenever a valid API key is provided, even when the response status is not 200.
      #
      #   @return [ContextDev::Models::ParseHandleResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::ParseHandleResponse::KeyMetadata }

      # @!method initialize(markdown:, success:, type:, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::ParseHandleResponse} for more details.
      #
      #   @param markdown [String] Input bytes converted to GitHub Flavored Markdown
      #
      #   @param success [Boolean, ContextDev::Models::ParseHandleResponse::Success] Indicates success
      #
      #   @param type [Symbol, ContextDev::Models::ParseHandleResponse::Type] Detected content type used for parsing
      #
      #   @param key_metadata [ContextDev::Models::ParseHandleResponse::KeyMetadata] Metadata about the API key used for the request. Included in every response when

      # Indicates success
      #
      # @see ContextDev::Models::ParseHandleResponse#success
      module Success
        extend ContextDev::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end

      # Detected content type used for parsing
      #
      # @see ContextDev::Models::ParseHandleResponse#type
      module Type
        extend ContextDev::Internal::Type::Enum

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
        #   The number of credits consumed by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   The number of credits remaining for your organization after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Metadata about the API key used for the request. Included in every response
        #   whenever a valid API key is provided, even when the response status is not 200.
        #
        #   @param credits_consumed [Integer] The number of credits consumed by this request.
        #
        #   @param credits_remaining [Integer] The number of credits remaining for your organization after this request.
      end
    end
  end
end
