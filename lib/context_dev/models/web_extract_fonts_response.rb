# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#extract_fonts
    class WebExtractFontsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Cache outcome for this response. Composite responses are hits only when every
      #   cache-controlled fetch contributing to the output was a hit; age_ms is the
      #   oldest contributing hit.
      #
      #   @return [ContextDev::Models::WebExtractFontsResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::WebExtractFontsResponse::CacheMetadata }

      # @!attribute code
      #   HTTP status code, e.g., 200
      #
      #   @return [Integer]
      required :code, Integer

      # @!attribute domain
      #   The normalized domain that was processed
      #
      #   @return [String]
      required :domain, String

      # @!attribute fonts
      #   Array of font usage information
      #
      #   @return [Array<ContextDev::Models::WebExtractFontsResponse::Font>]
      required :fonts,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebExtractFontsResponse::Font] }

      # @!attribute status
      #   Status of the response, e.g., 'ok'
      #
      #   @return [String]
      required :status, String

      # @!attribute font_links
      #   Font assets keyed by family name as it appears in the fonts array (non-generic
      #   names only). Clients match entries in fonts to pick a file URL from files.
      #   Omitted when no families resolve to Google or custom @font-face URLs.
      #
      #   @return [Hash{Symbol=>ContextDev::Models::WebExtractFontsResponse::FontLink}, nil]
      optional :font_links,
               -> { ContextDev::Internal::Type::HashOf[ContextDev::Models::WebExtractFontsResponse::FontLink] },
               api_name: :fontLinks

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::WebExtractFontsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::WebExtractFontsResponse::KeyMetadata }

      # @!method initialize(cache_metadata:, code:, domain:, fonts:, status:, font_links: nil, key_metadata: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebExtractFontsResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::WebExtractFontsResponse::CacheMetadata] Cache outcome for this response. Composite responses are hits only when every ca
      #
      #   @param code [Integer] HTTP status code, e.g., 200
      #
      #   @param domain [String] The normalized domain that was processed
      #
      #   @param fonts [Array<ContextDev::Models::WebExtractFontsResponse::Font>] Array of font usage information
      #
      #   @param status [String] Status of the response, e.g., 'ok'
      #
      #   @param font_links [Hash{Symbol=>ContextDev::Models::WebExtractFontsResponse::FontLink}] Font assets keyed by family name as it appears in the fonts array (non-generic n
      #
      #   @param key_metadata [ContextDev::Models::WebExtractFontsResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.

      # @see ContextDev::Models::WebExtractFontsResponse#cache_metadata
      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute age_ms
        #   Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @return [Integer]
        required :age_ms, Integer

        # @!attribute status
        #   Whether the response was served from cache, required fresh work, or honored
        #   zero-data-retention cache bypass.
        #
        #   @return [Symbol, ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebExtractFontsResponse::CacheMetadata} for more details.
        #
        #   Cache outcome for this response. Composite responses are hits only when every
        #   cache-controlled fetch contributing to the output was a hit; age_ms is the
        #   oldest contributing hit.
        #
        #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @param status [Symbol, ContextDev::Models::WebExtractFontsResponse::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        #
        # @see ContextDev::Models::WebExtractFontsResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Font < ContextDev::Internal::Type::BaseModel
        # @!attribute fallbacks
        #   Array of fallback font families
        #
        #   @return [Array<String>]
        required :fallbacks, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute font
        #   Font family name
        #
        #   @return [String]
        required :font, String

        # @!attribute num_elements
        #   Number of elements using this font
        #
        #   @return [Float]
        required :num_elements, Float

        # @!attribute num_words
        #   Number of words using this font
        #
        #   @return [Float]
        required :num_words, Float

        # @!attribute percent_elements
        #   Percentage of elements using this font
        #
        #   @return [Float]
        required :percent_elements, Float

        # @!attribute percent_words
        #   Percentage of words using this font
        #
        #   @return [Float]
        required :percent_words, Float

        # @!attribute uses
        #   Array of CSS selectors or element types where this font is used
        #
        #   @return [Array<String>]
        required :uses, ContextDev::Internal::Type::ArrayOf[String]

        # @!method initialize(fallbacks:, font:, num_elements:, num_words:, percent_elements:, percent_words:, uses:)
        #   @param fallbacks [Array<String>] Array of fallback font families
        #
        #   @param font [String] Font family name
        #
        #   @param num_elements [Float] Number of elements using this font
        #
        #   @param num_words [Float] Number of words using this font
        #
        #   @param percent_elements [Float] Percentage of elements using this font
        #
        #   @param percent_words [Float] Percentage of words using this font
        #
        #   @param uses [Array<String>] Array of CSS selectors or element types where this font is used
      end

      class FontLink < ContextDev::Internal::Type::BaseModel
        # @!attribute files
        #   Upright font files keyed by weight string (e.g. "400" for regular, "500",
        #   "700"). Values are absolute URLs.
        #
        #   @return [Hash{Symbol=>String}]
        required :files, ContextDev::Internal::Type::HashOf[String]

        # @!attribute type
        #
        #   @return [Symbol, ContextDev::Models::WebExtractFontsResponse::FontLink::Type]
        required :type, enum: -> { ContextDev::Models::WebExtractFontsResponse::FontLink::Type }

        # @!attribute category
        #   Google Fonts category when type is google (e.g. sans-serif, serif, monospace,
        #   display, handwriting). Omitted for custom fonts when unknown.
        #
        #   @return [String, nil]
        optional :category, String

        # @!attribute display_name
        #   Present when type is custom: human-readable name derived from the fontLinks key
        #   (strip build/hash suffixes, split camelCase / PascalCase, normalize separators).
        #   Google entries omit this.
        #
        #   @return [String, nil]
        optional :display_name, String, api_name: :displayName

        # @!method initialize(files:, type:, category: nil, display_name: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::WebExtractFontsResponse::FontLink} for more details.
        #
        #   @param files [Hash{Symbol=>String}] Upright font files keyed by weight string (e.g. "400" for regular, "500", "700")
        #
        #   @param type [Symbol, ContextDev::Models::WebExtractFontsResponse::FontLink::Type]
        #
        #   @param category [String] Google Fonts category when type is google (e.g. sans-serif, serif, monospace, di
        #
        #   @param display_name [String] Present when type is custom: human-readable name derived from the fontLinks key

        # @see ContextDev::Models::WebExtractFontsResponse::FontLink#type
        module Type
          extend ContextDev::Internal::Type::Enum

          GOOGLE = :google
          CUSTOM = :custom

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::WebExtractFontsResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits used by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credit usage, included whenever a valid API key is provided.
        #
        #   @param credits_consumed [Integer] Credits used by this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end
    end
  end
end
