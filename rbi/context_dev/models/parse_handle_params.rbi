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

      # Client identifier for usage attribution.
      sig { returns(T.nilable(String)) }
      attr_reader :client

      sig { params(client: String).void }
      attr_writer :client

      # File type hint, such as `pdf`, `docx`, `xlsx`, `pptx`, `html`, `json`, `csv`,
      # `md`, `py`, `rtf`, `jpg`, `png`, `txt`, `warc`, or `warc.gz`. Use it when the
      # `Content-Type` header is missing or generic.
      sig do
        returns(T.nilable(ContextDev::ParseHandleParams::Extension::OrSymbol))
      end
      attr_reader :extension

      sig do
        params(
          extension: ContextDev::ParseHandleParams::Extension::OrSymbol
        ).void
      end
      attr_writer :extension

      # Include image references in the Markdown.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_images

      sig { params(include_images: T::Boolean).void }
      attr_writer :include_images

      # Keep link URLs in the Markdown.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_links

      sig { params(include_links: T::Boolean).void }
      attr_writer :include_links

      # Start each PDF page in the Markdown with a `<!-- page N -->` line, where `N` is
      # the original 1-based page number.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :include_numbered_pages

      sig { params(include_numbered_pages: T::Boolean).void }
      attr_writer :include_numbered_pages

      # Read text from images and scanned PDF pages with OCR, within the `pdf` page
      # range. Adds 1 credit per page read.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :ocr

      sig { params(ocr: T::Boolean).void }
      attr_writer :ocr

      # PDF page range as a JSON object, such as `{"start": 2, "end": 5}`.
      sig { returns(T.nilable(ContextDev::ParseHandleParams::Pdf)) }
      attr_reader :pdf

      sig { params(pdf: ContextDev::ParseHandleParams::Pdf::OrHash).void }
      attr_writer :pdf

      # Shorten inline base64 image data.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :shorten_base64_images

      sig { params(shorten_base64_images: T::Boolean).void }
      attr_writer :shorten_base64_images

      # Comma-separated labels for this request, such as `production,team-alpha`. Filter
      # usage and request logs by them.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

      # Keep only the main content, without navigation, headers, footers, or sidebars.
      # Applies to HTML-like inputs.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :use_main_content_only

      sig { params(use_main_content_only: T::Boolean).void }
      attr_writer :use_main_content_only

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      sig { returns(T.nilable(ContextDev::ParseHandleParams::Zdr::OrSymbol)) }
      attr_reader :zdr

      sig { params(zdr: ContextDev::ParseHandleParams::Zdr::OrSymbol).void }
      attr_writer :zdr

      sig do
        params(
          body: ContextDev::Internal::FileInput,
          client: String,
          extension: ContextDev::ParseHandleParams::Extension::OrSymbol,
          include_images: T::Boolean,
          include_links: T::Boolean,
          include_numbered_pages: T::Boolean,
          ocr: T::Boolean,
          pdf: ContextDev::ParseHandleParams::Pdf::OrHash,
          shorten_base64_images: T::Boolean,
          tags: T::Array[String],
          use_main_content_only: T::Boolean,
          zdr: ContextDev::ParseHandleParams::Zdr::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        body:,
        # Client identifier for usage attribution.
        client: nil,
        # File type hint, such as `pdf`, `docx`, `xlsx`, `pptx`, `html`, `json`, `csv`,
        # `md`, `py`, `rtf`, `jpg`, `png`, `txt`, `warc`, or `warc.gz`. Use it when the
        # `Content-Type` header is missing or generic.
        extension: nil,
        # Include image references in the Markdown.
        include_images: nil,
        # Keep link URLs in the Markdown.
        include_links: nil,
        # Start each PDF page in the Markdown with a `<!-- page N -->` line, where `N` is
        # the original 1-based page number.
        include_numbered_pages: nil,
        # Read text from images and scanned PDF pages with OCR, within the `pdf` page
        # range. Adds 1 credit per page read.
        ocr: nil,
        # PDF page range as a JSON object, such as `{"start": 2, "end": 5}`.
        pdf: nil,
        # Shorten inline base64 image data.
        shorten_base64_images: nil,
        # Comma-separated labels for this request, such as `production,team-alpha`. Filter
        # usage and request logs by them.
        tags: nil,
        # Keep only the main content, without navigation, headers, footers, or sidebars.
        # Applies to HTML-like inputs.
        use_main_content_only: nil,
        # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
        # your organization has ZDR.
        zdr: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body: ContextDev::Internal::FileInput,
            client: String,
            extension: ContextDev::ParseHandleParams::Extension::OrSymbol,
            include_images: T::Boolean,
            include_links: T::Boolean,
            include_numbered_pages: T::Boolean,
            ocr: T::Boolean,
            pdf: ContextDev::ParseHandleParams::Pdf,
            shorten_base64_images: T::Boolean,
            tags: T::Array[String],
            use_main_content_only: T::Boolean,
            zdr: ContextDev::ParseHandleParams::Zdr::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # File type hint, such as `pdf`, `docx`, `xlsx`, `pptx`, `html`, `json`, `csv`,
      # `md`, `py`, `rtf`, `jpg`, `png`, `txt`, `warc`, or `warc.gz`. Use it when the
      # `Content-Type` header is missing or generic.
      module Extension
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::ParseHandleParams::Extension)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WARC =
          T.let(:warc, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        WARC_GZ =
          T.let(
            :"warc.gz",
            ContextDev::ParseHandleParams::Extension::TaggedSymbol
          )
        TXT =
          T.let(:txt, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        TEXT =
          T.let(:text, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        MD = T.let(:md, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        MARKDOWN =
          T.let(
            :markdown,
            ContextDev::ParseHandleParams::Extension::TaggedSymbol
          )
        HTML =
          T.let(:html, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        HTM =
          T.let(:htm, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        XHTML =
          T.let(:xhtml, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        XML =
          T.let(:xml, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        RSS =
          T.let(:rss, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        ATOM =
          T.let(:atom, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        CSV =
          T.let(:csv, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        TSV =
          T.let(:tsv, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        YAML =
          T.let(:yaml, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        YML =
          T.let(:yml, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PY = T.let(:py, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        JAVA =
          T.let(:java, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        JS = T.let(:js, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        JSX =
          T.let(:jsx, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        MJS =
          T.let(:mjs, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        CJS =
          T.let(:cjs, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        JSON =
          T.let(:json, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        JSONL =
          T.let(:jsonl, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        NDJSON =
          T.let(:ndjson, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PHP =
          T.let(:php, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        SH = T.let(:sh, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        BASH =
          T.let(:bash, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        ZSH =
          T.let(:zsh, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        FISH =
          T.let(:fish, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        RB = T.let(:rb, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        TS = T.let(:ts, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        TSX =
          T.let(:tsx, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        RTF =
          T.let(:rtf, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        SRT =
          T.let(:srt, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        CSS =
          T.let(:css, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        SCSS =
          T.let(:scss, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        LESS =
          T.let(:less, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        STYL =
          T.let(:styl, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        SASS =
          T.let(:sass, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        SVG =
          T.let(:svg, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PDF =
          T.let(:pdf, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        DOCX =
          T.let(:docx, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        DOC =
          T.let(:doc, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        XLSX =
          T.let(:xlsx, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        XLSM =
          T.let(:xlsm, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        XLSB =
          T.let(:xlsb, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        XLTX =
          T.let(:xltx, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        XLTM =
          T.let(:xltm, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        XLS =
          T.let(:xls, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PPTX =
          T.let(:pptx, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PPTM =
          T.let(:pptm, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PPSX =
          T.let(:ppsx, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PPSM =
          T.let(:ppsm, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        POTX =
          T.let(:potx, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        POTM =
          T.let(:potm, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PPT =
          T.let(:ppt, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PPS =
          T.let(:pps, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        POT =
          T.let(:pot, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        JPG =
          T.let(:jpg, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        JPEG =
          T.let(:jpeg, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        JPE =
          T.let(:jpe, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PNG =
          T.let(:png, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        GIF =
          T.let(:gif, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        BMP =
          T.let(:bmp, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        TIFF =
          T.let(:tiff, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        TIF =
          T.let(:tif, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        WEBP =
          T.let(:webp, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PPM =
          T.let(:ppm, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PBM =
          T.let(:pbm, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PGM =
          T.let(:pgm, ContextDev::ParseHandleParams::Extension::TaggedSymbol)
        PNM =
          T.let(:pnm, ContextDev::ParseHandleParams::Extension::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::ParseHandleParams::Extension::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Pdf < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::ParseHandleParams::Pdf,
              ContextDev::Internal::AnyHash
            )
          end

        # Last page to parse. Defaults to the last page. Must be at least `start`.
        sig { returns(T.nilable(Integer)) }
        attr_reader :end_

        sig { params(end_: Integer).void }
        attr_writer :end_

        # First page to parse, starting at 1.
        sig { returns(T.nilable(Integer)) }
        attr_reader :start

        sig { params(start: Integer).void }
        attr_writer :start

        # PDF page range as a JSON object, such as `{"start": 2, "end": 5}`.
        sig { params(end_: Integer, start: Integer).returns(T.attached_class) }
        def self.new(
          # Last page to parse. Defaults to the last page. Must be at least `start`.
          end_: nil,
          # First page to parse, starting at 1.
          start: nil
        )
        end

        sig { override.returns({ end_: Integer, start: Integer }) }
        def to_hash
        end
      end

      # `enabled` turns on zero data retention. Returns 403 `ZDR_NOT_ENABLED` unless
      # your organization has ZDR.
      module Zdr
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::ParseHandleParams::Zdr) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENABLED =
          T.let(:enabled, ContextDev::ParseHandleParams::Zdr::TaggedSymbol)
        DISABLED =
          T.let(:disabled, ContextDev::ParseHandleParams::Zdr::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::ParseHandleParams::Zdr::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
