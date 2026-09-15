# typed: strong

module ContextDev
  module Models
    class WebExtractFontsResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebExtractFontsResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Cache outcome for this response. Composite responses are hits only when every
      # cache-controlled fetch contributing to the output was a hit; age_ms is the
      # oldest contributing hit.
      sig do
        returns(ContextDev::Models::WebExtractFontsResponse::CacheMetadata)
      end
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebExtractFontsResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # HTTP status code, e.g., 200
      sig { returns(Integer) }
      attr_accessor :code

      # The normalized domain that was processed
      sig { returns(String) }
      attr_accessor :domain

      # Array of font usage information
      sig do
        returns(T::Array[ContextDev::Models::WebExtractFontsResponse::Font])
      end
      attr_accessor :fonts

      # Unique id of this API call, also sent in the X-Request-Id response header. Quote
      # it when contacting support about a failed request.
      sig { returns(String) }
      attr_accessor :request_id

      # Status of the response, e.g., 'ok'
      sig { returns(String) }
      attr_accessor :status

      # How complete the returned content is. `loaded` means the page finished the waits
      # the request asked for. `still-loading` only occurs with
      # timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
      # reached first, so the content reflects the DOM at that moment and late-rendering
      # parts may be missing. Partial results are billed at the base request cost.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebExtractFontsResponse::FinalDomState::TaggedSymbol
          )
        )
      end
      attr_reader :final_dom_state

      sig do
        params(
          final_dom_state:
            ContextDev::Models::WebExtractFontsResponse::FinalDomState::OrSymbol
        ).void
      end
      attr_writer :final_dom_state

      # Font assets keyed by family name as it appears in the fonts array (non-generic
      # names only). Clients match entries in fonts to pick a file URL from files.
      # Omitted when no families resolve to Google or custom @font-face URLs.
      sig do
        returns(
          T.nilable(
            T::Hash[
              Symbol,
              ContextDev::Models::WebExtractFontsResponse::FontLink
            ]
          )
        )
      end
      attr_reader :font_links

      sig do
        params(
          font_links:
            T::Hash[
              Symbol,
              ContextDev::Models::WebExtractFontsResponse::FontLink::OrHash
            ]
        ).void
      end
      attr_writer :font_links

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(
          T.nilable(ContextDev::Models::WebExtractFontsResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebExtractFontsResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebExtractFontsResponse::CacheMetadata::OrHash,
          code: Integer,
          domain: String,
          fonts:
            T::Array[ContextDev::Models::WebExtractFontsResponse::Font::OrHash],
          request_id: String,
          status: String,
          final_dom_state:
            ContextDev::Models::WebExtractFontsResponse::FinalDomState::OrSymbol,
          font_links:
            T::Hash[
              Symbol,
              ContextDev::Models::WebExtractFontsResponse::FontLink::OrHash
            ],
          key_metadata:
            ContextDev::Models::WebExtractFontsResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        cache_metadata:,
        # HTTP status code, e.g., 200
        code:,
        # The normalized domain that was processed
        domain:,
        # Array of font usage information
        fonts:,
        # Unique id of this API call, also sent in the X-Request-Id response header. Quote
        # it when contacting support about a failed request.
        request_id:,
        # Status of the response, e.g., 'ok'
        status:,
        # How complete the returned content is. `loaded` means the page finished the waits
        # the request asked for. `still-loading` only occurs with
        # timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
        # reached first, so the content reflects the DOM at that moment and late-rendering
        # parts may be missing. Partial results are billed at the base request cost.
        final_dom_state: nil,
        # Font assets keyed by family name as it appears in the fonts array (non-generic
        # names only). Clients match entries in fonts to pick a file URL from files.
        # Omitted when no families resolve to Google or custom @font-face URLs.
        font_links: nil,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            cache_metadata:
              ContextDev::Models::WebExtractFontsResponse::CacheMetadata,
            code: Integer,
            domain: String,
            fonts: T::Array[ContextDev::Models::WebExtractFontsResponse::Font],
            request_id: String,
            status: String,
            final_dom_state:
              ContextDev::Models::WebExtractFontsResponse::FinalDomState::TaggedSymbol,
            font_links:
              T::Hash[
                Symbol,
                ContextDev::Models::WebExtractFontsResponse::FontLink
              ],
            key_metadata:
              ContextDev::Models::WebExtractFontsResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractFontsResponse::CacheMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Age of the cached data in milliseconds. Zero for miss and zdr responses.
        sig { returns(Integer) }
        attr_accessor :age_ms

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        sig do
          returns(
            ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Age of the cached data in milliseconds. Zero for miss and zdr responses.
          age_ms:,
          # Whether the response was served from cache, required fresh work, or honored
          # zero-data-retention cache bypass.
          status:
        )
        end

        sig do
          override.returns(
            {
              age_ms: Integer,
              status:
                ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Font < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractFontsResponse::Font,
              ContextDev::Internal::AnyHash
            )
          end

        # Array of fallback font families
        sig { returns(T::Array[String]) }
        attr_accessor :fallbacks

        # Font family name
        sig { returns(String) }
        attr_accessor :font

        # Number of elements using this font
        sig { returns(Float) }
        attr_accessor :num_elements

        # Number of words using this font
        sig { returns(Float) }
        attr_accessor :num_words

        # Percentage of elements using this font
        sig { returns(Float) }
        attr_accessor :percent_elements

        # Percentage of words using this font
        sig { returns(Float) }
        attr_accessor :percent_words

        # Array of CSS selectors or element types where this font is used
        sig { returns(T::Array[String]) }
        attr_accessor :uses

        sig do
          params(
            fallbacks: T::Array[String],
            font: String,
            num_elements: Float,
            num_words: Float,
            percent_elements: Float,
            percent_words: Float,
            uses: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Array of fallback font families
          fallbacks:,
          # Font family name
          font:,
          # Number of elements using this font
          num_elements:,
          # Number of words using this font
          num_words:,
          # Percentage of elements using this font
          percent_elements:,
          # Percentage of words using this font
          percent_words:,
          # Array of CSS selectors or element types where this font is used
          uses:
        )
        end

        sig do
          override.returns(
            {
              fallbacks: T::Array[String],
              font: String,
              num_elements: Float,
              num_words: Float,
              percent_elements: Float,
              percent_words: Float,
              uses: T::Array[String]
            }
          )
        end
        def to_hash
        end
      end

      # How complete the returned content is. `loaded` means the page finished the waits
      # the request asked for. `still-loading` only occurs with
      # timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
      # reached first, so the content reflects the DOM at that moment and late-rendering
      # parts may be missing. Partial results are billed at the base request cost.
      module FinalDomState
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::Models::WebExtractFontsResponse::FinalDomState
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOADED =
          T.let(
            :loaded,
            ContextDev::Models::WebExtractFontsResponse::FinalDomState::TaggedSymbol
          )
        STILL_LOADING =
          T.let(
            :"still-loading",
            ContextDev::Models::WebExtractFontsResponse::FinalDomState::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebExtractFontsResponse::FinalDomState::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class FontLink < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractFontsResponse::FontLink,
              ContextDev::Internal::AnyHash
            )
          end

        # Upright font files keyed by weight string (e.g. "400" for regular, "500",
        # "700"). Values are absolute URLs.
        sig { returns(T::Hash[Symbol, String]) }
        attr_accessor :files

        sig do
          returns(
            ContextDev::Models::WebExtractFontsResponse::FontLink::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Google Fonts category when type is google (e.g. sans-serif, serif, monospace,
        # display, handwriting). Omitted for custom fonts when unknown.
        sig { returns(T.nilable(String)) }
        attr_reader :category

        sig { params(category: String).void }
        attr_writer :category

        # Present when type is custom: human-readable name derived from the fontLinks key
        # (strip build/hash suffixes, split camelCase / PascalCase, normalize separators).
        # Google entries omit this.
        sig { returns(T.nilable(String)) }
        attr_reader :display_name

        sig { params(display_name: String).void }
        attr_writer :display_name

        sig do
          params(
            files: T::Hash[Symbol, String],
            type:
              ContextDev::Models::WebExtractFontsResponse::FontLink::Type::OrSymbol,
            category: String,
            display_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Upright font files keyed by weight string (e.g. "400" for regular, "500",
          # "700"). Values are absolute URLs.
          files:,
          type:,
          # Google Fonts category when type is google (e.g. sans-serif, serif, monospace,
          # display, handwriting). Omitted for custom fonts when unknown.
          category: nil,
          # Present when type is custom: human-readable name derived from the fontLinks key
          # (strip build/hash suffixes, split camelCase / PascalCase, normalize separators).
          # Google entries omit this.
          display_name: nil
        )
        end

        sig do
          override.returns(
            {
              files: T::Hash[Symbol, String],
              type:
                ContextDev::Models::WebExtractFontsResponse::FontLink::Type::TaggedSymbol,
              category: String,
              display_name: String
            }
          )
        end
        def to_hash
        end

        module Type
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebExtractFontsResponse::FontLink::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          GOOGLE =
            T.let(
              :google,
              ContextDev::Models::WebExtractFontsResponse::FontLink::Type::TaggedSymbol
            )
          CUSTOM =
            T.let(
              :custom,
              ContextDev::Models::WebExtractFontsResponse::FontLink::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebExtractFontsResponse::FontLink::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractFontsResponse::KeyMetadata,
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
