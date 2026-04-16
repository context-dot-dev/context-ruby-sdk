# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Style#extract_styleguide
    class StyleExtractStyleguideResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute code
      #   HTTP status code
      #
      #   @return [Integer, nil]
      optional :code, Integer

      # @!attribute domain
      #   The normalized domain that was processed
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute status
      #   Status of the response, e.g., 'ok'
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute styleguide
      #   Comprehensive styleguide data extracted from the website
      #
      #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide, nil]
      optional :styleguide, -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide }

      # @!method initialize(code: nil, domain: nil, status: nil, styleguide: nil)
      #   @param code [Integer] HTTP status code
      #
      #   @param domain [String] The normalized domain that was processed
      #
      #   @param status [String] Status of the response, e.g., 'ok'
      #
      #   @param styleguide [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide] Comprehensive styleguide data extracted from the website

      # @see ContextDev::Models::StyleExtractStyleguideResponse#styleguide
      class Styleguide < ContextDev::Internal::Type::BaseModel
        # @!attribute colors
        #   Primary colors used on the website
        #
        #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Colors]
        required :colors, -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Colors }

        # @!attribute components
        #   UI component styles
        #
        #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components]
        required :components, -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components }

        # @!attribute element_spacing
        #   Spacing system used on the website
        #
        #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::ElementSpacing]
        required :element_spacing,
                 -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::ElementSpacing },
                 api_name: :elementSpacing

        # @!attribute font_links
        #   Font assets keyed by family name as it appears in fontFamily/fontFallbacks
        #   (non-generic names only). Clients match typography.fontFamily / fontWeight or
        #   button styles to pick a file URL from files.
        #
        #   @return [Hash{Symbol=>ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::FontLink}]
        required :font_links,
                 -> { ContextDev::Internal::Type::HashOf[ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::FontLink] },
                 api_name: :fontLinks

        # @!attribute mode
        #   The primary color mode of the website design
        #
        #   @return [Symbol, ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Mode]
        required :mode, enum: -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Mode }

        # @!attribute shadows
        #   Shadow styles used on the website
        #
        #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Shadows]
        required :shadows, -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Shadows }

        # @!attribute typography
        #   Typography styles used on the website
        #
        #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography]
        required :typography, -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography }

        # @!method initialize(colors:, components:, element_spacing:, font_links:, mode:, shadows:, typography:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::StyleExtractStyleguideResponse::Styleguide} for more
        #   details.
        #
        #   Comprehensive styleguide data extracted from the website
        #
        #   @param colors [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Colors] Primary colors used on the website
        #
        #   @param components [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components] UI component styles
        #
        #   @param element_spacing [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::ElementSpacing] Spacing system used on the website
        #
        #   @param font_links [Hash{Symbol=>ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::FontLink}] Font assets keyed by family name as it appears in fontFamily/fontFallbacks (non-
        #
        #   @param mode [Symbol, ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Mode] The primary color mode of the website design
        #
        #   @param shadows [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Shadows] Shadow styles used on the website
        #
        #   @param typography [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography] Typography styles used on the website

        # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide#colors
        class Colors < ContextDev::Internal::Type::BaseModel
          # @!attribute accent
          #   Accent color (hex format)
          #
          #   @return [String]
          required :accent, String

          # @!attribute background
          #   Background color (hex format)
          #
          #   @return [String]
          required :background, String

          # @!attribute text
          #   Text color (hex format)
          #
          #   @return [String]
          required :text, String

          # @!method initialize(accent:, background:, text:)
          #   Primary colors used on the website
          #
          #   @param accent [String] Accent color (hex format)
          #
          #   @param background [String] Background color (hex format)
          #
          #   @param text [String] Text color (hex format)
        end

        # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide#components
        class Components < ContextDev::Internal::Type::BaseModel
          # @!attribute button
          #   Button component styles
          #
          #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button]
          required :button,
                   -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button }

          # @!attribute card
          #   Card component style
          #
          #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Card, nil]
          optional :card, -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Card }

          # @!method initialize(button:, card: nil)
          #   UI component styles
          #
          #   @param button [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button] Button component styles
          #
          #   @param card [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Card] Card component style

          # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components#button
          class Button < ContextDev::Internal::Type::BaseModel
            # @!attribute link
            #
            #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Link, nil]
            optional :link,
                     -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Link }

            # @!attribute primary
            #
            #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Primary, nil]
            optional :primary,
                     -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Primary }

            # @!attribute secondary
            #
            #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Secondary, nil]
            optional :secondary,
                     -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Secondary }

            # @!method initialize(link: nil, primary: nil, secondary: nil)
            #   Button component styles
            #
            #   @param link [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Link]
            #   @param primary [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Primary]
            #   @param secondary [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Secondary]

            # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button#link
            class Link < ContextDev::Internal::Type::BaseModel
              # @!attribute background_color
              #
              #   @return [String]
              required :background_color, String, api_name: :backgroundColor

              # @!attribute border_color
              #   Border color as CSS hex (#RRGGBB or #RRGGBBAA when computed border-color has
              #   alpha)
              #
              #   @return [String]
              required :border_color, String, api_name: :borderColor

              # @!attribute border_radius
              #
              #   @return [String]
              required :border_radius, String, api_name: :borderRadius

              # @!attribute border_style
              #
              #   @return [String]
              required :border_style, String, api_name: :borderStyle

              # @!attribute border_width
              #
              #   @return [String]
              required :border_width, String, api_name: :borderWidth

              # @!attribute box_shadow
              #   Computed box-shadow (comma-separated layers when present)
              #
              #   @return [String]
              required :box_shadow, String, api_name: :boxShadow

              # @!attribute color
              #
              #   @return [String]
              required :color, String

              # @!attribute css
              #   Ready-to-use CSS declaration block for this component style
              #
              #   @return [String]
              required :css, String

              # @!attribute font_size
              #
              #   @return [String]
              required :font_size, String, api_name: :fontSize

              # @!attribute font_weight
              #
              #   @return [Float]
              required :font_weight, Float, api_name: :fontWeight

              # @!attribute min_height
              #   Sampled minimum height of the button box (typically px)
              #
              #   @return [String]
              required :min_height, String, api_name: :minHeight

              # @!attribute min_width
              #   Sampled minimum width of the button box (typically px)
              #
              #   @return [String]
              required :min_width, String, api_name: :minWidth

              # @!attribute padding
              #
              #   @return [String]
              required :padding, String

              # @!attribute text_decoration
              #
              #   @return [String]
              required :text_decoration, String, api_name: :textDecoration

              # @!attribute font_fallbacks
              #   Full ordered font list from computed font-family
              #
              #   @return [Array<String>, nil]
              optional :font_fallbacks, ContextDev::Internal::Type::ArrayOf[String], api_name: :fontFallbacks

              # @!attribute font_family
              #   Primary button typeface (first in fontFallbacks)
              #
              #   @return [String, nil]
              optional :font_family, String, api_name: :fontFamily

              # @!attribute text_decoration_color
              #   Hex color of the underline when it differs from the text color
              #
              #   @return [String, nil]
              optional :text_decoration_color, String, api_name: :textDecorationColor

              # @!method initialize(background_color:, border_color:, border_radius:, border_style:, border_width:, box_shadow:, color:, css:, font_size:, font_weight:, min_height:, min_width:, padding:, text_decoration:, font_fallbacks: nil, font_family: nil, text_decoration_color: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Link}
              #   for more details.
              #
              #   @param background_color [String]
              #
              #   @param border_color [String] Border color as CSS hex (#RRGGBB or #RRGGBBAA when computed border-color has alp
              #
              #   @param border_radius [String]
              #
              #   @param border_style [String]
              #
              #   @param border_width [String]
              #
              #   @param box_shadow [String] Computed box-shadow (comma-separated layers when present)
              #
              #   @param color [String]
              #
              #   @param css [String] Ready-to-use CSS declaration block for this component style
              #
              #   @param font_size [String]
              #
              #   @param font_weight [Float]
              #
              #   @param min_height [String] Sampled minimum height of the button box (typically px)
              #
              #   @param min_width [String] Sampled minimum width of the button box (typically px)
              #
              #   @param padding [String]
              #
              #   @param text_decoration [String]
              #
              #   @param font_fallbacks [Array<String>] Full ordered font list from computed font-family
              #
              #   @param font_family [String] Primary button typeface (first in fontFallbacks)
              #
              #   @param text_decoration_color [String] Hex color of the underline when it differs from the text color
            end

            # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button#primary
            class Primary < ContextDev::Internal::Type::BaseModel
              # @!attribute background_color
              #
              #   @return [String]
              required :background_color, String, api_name: :backgroundColor

              # @!attribute border_color
              #   Border color as CSS hex (#RRGGBB or #RRGGBBAA when computed border-color has
              #   alpha)
              #
              #   @return [String]
              required :border_color, String, api_name: :borderColor

              # @!attribute border_radius
              #
              #   @return [String]
              required :border_radius, String, api_name: :borderRadius

              # @!attribute border_style
              #
              #   @return [String]
              required :border_style, String, api_name: :borderStyle

              # @!attribute border_width
              #
              #   @return [String]
              required :border_width, String, api_name: :borderWidth

              # @!attribute box_shadow
              #   Computed box-shadow (comma-separated layers when present)
              #
              #   @return [String]
              required :box_shadow, String, api_name: :boxShadow

              # @!attribute color
              #
              #   @return [String]
              required :color, String

              # @!attribute css
              #   Ready-to-use CSS declaration block for this component style
              #
              #   @return [String]
              required :css, String

              # @!attribute font_size
              #
              #   @return [String]
              required :font_size, String, api_name: :fontSize

              # @!attribute font_weight
              #
              #   @return [Float]
              required :font_weight, Float, api_name: :fontWeight

              # @!attribute min_height
              #   Sampled minimum height of the button box (typically px)
              #
              #   @return [String]
              required :min_height, String, api_name: :minHeight

              # @!attribute min_width
              #   Sampled minimum width of the button box (typically px)
              #
              #   @return [String]
              required :min_width, String, api_name: :minWidth

              # @!attribute padding
              #
              #   @return [String]
              required :padding, String

              # @!attribute text_decoration
              #
              #   @return [String]
              required :text_decoration, String, api_name: :textDecoration

              # @!attribute font_fallbacks
              #   Full ordered font list from computed font-family
              #
              #   @return [Array<String>, nil]
              optional :font_fallbacks, ContextDev::Internal::Type::ArrayOf[String], api_name: :fontFallbacks

              # @!attribute font_family
              #   Primary button typeface (first in fontFallbacks)
              #
              #   @return [String, nil]
              optional :font_family, String, api_name: :fontFamily

              # @!attribute text_decoration_color
              #   Hex color of the underline when it differs from the text color
              #
              #   @return [String, nil]
              optional :text_decoration_color, String, api_name: :textDecorationColor

              # @!method initialize(background_color:, border_color:, border_radius:, border_style:, border_width:, box_shadow:, color:, css:, font_size:, font_weight:, min_height:, min_width:, padding:, text_decoration:, font_fallbacks: nil, font_family: nil, text_decoration_color: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Primary}
              #   for more details.
              #
              #   @param background_color [String]
              #
              #   @param border_color [String] Border color as CSS hex (#RRGGBB or #RRGGBBAA when computed border-color has alp
              #
              #   @param border_radius [String]
              #
              #   @param border_style [String]
              #
              #   @param border_width [String]
              #
              #   @param box_shadow [String] Computed box-shadow (comma-separated layers when present)
              #
              #   @param color [String]
              #
              #   @param css [String] Ready-to-use CSS declaration block for this component style
              #
              #   @param font_size [String]
              #
              #   @param font_weight [Float]
              #
              #   @param min_height [String] Sampled minimum height of the button box (typically px)
              #
              #   @param min_width [String] Sampled minimum width of the button box (typically px)
              #
              #   @param padding [String]
              #
              #   @param text_decoration [String]
              #
              #   @param font_fallbacks [Array<String>] Full ordered font list from computed font-family
              #
              #   @param font_family [String] Primary button typeface (first in fontFallbacks)
              #
              #   @param text_decoration_color [String] Hex color of the underline when it differs from the text color
            end

            # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button#secondary
            class Secondary < ContextDev::Internal::Type::BaseModel
              # @!attribute background_color
              #
              #   @return [String]
              required :background_color, String, api_name: :backgroundColor

              # @!attribute border_color
              #   Border color as CSS hex (#RRGGBB or #RRGGBBAA when computed border-color has
              #   alpha)
              #
              #   @return [String]
              required :border_color, String, api_name: :borderColor

              # @!attribute border_radius
              #
              #   @return [String]
              required :border_radius, String, api_name: :borderRadius

              # @!attribute border_style
              #
              #   @return [String]
              required :border_style, String, api_name: :borderStyle

              # @!attribute border_width
              #
              #   @return [String]
              required :border_width, String, api_name: :borderWidth

              # @!attribute box_shadow
              #   Computed box-shadow (comma-separated layers when present)
              #
              #   @return [String]
              required :box_shadow, String, api_name: :boxShadow

              # @!attribute color
              #
              #   @return [String]
              required :color, String

              # @!attribute css
              #   Ready-to-use CSS declaration block for this component style
              #
              #   @return [String]
              required :css, String

              # @!attribute font_size
              #
              #   @return [String]
              required :font_size, String, api_name: :fontSize

              # @!attribute font_weight
              #
              #   @return [Float]
              required :font_weight, Float, api_name: :fontWeight

              # @!attribute min_height
              #   Sampled minimum height of the button box (typically px)
              #
              #   @return [String]
              required :min_height, String, api_name: :minHeight

              # @!attribute min_width
              #   Sampled minimum width of the button box (typically px)
              #
              #   @return [String]
              required :min_width, String, api_name: :minWidth

              # @!attribute padding
              #
              #   @return [String]
              required :padding, String

              # @!attribute text_decoration
              #
              #   @return [String]
              required :text_decoration, String, api_name: :textDecoration

              # @!attribute font_fallbacks
              #   Full ordered font list from computed font-family
              #
              #   @return [Array<String>, nil]
              optional :font_fallbacks, ContextDev::Internal::Type::ArrayOf[String], api_name: :fontFallbacks

              # @!attribute font_family
              #   Primary button typeface (first in fontFallbacks)
              #
              #   @return [String, nil]
              optional :font_family, String, api_name: :fontFamily

              # @!attribute text_decoration_color
              #   Hex color of the underline when it differs from the text color
              #
              #   @return [String, nil]
              optional :text_decoration_color, String, api_name: :textDecorationColor

              # @!method initialize(background_color:, border_color:, border_radius:, border_style:, border_width:, box_shadow:, color:, css:, font_size:, font_weight:, min_height:, min_width:, padding:, text_decoration:, font_fallbacks: nil, font_family: nil, text_decoration_color: nil)
              #   Some parameter documentations has been truncated, see
              #   {ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Button::Secondary}
              #   for more details.
              #
              #   @param background_color [String]
              #
              #   @param border_color [String] Border color as CSS hex (#RRGGBB or #RRGGBBAA when computed border-color has alp
              #
              #   @param border_radius [String]
              #
              #   @param border_style [String]
              #
              #   @param border_width [String]
              #
              #   @param box_shadow [String] Computed box-shadow (comma-separated layers when present)
              #
              #   @param color [String]
              #
              #   @param css [String] Ready-to-use CSS declaration block for this component style
              #
              #   @param font_size [String]
              #
              #   @param font_weight [Float]
              #
              #   @param min_height [String] Sampled minimum height of the button box (typically px)
              #
              #   @param min_width [String] Sampled minimum width of the button box (typically px)
              #
              #   @param padding [String]
              #
              #   @param text_decoration [String]
              #
              #   @param font_fallbacks [Array<String>] Full ordered font list from computed font-family
              #
              #   @param font_family [String] Primary button typeface (first in fontFallbacks)
              #
              #   @param text_decoration_color [String] Hex color of the underline when it differs from the text color
            end
          end

          # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components#card
          class Card < ContextDev::Internal::Type::BaseModel
            # @!attribute background_color
            #
            #   @return [String]
            required :background_color, String, api_name: :backgroundColor

            # @!attribute border_color
            #   Border color as CSS hex (#RRGGBB or #RRGGBBAA when computed border-color has
            #   alpha)
            #
            #   @return [String]
            required :border_color, String, api_name: :borderColor

            # @!attribute border_radius
            #
            #   @return [String]
            required :border_radius, String, api_name: :borderRadius

            # @!attribute border_style
            #
            #   @return [String]
            required :border_style, String, api_name: :borderStyle

            # @!attribute border_width
            #
            #   @return [String]
            required :border_width, String, api_name: :borderWidth

            # @!attribute box_shadow
            #
            #   @return [String]
            required :box_shadow, String, api_name: :boxShadow

            # @!attribute css
            #   Ready-to-use CSS declaration block for this component style
            #
            #   @return [String]
            required :css, String

            # @!attribute padding
            #
            #   @return [String]
            required :padding, String

            # @!attribute text_color
            #
            #   @return [String]
            required :text_color, String, api_name: :textColor

            # @!method initialize(background_color:, border_color:, border_radius:, border_style:, border_width:, box_shadow:, css:, padding:, text_color:)
            #   Some parameter documentations has been truncated, see
            #   {ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Components::Card}
            #   for more details.
            #
            #   Card component style
            #
            #   @param background_color [String]
            #
            #   @param border_color [String] Border color as CSS hex (#RRGGBB or #RRGGBBAA when computed border-color has alp
            #
            #   @param border_radius [String]
            #
            #   @param border_style [String]
            #
            #   @param border_width [String]
            #
            #   @param box_shadow [String]
            #
            #   @param css [String] Ready-to-use CSS declaration block for this component style
            #
            #   @param padding [String]
            #
            #   @param text_color [String]
          end
        end

        # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide#element_spacing
        class ElementSpacing < ContextDev::Internal::Type::BaseModel
          # @!attribute lg
          #
          #   @return [String]
          required :lg, String

          # @!attribute md
          #
          #   @return [String]
          required :md, String

          # @!attribute sm
          #
          #   @return [String]
          required :sm, String

          # @!attribute xl
          #
          #   @return [String]
          required :xl, String

          # @!attribute xs
          #
          #   @return [String]
          required :xs, String

          # @!method initialize(lg:, md:, sm:, xl:, xs:)
          #   Spacing system used on the website
          #
          #   @param lg [String]
          #   @param md [String]
          #   @param sm [String]
          #   @param xl [String]
          #   @param xs [String]
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
          #   @return [Symbol, ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::FontLink::Type]
          required :type,
                   enum: -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::FontLink::Type }

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
          #   {ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::FontLink} for
          #   more details.
          #
          #   @param files [Hash{Symbol=>String}] Upright font files keyed by weight string (e.g. "400" for regular, "500", "700")
          #
          #   @param type [Symbol, ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::FontLink::Type]
          #
          #   @param category [String] Google Fonts category when type is google (e.g. sans-serif, serif, monospace, di
          #
          #   @param display_name [String] Present when type is custom: human-readable name derived from the fontLinks key

          # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::FontLink#type
          module Type
            extend ContextDev::Internal::Type::Enum

            GOOGLE = :google
            CUSTOM = :custom

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # The primary color mode of the website design
        #
        # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide#mode
        module Mode
          extend ContextDev::Internal::Type::Enum

          LIGHT = :light
          DARK = :dark

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide#shadows
        class Shadows < ContextDev::Internal::Type::BaseModel
          # @!attribute inner
          #
          #   @return [String]
          required :inner, String

          # @!attribute lg
          #
          #   @return [String]
          required :lg, String

          # @!attribute md
          #
          #   @return [String]
          required :md, String

          # @!attribute sm
          #
          #   @return [String]
          required :sm, String

          # @!attribute xl
          #
          #   @return [String]
          required :xl, String

          # @!method initialize(inner:, lg:, md:, sm:, xl:)
          #   Shadow styles used on the website
          #
          #   @param inner [String]
          #   @param lg [String]
          #   @param md [String]
          #   @param sm [String]
          #   @param xl [String]
        end

        # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide#typography
        class Typography < ContextDev::Internal::Type::BaseModel
          # @!attribute headings
          #   Heading styles
          #
          #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings]
          required :headings,
                   -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings }

          # @!attribute p_
          #
          #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::P, nil]
          optional :p_,
                   -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::P },
                   api_name: :p

          # @!method initialize(headings:, p_: nil)
          #   Typography styles used on the website
          #
          #   @param headings [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings] Heading styles
          #
          #   @param p_ [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::P]

          # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography#headings
          class Headings < ContextDev::Internal::Type::BaseModel
            # @!attribute h1
            #
            #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H1, nil]
            optional :h1,
                     -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H1 }

            # @!attribute h2
            #
            #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H2, nil]
            optional :h2,
                     -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H2 }

            # @!attribute h3
            #
            #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H3, nil]
            optional :h3,
                     -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H3 }

            # @!attribute h4
            #
            #   @return [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H4, nil]
            optional :h4,
                     -> { ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H4 }

            # @!method initialize(h1: nil, h2: nil, h3: nil, h4: nil)
            #   Heading styles
            #
            #   @param h1 [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H1]
            #   @param h2 [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H2]
            #   @param h3 [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H3]
            #   @param h4 [ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings::H4]

            # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings#h1
            class H1 < ContextDev::Internal::Type::BaseModel
              # @!attribute font_fallbacks
              #   Full ordered font list from resolved computed font-family
              #
              #   @return [Array<String>]
              required :font_fallbacks, ContextDev::Internal::Type::ArrayOf[String], api_name: :fontFallbacks

              # @!attribute font_family
              #   Primary face (first family in the computed stack)
              #
              #   @return [String]
              required :font_family, String, api_name: :fontFamily

              # @!attribute font_size
              #
              #   @return [String]
              required :font_size, String, api_name: :fontSize

              # @!attribute font_weight
              #
              #   @return [Float]
              required :font_weight, Float, api_name: :fontWeight

              # @!attribute letter_spacing
              #
              #   @return [String]
              required :letter_spacing, String, api_name: :letterSpacing

              # @!attribute line_height
              #
              #   @return [String]
              required :line_height, String, api_name: :lineHeight

              # @!method initialize(font_fallbacks:, font_family:, font_size:, font_weight:, letter_spacing:, line_height:)
              #   @param font_fallbacks [Array<String>] Full ordered font list from resolved computed font-family
              #
              #   @param font_family [String] Primary face (first family in the computed stack)
              #
              #   @param font_size [String]
              #
              #   @param font_weight [Float]
              #
              #   @param letter_spacing [String]
              #
              #   @param line_height [String]
            end

            # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings#h2
            class H2 < ContextDev::Internal::Type::BaseModel
              # @!attribute font_fallbacks
              #   Full ordered font list from resolved computed font-family
              #
              #   @return [Array<String>]
              required :font_fallbacks, ContextDev::Internal::Type::ArrayOf[String], api_name: :fontFallbacks

              # @!attribute font_family
              #   Primary face (first family in the computed stack)
              #
              #   @return [String]
              required :font_family, String, api_name: :fontFamily

              # @!attribute font_size
              #
              #   @return [String]
              required :font_size, String, api_name: :fontSize

              # @!attribute font_weight
              #
              #   @return [Float]
              required :font_weight, Float, api_name: :fontWeight

              # @!attribute letter_spacing
              #
              #   @return [String]
              required :letter_spacing, String, api_name: :letterSpacing

              # @!attribute line_height
              #
              #   @return [String]
              required :line_height, String, api_name: :lineHeight

              # @!method initialize(font_fallbacks:, font_family:, font_size:, font_weight:, letter_spacing:, line_height:)
              #   @param font_fallbacks [Array<String>] Full ordered font list from resolved computed font-family
              #
              #   @param font_family [String] Primary face (first family in the computed stack)
              #
              #   @param font_size [String]
              #
              #   @param font_weight [Float]
              #
              #   @param letter_spacing [String]
              #
              #   @param line_height [String]
            end

            # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings#h3
            class H3 < ContextDev::Internal::Type::BaseModel
              # @!attribute font_fallbacks
              #   Full ordered font list from resolved computed font-family
              #
              #   @return [Array<String>]
              required :font_fallbacks, ContextDev::Internal::Type::ArrayOf[String], api_name: :fontFallbacks

              # @!attribute font_family
              #   Primary face (first family in the computed stack)
              #
              #   @return [String]
              required :font_family, String, api_name: :fontFamily

              # @!attribute font_size
              #
              #   @return [String]
              required :font_size, String, api_name: :fontSize

              # @!attribute font_weight
              #
              #   @return [Float]
              required :font_weight, Float, api_name: :fontWeight

              # @!attribute letter_spacing
              #
              #   @return [String]
              required :letter_spacing, String, api_name: :letterSpacing

              # @!attribute line_height
              #
              #   @return [String]
              required :line_height, String, api_name: :lineHeight

              # @!method initialize(font_fallbacks:, font_family:, font_size:, font_weight:, letter_spacing:, line_height:)
              #   @param font_fallbacks [Array<String>] Full ordered font list from resolved computed font-family
              #
              #   @param font_family [String] Primary face (first family in the computed stack)
              #
              #   @param font_size [String]
              #
              #   @param font_weight [Float]
              #
              #   @param letter_spacing [String]
              #
              #   @param line_height [String]
            end

            # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography::Headings#h4
            class H4 < ContextDev::Internal::Type::BaseModel
              # @!attribute font_fallbacks
              #   Full ordered font list from resolved computed font-family
              #
              #   @return [Array<String>]
              required :font_fallbacks, ContextDev::Internal::Type::ArrayOf[String], api_name: :fontFallbacks

              # @!attribute font_family
              #   Primary face (first family in the computed stack)
              #
              #   @return [String]
              required :font_family, String, api_name: :fontFamily

              # @!attribute font_size
              #
              #   @return [String]
              required :font_size, String, api_name: :fontSize

              # @!attribute font_weight
              #
              #   @return [Float]
              required :font_weight, Float, api_name: :fontWeight

              # @!attribute letter_spacing
              #
              #   @return [String]
              required :letter_spacing, String, api_name: :letterSpacing

              # @!attribute line_height
              #
              #   @return [String]
              required :line_height, String, api_name: :lineHeight

              # @!method initialize(font_fallbacks:, font_family:, font_size:, font_weight:, letter_spacing:, line_height:)
              #   @param font_fallbacks [Array<String>] Full ordered font list from resolved computed font-family
              #
              #   @param font_family [String] Primary face (first family in the computed stack)
              #
              #   @param font_size [String]
              #
              #   @param font_weight [Float]
              #
              #   @param letter_spacing [String]
              #
              #   @param line_height [String]
            end
          end

          # @see ContextDev::Models::StyleExtractStyleguideResponse::Styleguide::Typography#p_
          class P < ContextDev::Internal::Type::BaseModel
            # @!attribute font_fallbacks
            #   Full ordered font list from resolved computed font-family
            #
            #   @return [Array<String>]
            required :font_fallbacks, ContextDev::Internal::Type::ArrayOf[String], api_name: :fontFallbacks

            # @!attribute font_family
            #   Primary face (first family in the computed stack)
            #
            #   @return [String]
            required :font_family, String, api_name: :fontFamily

            # @!attribute font_size
            #
            #   @return [String]
            required :font_size, String, api_name: :fontSize

            # @!attribute font_weight
            #
            #   @return [Float]
            required :font_weight, Float, api_name: :fontWeight

            # @!attribute letter_spacing
            #
            #   @return [String]
            required :letter_spacing, String, api_name: :letterSpacing

            # @!attribute line_height
            #
            #   @return [String]
            required :line_height, String, api_name: :lineHeight

            # @!method initialize(font_fallbacks:, font_family:, font_size:, font_weight:, letter_spacing:, line_height:)
            #   @param font_fallbacks [Array<String>] Full ordered font list from resolved computed font-family
            #
            #   @param font_family [String] Primary face (first family in the computed stack)
            #
            #   @param font_size [String]
            #
            #   @param font_weight [Float]
            #
            #   @param letter_spacing [String]
            #
            #   @param line_height [String]
          end
        end
      end
    end
  end
end
