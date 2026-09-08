# typed: strong

module ContextDev
  module Models
    class ParseHandleResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::ParseHandleResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Input bytes converted to GitHub Flavored Markdown
      sig { returns(String) }
      attr_accessor :markdown

      # Indicates success
      sig do
        returns(ContextDev::Models::ParseHandleResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      # Detected content type used for parsing
      sig do
        returns(ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol)
      end
      attr_accessor :type

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(T.nilable(ContextDev::Models::ParseHandleResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::ParseHandleResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          markdown: String,
          success: ContextDev::Models::ParseHandleResponse::Success::OrBoolean,
          type: ContextDev::Models::ParseHandleResponse::Type::OrSymbol,
          key_metadata:
            ContextDev::Models::ParseHandleResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Input bytes converted to GitHub Flavored Markdown
        markdown:,
        # Indicates success
        success:,
        # Detected content type used for parsing
        type:,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            markdown: String,
            success:
              ContextDev::Models::ParseHandleResponse::Success::TaggedBoolean,
            type: ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol,
            key_metadata: ContextDev::Models::ParseHandleResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      # Indicates success
      module Success
        extend ContextDev::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, ContextDev::Models::ParseHandleResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            ContextDev::Models::ParseHandleResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::ParseHandleResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end

      # Detected content type used for parsing
      module Type
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::ParseHandleResponse::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        HTML =
          T.let(
            :html,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        XML =
          T.let(
            :xml,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        JSON =
          T.let(
            :json,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        JSONL =
          T.let(
            :jsonl,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        TEXT =
          T.let(
            :text,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        CSV =
          T.let(
            :csv,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        TSV =
          T.let(
            :tsv,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        MARKDOWN =
          T.let(
            :markdown,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        YAML =
          T.let(
            :yaml,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        PYTHON =
          T.let(
            :python,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        JAVA =
          T.let(
            :java,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        JAVASCRIPT =
          T.let(
            :javascript,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        PHP =
          T.let(
            :php,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        SHELL =
          T.let(
            :shell,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        RUBY =
          T.let(
            :ruby,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        TYPESCRIPT =
          T.let(
            :typescript,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        RTF =
          T.let(
            :rtf,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        SRT =
          T.let(
            :srt,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        CSS =
          T.let(
            :css,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        SCSS =
          T.let(
            :scss,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        LESS =
          T.let(
            :less,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        STYLUS =
          T.let(
            :stylus,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        SASS =
          T.let(
            :sass,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        SVG =
          T.let(
            :svg,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        PDF =
          T.let(
            :pdf,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        DOCX =
          T.let(
            :docx,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        DOC =
          T.let(
            :doc,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        XLSX =
          T.let(
            :xlsx,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        XLS =
          T.let(
            :xls,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        PPTX =
          T.let(
            :pptx,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        PPT =
          T.let(
            :ppt,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        JPG =
          T.let(
            :jpg,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        PNG =
          T.let(
            :png,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        GIF =
          T.let(
            :gif,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        BMP =
          T.let(
            :bmp,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        TIFF =
          T.let(
            :tiff,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        WEBP =
          T.let(
            :webp,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        PPM =
          T.let(
            :ppm,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        PBM =
          T.let(
            :pbm,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        PGM =
          T.let(
            :pgm,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )
        PNM =
          T.let(
            :pnm,
            ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::ParseHandleResponse::Type::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::ParseHandleResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits used by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credit usage, included whenever a valid API key is provided.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits used by this request.
          credits_consumed:,
          # Credits remaining for your organization.
          credits_remaining:
        )
        end

        sig do
          override.returns(
            { credits_consumed: Integer, credits_remaining: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
