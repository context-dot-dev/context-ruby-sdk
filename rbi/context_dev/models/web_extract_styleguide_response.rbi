# typed: strong

module ContextDev
  module Models
    class WebExtractStyleguideResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebExtractStyleguideResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Cache status of this response.
      sig do
        returns(ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata)
      end
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # HTTP status code, repeated in the body.
      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      # Normalized domain that was analyzed.
      sig { returns(T.nilable(String)) }
      attr_reader :domain

      sig { params(domain: String).void }
      attr_writer :domain

      # `loaded`, or `still-loading` when capture ended before the page finished
      # loading.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebExtractStyleguideResponse::FinalDomState::TaggedSymbol
          )
        )
      end
      attr_reader :final_dom_state

      sig do
        params(
          final_dom_state:
            ContextDev::Models::WebExtractStyleguideResponse::FinalDomState::OrSymbol
        ).void
      end
      attr_writer :final_dom_state

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebExtractStyleguideResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebExtractStyleguideResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Always `ok` on success.
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # Design tokens and component styles extracted from the website.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebExtractStyleguideResponse::Styleguide
          )
        )
      end
      attr_reader :styleguide

      sig do
        params(
          styleguide:
            ContextDev::Models::WebExtractStyleguideResponse::Styleguide::OrHash
        ).void
      end
      attr_writer :styleguide

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata::OrHash,
          request_id: String,
          code: Integer,
          domain: String,
          final_dom_state:
            ContextDev::Models::WebExtractStyleguideResponse::FinalDomState::OrSymbol,
          key_metadata:
            ContextDev::Models::WebExtractStyleguideResponse::KeyMetadata::OrHash,
          status: String,
          styleguide:
            ContextDev::Models::WebExtractStyleguideResponse::Styleguide::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cache status of this response.
        cache_metadata:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # HTTP status code, repeated in the body.
        code: nil,
        # Normalized domain that was analyzed.
        domain: nil,
        # `loaded`, or `still-loading` when capture ended before the page finished
        # loading.
        final_dom_state: nil,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # Always `ok` on success.
        status: nil,
        # Design tokens and component styles extracted from the website.
        styleguide: nil
      )
      end

      sig do
        override.returns(
          {
            cache_metadata:
              ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata,
            request_id: String,
            code: Integer,
            domain: String,
            final_dom_state:
              ContextDev::Models::WebExtractStyleguideResponse::FinalDomState::TaggedSymbol,
            key_metadata:
              ContextDev::Models::WebExtractStyleguideResponse::KeyMetadata,
            status: String,
            styleguide:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        sig { returns(Integer) }
        attr_accessor :age_ms

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
        sig do
          returns(
            ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Cache status of this response.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
          age_ms:,
          # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
          # retention bypassed the cache.
          status:
        )
        end

        sig do
          override.returns(
            {
              age_ms: Integer,
              status:
                ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # `loaded`, or `still-loading` when capture ended before the page finished
      # loading.
      module FinalDomState
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::Models::WebExtractStyleguideResponse::FinalDomState
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOADED =
          T.let(
            :loaded,
            ContextDev::Models::WebExtractStyleguideResponse::FinalDomState::TaggedSymbol
          )
        STILL_LOADING =
          T.let(
            :"still-loading",
            ContextDev::Models::WebExtractStyleguideResponse::FinalDomState::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebExtractStyleguideResponse::FinalDomState::TaggedSymbol
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
              ContextDev::Models::WebExtractStyleguideResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits your organization has left after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credits this request used and your remaining balance.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits charged for this request.
          credits_consumed:,
          # Credits your organization has left after this request.
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

      class Styleguide < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide,
              ContextDev::Internal::AnyHash
            )
          end

        # Core colors used on the website.
        sig do
          returns(
            ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Colors
          )
        end
        attr_reader :colors

        sig do
          params(
            colors:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Colors::OrHash
          ).void
        end
        attr_writer :colors

        # Styles for buttons and cards.
        sig do
          returns(
            ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components
          )
        end
        attr_reader :components

        sig do
          params(
            components:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::OrHash
          ).void
        end
        attr_writer :components

        # Spacing scale used on the website, from `xs` to `xl`.
        sig do
          returns(
            ContextDev::Models::WebExtractStyleguideResponse::Styleguide::ElementSpacing
          )
        end
        attr_reader :element_spacing

        sig do
          params(
            element_spacing:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::ElementSpacing::OrHash
          ).void
        end
        attr_writer :element_spacing

        # Font files keyed by family name, as it appears in `fontFamily` and
        # `fontFallbacks`. Generic families are left out. Match style and weight against
        # `faces` to pick a file.
        sig do
          returns(
            T::Hash[
              Symbol,
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink
            ]
          )
        end
        attr_accessor :font_links

        # Whether the site's design is mainly light or dark.
        sig do
          returns(
            ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Mode::TaggedSymbol
          )
        end
        attr_accessor :mode

        # Box shadow scale used on the website, from `sm` to `xl`, plus `inner`.
        sig do
          returns(
            ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Shadows
          )
        end
        attr_reader :shadows

        sig do
          params(
            shadows:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Shadows::OrHash
          ).void
        end
        attr_writer :shadows

        # Text styles for headings and body text.
        sig do
          returns(
            ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography
          )
        end
        attr_reader :typography

        sig do
          params(
            typography:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::OrHash
          ).void
        end
        attr_writer :typography

        # Design tokens and component styles extracted from the website.
        sig do
          params(
            colors:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Colors::OrHash,
            components:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::OrHash,
            element_spacing:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::ElementSpacing::OrHash,
            font_links:
              T::Hash[
                Symbol,
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::OrHash
              ],
            mode:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Mode::OrSymbol,
            shadows:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Shadows::OrHash,
            typography:
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Core colors used on the website.
          colors:,
          # Styles for buttons and cards.
          components:,
          # Spacing scale used on the website, from `xs` to `xl`.
          element_spacing:,
          # Font files keyed by family name, as it appears in `fontFamily` and
          # `fontFallbacks`. Generic families are left out. Match style and weight against
          # `faces` to pick a file.
          font_links:,
          # Whether the site's design is mainly light or dark.
          mode:,
          # Box shadow scale used on the website, from `sm` to `xl`, plus `inner`.
          shadows:,
          # Text styles for headings and body text.
          typography:
        )
        end

        sig do
          override.returns(
            {
              colors:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Colors,
              components:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components,
              element_spacing:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::ElementSpacing,
              font_links:
                T::Hash[
                  Symbol,
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink
                ],
              mode:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Mode::TaggedSymbol,
              shadows:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Shadows,
              typography:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography
            }
          )
        end
        def to_hash
        end

        class Colors < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Colors,
                ContextDev::Internal::AnyHash
              )
            end

          # Accent color, in hex.
          sig { returns(String) }
          attr_accessor :accent

          # Background color, in hex.
          sig { returns(String) }
          attr_accessor :background

          # Text color, in hex.
          sig { returns(String) }
          attr_accessor :text

          # Core colors used on the website.
          sig do
            params(accent: String, background: String, text: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Accent color, in hex.
            accent:,
            # Background color, in hex.
            background:,
            # Text color, in hex.
            text:
          )
          end

          sig do
            override.returns(
              { accent: String, background: String, text: String }
            )
          end
          def to_hash
          end
        end

        class Components < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components,
                ContextDev::Internal::AnyHash
              )
            end

          # Primary, secondary, and link button styles.
          sig do
            returns(
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button
            )
          end
          attr_reader :button

          sig do
            params(
              button:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::OrHash
            ).void
          end
          attr_writer :button

          # Card style.
          sig do
            returns(
              T.nilable(
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Card
              )
            )
          end
          attr_reader :card

          sig do
            params(
              card:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Card::OrHash
            ).void
          end
          attr_writer :card

          # Styles for buttons and cards.
          sig do
            params(
              button:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::OrHash,
              card:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Card::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Primary, secondary, and link button styles.
            button:,
            # Card style.
            card: nil
          )
          end

          sig do
            override.returns(
              {
                button:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button,
                card:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Card
              }
            )
          end
          def to_hash
          end

          class Button < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Link
                )
              )
            end
            attr_reader :link

            sig do
              params(
                link:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Link::OrHash
              ).void
            end
            attr_writer :link

            sig do
              returns(
                T.nilable(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Primary
                )
              )
            end
            attr_reader :primary

            sig do
              params(
                primary:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Primary::OrHash
              ).void
            end
            attr_writer :primary

            sig do
              returns(
                T.nilable(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Secondary
                )
              )
            end
            attr_reader :secondary

            sig do
              params(
                secondary:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Secondary::OrHash
              ).void
            end
            attr_writer :secondary

            # Primary, secondary, and link button styles.
            sig do
              params(
                link:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Link::OrHash,
                primary:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Primary::OrHash,
                secondary:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Secondary::OrHash
              ).returns(T.attached_class)
            end
            def self.new(link: nil, primary: nil, secondary: nil)
            end

            sig do
              override.returns(
                {
                  link:
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Link,
                  primary:
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Primary,
                  secondary:
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Secondary
                }
              )
            end
            def to_hash
            end

            class Link < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Link,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :background_color

              # Border color in hex: `#RRGGBB`, or `#RRGGBBAA` when the border is translucent.
              sig { returns(String) }
              attr_accessor :border_color

              sig { returns(String) }
              attr_accessor :border_radius

              sig { returns(String) }
              attr_accessor :border_style

              sig { returns(String) }
              attr_accessor :border_width

              # Computed `box-shadow`, with layers separated by commas.
              sig { returns(String) }
              attr_accessor :box_shadow

              sig { returns(String) }
              attr_accessor :color

              # Ready-to-use CSS declarations for this style.
              sig { returns(String) }
              attr_accessor :css

              sig { returns(String) }
              attr_accessor :font_size

              sig { returns(Float) }
              attr_accessor :font_weight

              # Minimum height as a CSS length, usually in pixels.
              sig { returns(String) }
              attr_accessor :min_height

              # Minimum width as a CSS length, usually in pixels.
              sig { returns(String) }
              attr_accessor :min_width

              sig { returns(String) }
              attr_accessor :padding

              sig { returns(String) }
              attr_accessor :text_decoration

              # Full font stack from the computed `font-family`, in order.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :font_fallbacks

              sig { params(font_fallbacks: T::Array[String]).void }
              attr_writer :font_fallbacks

              # Button typeface, the first entry in `fontFallbacks`.
              sig { returns(T.nilable(String)) }
              attr_reader :font_family

              sig { params(font_family: String).void }
              attr_writer :font_family

              # Underline color in hex, when it differs from the text color.
              sig { returns(T.nilable(String)) }
              attr_reader :text_decoration_color

              sig { params(text_decoration_color: String).void }
              attr_writer :text_decoration_color

              sig do
                params(
                  background_color: String,
                  border_color: String,
                  border_radius: String,
                  border_style: String,
                  border_width: String,
                  box_shadow: String,
                  color: String,
                  css: String,
                  font_size: String,
                  font_weight: Float,
                  min_height: String,
                  min_width: String,
                  padding: String,
                  text_decoration: String,
                  font_fallbacks: T::Array[String],
                  font_family: String,
                  text_decoration_color: String
                ).returns(T.attached_class)
              end
              def self.new(
                background_color:,
                # Border color in hex: `#RRGGBB`, or `#RRGGBBAA` when the border is translucent.
                border_color:,
                border_radius:,
                border_style:,
                border_width:,
                # Computed `box-shadow`, with layers separated by commas.
                box_shadow:,
                color:,
                # Ready-to-use CSS declarations for this style.
                css:,
                font_size:,
                font_weight:,
                # Minimum height as a CSS length, usually in pixels.
                min_height:,
                # Minimum width as a CSS length, usually in pixels.
                min_width:,
                padding:,
                text_decoration:,
                # Full font stack from the computed `font-family`, in order.
                font_fallbacks: nil,
                # Button typeface, the first entry in `fontFallbacks`.
                font_family: nil,
                # Underline color in hex, when it differs from the text color.
                text_decoration_color: nil
              )
              end

              sig do
                override.returns(
                  {
                    background_color: String,
                    border_color: String,
                    border_radius: String,
                    border_style: String,
                    border_width: String,
                    box_shadow: String,
                    color: String,
                    css: String,
                    font_size: String,
                    font_weight: Float,
                    min_height: String,
                    min_width: String,
                    padding: String,
                    text_decoration: String,
                    font_fallbacks: T::Array[String],
                    font_family: String,
                    text_decoration_color: String
                  }
                )
              end
              def to_hash
              end
            end

            class Primary < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Primary,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :background_color

              # Border color in hex: `#RRGGBB`, or `#RRGGBBAA` when the border is translucent.
              sig { returns(String) }
              attr_accessor :border_color

              sig { returns(String) }
              attr_accessor :border_radius

              sig { returns(String) }
              attr_accessor :border_style

              sig { returns(String) }
              attr_accessor :border_width

              # Computed `box-shadow`, with layers separated by commas.
              sig { returns(String) }
              attr_accessor :box_shadow

              sig { returns(String) }
              attr_accessor :color

              # Ready-to-use CSS declarations for this style.
              sig { returns(String) }
              attr_accessor :css

              sig { returns(String) }
              attr_accessor :font_size

              sig { returns(Float) }
              attr_accessor :font_weight

              # Minimum height as a CSS length, usually in pixels.
              sig { returns(String) }
              attr_accessor :min_height

              # Minimum width as a CSS length, usually in pixels.
              sig { returns(String) }
              attr_accessor :min_width

              sig { returns(String) }
              attr_accessor :padding

              sig { returns(String) }
              attr_accessor :text_decoration

              # Full font stack from the computed `font-family`, in order.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :font_fallbacks

              sig { params(font_fallbacks: T::Array[String]).void }
              attr_writer :font_fallbacks

              # Button typeface, the first entry in `fontFallbacks`.
              sig { returns(T.nilable(String)) }
              attr_reader :font_family

              sig { params(font_family: String).void }
              attr_writer :font_family

              # Underline color in hex, when it differs from the text color.
              sig { returns(T.nilable(String)) }
              attr_reader :text_decoration_color

              sig { params(text_decoration_color: String).void }
              attr_writer :text_decoration_color

              sig do
                params(
                  background_color: String,
                  border_color: String,
                  border_radius: String,
                  border_style: String,
                  border_width: String,
                  box_shadow: String,
                  color: String,
                  css: String,
                  font_size: String,
                  font_weight: Float,
                  min_height: String,
                  min_width: String,
                  padding: String,
                  text_decoration: String,
                  font_fallbacks: T::Array[String],
                  font_family: String,
                  text_decoration_color: String
                ).returns(T.attached_class)
              end
              def self.new(
                background_color:,
                # Border color in hex: `#RRGGBB`, or `#RRGGBBAA` when the border is translucent.
                border_color:,
                border_radius:,
                border_style:,
                border_width:,
                # Computed `box-shadow`, with layers separated by commas.
                box_shadow:,
                color:,
                # Ready-to-use CSS declarations for this style.
                css:,
                font_size:,
                font_weight:,
                # Minimum height as a CSS length, usually in pixels.
                min_height:,
                # Minimum width as a CSS length, usually in pixels.
                min_width:,
                padding:,
                text_decoration:,
                # Full font stack from the computed `font-family`, in order.
                font_fallbacks: nil,
                # Button typeface, the first entry in `fontFallbacks`.
                font_family: nil,
                # Underline color in hex, when it differs from the text color.
                text_decoration_color: nil
              )
              end

              sig do
                override.returns(
                  {
                    background_color: String,
                    border_color: String,
                    border_radius: String,
                    border_style: String,
                    border_width: String,
                    box_shadow: String,
                    color: String,
                    css: String,
                    font_size: String,
                    font_weight: Float,
                    min_height: String,
                    min_width: String,
                    padding: String,
                    text_decoration: String,
                    font_fallbacks: T::Array[String],
                    font_family: String,
                    text_decoration_color: String
                  }
                )
              end
              def to_hash
              end
            end

            class Secondary < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Button::Secondary,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(String) }
              attr_accessor :background_color

              # Border color in hex: `#RRGGBB`, or `#RRGGBBAA` when the border is translucent.
              sig { returns(String) }
              attr_accessor :border_color

              sig { returns(String) }
              attr_accessor :border_radius

              sig { returns(String) }
              attr_accessor :border_style

              sig { returns(String) }
              attr_accessor :border_width

              # Computed `box-shadow`, with layers separated by commas.
              sig { returns(String) }
              attr_accessor :box_shadow

              sig { returns(String) }
              attr_accessor :color

              # Ready-to-use CSS declarations for this style.
              sig { returns(String) }
              attr_accessor :css

              sig { returns(String) }
              attr_accessor :font_size

              sig { returns(Float) }
              attr_accessor :font_weight

              # Minimum height as a CSS length, usually in pixels.
              sig { returns(String) }
              attr_accessor :min_height

              # Minimum width as a CSS length, usually in pixels.
              sig { returns(String) }
              attr_accessor :min_width

              sig { returns(String) }
              attr_accessor :padding

              sig { returns(String) }
              attr_accessor :text_decoration

              # Full font stack from the computed `font-family`, in order.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :font_fallbacks

              sig { params(font_fallbacks: T::Array[String]).void }
              attr_writer :font_fallbacks

              # Button typeface, the first entry in `fontFallbacks`.
              sig { returns(T.nilable(String)) }
              attr_reader :font_family

              sig { params(font_family: String).void }
              attr_writer :font_family

              # Underline color in hex, when it differs from the text color.
              sig { returns(T.nilable(String)) }
              attr_reader :text_decoration_color

              sig { params(text_decoration_color: String).void }
              attr_writer :text_decoration_color

              sig do
                params(
                  background_color: String,
                  border_color: String,
                  border_radius: String,
                  border_style: String,
                  border_width: String,
                  box_shadow: String,
                  color: String,
                  css: String,
                  font_size: String,
                  font_weight: Float,
                  min_height: String,
                  min_width: String,
                  padding: String,
                  text_decoration: String,
                  font_fallbacks: T::Array[String],
                  font_family: String,
                  text_decoration_color: String
                ).returns(T.attached_class)
              end
              def self.new(
                background_color:,
                # Border color in hex: `#RRGGBB`, or `#RRGGBBAA` when the border is translucent.
                border_color:,
                border_radius:,
                border_style:,
                border_width:,
                # Computed `box-shadow`, with layers separated by commas.
                box_shadow:,
                color:,
                # Ready-to-use CSS declarations for this style.
                css:,
                font_size:,
                font_weight:,
                # Minimum height as a CSS length, usually in pixels.
                min_height:,
                # Minimum width as a CSS length, usually in pixels.
                min_width:,
                padding:,
                text_decoration:,
                # Full font stack from the computed `font-family`, in order.
                font_fallbacks: nil,
                # Button typeface, the first entry in `fontFallbacks`.
                font_family: nil,
                # Underline color in hex, when it differs from the text color.
                text_decoration_color: nil
              )
              end

              sig do
                override.returns(
                  {
                    background_color: String,
                    border_color: String,
                    border_radius: String,
                    border_style: String,
                    border_width: String,
                    box_shadow: String,
                    color: String,
                    css: String,
                    font_size: String,
                    font_weight: Float,
                    min_height: String,
                    min_width: String,
                    padding: String,
                    text_decoration: String,
                    font_fallbacks: T::Array[String],
                    font_family: String,
                    text_decoration_color: String
                  }
                )
              end
              def to_hash
              end
            end
          end

          class Card < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Components::Card,
                  ContextDev::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :background_color

            # Border color in hex: `#RRGGBB`, or `#RRGGBBAA` when the border is translucent.
            sig { returns(String) }
            attr_accessor :border_color

            sig { returns(String) }
            attr_accessor :border_radius

            sig { returns(String) }
            attr_accessor :border_style

            sig { returns(String) }
            attr_accessor :border_width

            sig { returns(String) }
            attr_accessor :box_shadow

            # Ready-to-use CSS declarations for this style.
            sig { returns(String) }
            attr_accessor :css

            sig { returns(String) }
            attr_accessor :padding

            sig { returns(String) }
            attr_accessor :text_color

            # Card style.
            sig do
              params(
                background_color: String,
                border_color: String,
                border_radius: String,
                border_style: String,
                border_width: String,
                box_shadow: String,
                css: String,
                padding: String,
                text_color: String
              ).returns(T.attached_class)
            end
            def self.new(
              background_color:,
              # Border color in hex: `#RRGGBB`, or `#RRGGBBAA` when the border is translucent.
              border_color:,
              border_radius:,
              border_style:,
              border_width:,
              box_shadow:,
              # Ready-to-use CSS declarations for this style.
              css:,
              padding:,
              text_color:
            )
            end

            sig do
              override.returns(
                {
                  background_color: String,
                  border_color: String,
                  border_radius: String,
                  border_style: String,
                  border_width: String,
                  box_shadow: String,
                  css: String,
                  padding: String,
                  text_color: String
                }
              )
            end
            def to_hash
            end
          end
        end

        class ElementSpacing < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::ElementSpacing,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :lg

          sig { returns(String) }
          attr_accessor :md

          sig { returns(String) }
          attr_accessor :sm

          sig { returns(String) }
          attr_accessor :xl

          sig { returns(String) }
          attr_accessor :xs

          # Spacing scale used on the website, from `xs` to `xl`.
          sig do
            params(
              lg: String,
              md: String,
              sm: String,
              xl: String,
              xs: String
            ).returns(T.attached_class)
          end
          def self.new(lg:, md:, sm:, xl:, xs:)
          end

          sig do
            override.returns(
              { lg: String, md: String, sm: String, xl: String, xs: String }
            )
          end
          def to_hash
          end
        end

        class FontLink < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink,
                ContextDev::Internal::AnyHash
              )
            end

          # `google` for Google Fonts, `custom` for any other font source.
          sig do
            returns(
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Google Fonts category, such as `sans-serif`, `serif`, `monospace`, `display`, or
          # `handwriting`. Omitted for custom fonts when unknown.
          sig { returns(T.nilable(String)) }
          attr_reader :category

          sig { params(category: String).void }
          attr_writer :category

          # Human-readable family name: the `fontLinks` key for custom fonts, or the
          # official Google Fonts name for Google fonts.
          sig { returns(T.nilable(String)) }
          attr_reader :display_name

          sig { params(display_name: String).void }
          attr_writer :display_name

          # Font faces found for this family, one per style, weight, and Unicode subset.
          sig do
            returns(
              T.nilable(
                T::Array[
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Face
                ]
              )
            )
          end
          attr_reader :faces

          sig do
            params(
              faces:
                T::Array[
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Face::OrHash
                ]
            ).void
          end
          attr_writer :faces

          # Deprecated upright font lookup keyed by weight string. A variable font can map
          # several standard weight keys to the same URL; faces retains its actual weight
          # range.
          sig { returns(T.nilable(T::Hash[Symbol, String])) }
          attr_reader :files

          sig { params(files: T::Hash[Symbol, String]).void }
          attr_writer :files

          sig do
            params(
              type:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Type::OrSymbol,
              category: String,
              display_name: String,
              faces:
                T::Array[
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Face::OrHash
                ],
              files: T::Hash[Symbol, String]
            ).returns(T.attached_class)
          end
          def self.new(
            # `google` for Google Fonts, `custom` for any other font source.
            type:,
            # Google Fonts category, such as `sans-serif`, `serif`, `monospace`, `display`, or
            # `handwriting`. Omitted for custom fonts when unknown.
            category: nil,
            # Human-readable family name: the `fontLinks` key for custom fonts, or the
            # official Google Fonts name for Google fonts.
            display_name: nil,
            # Font faces found for this family, one per style, weight, and Unicode subset.
            faces: nil,
            # Deprecated upright font lookup keyed by weight string. A variable font can map
            # several standard weight keys to the same URL; faces retains its actual weight
            # range.
            files: nil
          )
          end

          sig do
            override.returns(
              {
                type:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Type::TaggedSymbol,
                category: String,
                display_name: String,
                faces:
                  T::Array[
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Face
                  ],
                files: T::Hash[Symbol, String]
              }
            )
          end
          def to_hash
          end

          # `google` for Google Fonts, `custom` for any other font source.
          module Type
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GOOGLE =
              T.let(
                :google,
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Type::TaggedSymbol
              )
            CUSTOM =
              T.let(
                :custom,
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Face < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::FontLink::Face,
                  ContextDev::Internal::AnyHash
                )
              end

            # CSS `font-style` descriptor: `normal`, `italic`, or `oblique`, with an optional
            # angle or angle range such as `oblique 10deg 20deg`.
            sig { returns(String) }
            attr_accessor :style

            # URL of the font file, or an inline data URL.
            sig { returns(String) }
            attr_accessor :url

            # CSS `font-weight` descriptor. A variable font can have a range such as
            # `300 500`, which covers every weight in between with one file.
            sig { returns(String) }
            attr_accessor :weight

            # CSS `unicode-range` descriptor.
            sig { returns(T.nilable(String)) }
            attr_reader :unicode_range

            sig { params(unicode_range: String).void }
            attr_writer :unicode_range

            # CSS `font-width` or `font-stretch` descriptor.
            sig { returns(T.nilable(String)) }
            attr_reader :width

            sig { params(width: String).void }
            attr_writer :width

            sig do
              params(
                style: String,
                url: String,
                weight: String,
                unicode_range: String,
                width: String
              ).returns(T.attached_class)
            end
            def self.new(
              # CSS `font-style` descriptor: `normal`, `italic`, or `oblique`, with an optional
              # angle or angle range such as `oblique 10deg 20deg`.
              style:,
              # URL of the font file, or an inline data URL.
              url:,
              # CSS `font-weight` descriptor. A variable font can have a range such as
              # `300 500`, which covers every weight in between with one file.
              weight:,
              # CSS `unicode-range` descriptor.
              unicode_range: nil,
              # CSS `font-width` or `font-stretch` descriptor.
              width: nil
            )
            end

            sig do
              override.returns(
                {
                  style: String,
                  url: String,
                  weight: String,
                  unicode_range: String,
                  width: String
                }
              )
            end
            def to_hash
            end
          end
        end

        # Whether the site's design is mainly light or dark.
        module Mode
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LIGHT =
            T.let(
              :light,
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Mode::TaggedSymbol
            )
          DARK =
            T.let(
              :dark,
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Shadows < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Shadows,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :inner

          sig { returns(String) }
          attr_accessor :lg

          sig { returns(String) }
          attr_accessor :md

          sig { returns(String) }
          attr_accessor :sm

          sig { returns(String) }
          attr_accessor :xl

          # Box shadow scale used on the website, from `sm` to `xl`, plus `inner`.
          sig do
            params(
              inner: String,
              lg: String,
              md: String,
              sm: String,
              xl: String
            ).returns(T.attached_class)
          end
          def self.new(inner:, lg:, md:, sm:, xl:)
          end

          sig do
            override.returns(
              { inner: String, lg: String, md: String, sm: String, xl: String }
            )
          end
          def to_hash
          end
        end

        class Typography < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography,
                ContextDev::Internal::AnyHash
              )
            end

          # Styles for `h1` through `h4` headings.
          sig do
            returns(
              ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings
            )
          end
          attr_reader :headings

          sig do
            params(
              headings:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::OrHash
            ).void
          end
          attr_writer :headings

          sig do
            returns(
              T.nilable(
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::P
              )
            )
          end
          attr_reader :p_

          sig do
            params(
              p_:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::P::OrHash
            ).void
          end
          attr_writer :p_

          # Text styles for headings and body text.
          sig do
            params(
              headings:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::OrHash,
              p_:
                ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::P::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Styles for `h1` through `h4` headings.
            headings:,
            p_: nil
          )
          end

          sig do
            override.returns(
              {
                headings:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings,
                p_:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::P
              }
            )
          end
          def to_hash
          end

          class Headings < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings,
                  ContextDev::Internal::AnyHash
                )
              end

            sig do
              returns(
                T.nilable(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H1
                )
              )
            end
            attr_reader :h1

            sig do
              params(
                h1:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H1::OrHash
              ).void
            end
            attr_writer :h1

            sig do
              returns(
                T.nilable(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H2
                )
              )
            end
            attr_reader :h2

            sig do
              params(
                h2:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H2::OrHash
              ).void
            end
            attr_writer :h2

            sig do
              returns(
                T.nilable(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H3
                )
              )
            end
            attr_reader :h3

            sig do
              params(
                h3:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H3::OrHash
              ).void
            end
            attr_writer :h3

            sig do
              returns(
                T.nilable(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H4
                )
              )
            end
            attr_reader :h4

            sig do
              params(
                h4:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H4::OrHash
              ).void
            end
            attr_writer :h4

            # Styles for `h1` through `h4` headings.
            sig do
              params(
                h1:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H1::OrHash,
                h2:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H2::OrHash,
                h3:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H3::OrHash,
                h4:
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H4::OrHash
              ).returns(T.attached_class)
            end
            def self.new(h1: nil, h2: nil, h3: nil, h4: nil)
            end

            sig do
              override.returns(
                {
                  h1:
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H1,
                  h2:
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H2,
                  h3:
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H3,
                  h4:
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H4
                }
              )
            end
            def to_hash
            end

            class H1 < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H1,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Full font stack from the computed `font-family`, in order.
              sig { returns(T::Array[String]) }
              attr_accessor :font_fallbacks

              # First font in the stack.
              sig { returns(String) }
              attr_accessor :font_family

              sig { returns(String) }
              attr_accessor :font_size

              sig { returns(Float) }
              attr_accessor :font_weight

              sig { returns(String) }
              attr_accessor :letter_spacing

              sig { returns(String) }
              attr_accessor :line_height

              sig do
                params(
                  font_fallbacks: T::Array[String],
                  font_family: String,
                  font_size: String,
                  font_weight: Float,
                  letter_spacing: String,
                  line_height: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Full font stack from the computed `font-family`, in order.
                font_fallbacks:,
                # First font in the stack.
                font_family:,
                font_size:,
                font_weight:,
                letter_spacing:,
                line_height:
              )
              end

              sig do
                override.returns(
                  {
                    font_fallbacks: T::Array[String],
                    font_family: String,
                    font_size: String,
                    font_weight: Float,
                    letter_spacing: String,
                    line_height: String
                  }
                )
              end
              def to_hash
              end
            end

            class H2 < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H2,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Full font stack from the computed `font-family`, in order.
              sig { returns(T::Array[String]) }
              attr_accessor :font_fallbacks

              # First font in the stack.
              sig { returns(String) }
              attr_accessor :font_family

              sig { returns(String) }
              attr_accessor :font_size

              sig { returns(Float) }
              attr_accessor :font_weight

              sig { returns(String) }
              attr_accessor :letter_spacing

              sig { returns(String) }
              attr_accessor :line_height

              sig do
                params(
                  font_fallbacks: T::Array[String],
                  font_family: String,
                  font_size: String,
                  font_weight: Float,
                  letter_spacing: String,
                  line_height: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Full font stack from the computed `font-family`, in order.
                font_fallbacks:,
                # First font in the stack.
                font_family:,
                font_size:,
                font_weight:,
                letter_spacing:,
                line_height:
              )
              end

              sig do
                override.returns(
                  {
                    font_fallbacks: T::Array[String],
                    font_family: String,
                    font_size: String,
                    font_weight: Float,
                    letter_spacing: String,
                    line_height: String
                  }
                )
              end
              def to_hash
              end
            end

            class H3 < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H3,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Full font stack from the computed `font-family`, in order.
              sig { returns(T::Array[String]) }
              attr_accessor :font_fallbacks

              # First font in the stack.
              sig { returns(String) }
              attr_accessor :font_family

              sig { returns(String) }
              attr_accessor :font_size

              sig { returns(Float) }
              attr_accessor :font_weight

              sig { returns(String) }
              attr_accessor :letter_spacing

              sig { returns(String) }
              attr_accessor :line_height

              sig do
                params(
                  font_fallbacks: T::Array[String],
                  font_family: String,
                  font_size: String,
                  font_weight: Float,
                  letter_spacing: String,
                  line_height: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Full font stack from the computed `font-family`, in order.
                font_fallbacks:,
                # First font in the stack.
                font_family:,
                font_size:,
                font_weight:,
                letter_spacing:,
                line_height:
              )
              end

              sig do
                override.returns(
                  {
                    font_fallbacks: T::Array[String],
                    font_family: String,
                    font_size: String,
                    font_weight: Float,
                    letter_spacing: String,
                    line_height: String
                  }
                )
              end
              def to_hash
              end
            end

            class H4 < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::Headings::H4,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Full font stack from the computed `font-family`, in order.
              sig { returns(T::Array[String]) }
              attr_accessor :font_fallbacks

              # First font in the stack.
              sig { returns(String) }
              attr_accessor :font_family

              sig { returns(String) }
              attr_accessor :font_size

              sig { returns(Float) }
              attr_accessor :font_weight

              sig { returns(String) }
              attr_accessor :letter_spacing

              sig { returns(String) }
              attr_accessor :line_height

              sig do
                params(
                  font_fallbacks: T::Array[String],
                  font_family: String,
                  font_size: String,
                  font_weight: Float,
                  letter_spacing: String,
                  line_height: String
                ).returns(T.attached_class)
              end
              def self.new(
                # Full font stack from the computed `font-family`, in order.
                font_fallbacks:,
                # First font in the stack.
                font_family:,
                font_size:,
                font_weight:,
                letter_spacing:,
                line_height:
              )
              end

              sig do
                override.returns(
                  {
                    font_fallbacks: T::Array[String],
                    font_family: String,
                    font_size: String,
                    font_weight: Float,
                    letter_spacing: String,
                    line_height: String
                  }
                )
              end
              def to_hash
              end
            end
          end

          class P < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::WebExtractStyleguideResponse::Styleguide::Typography::P,
                  ContextDev::Internal::AnyHash
                )
              end

            # Full font stack from the computed `font-family`, in order.
            sig { returns(T::Array[String]) }
            attr_accessor :font_fallbacks

            # First font in the stack.
            sig { returns(String) }
            attr_accessor :font_family

            sig { returns(String) }
            attr_accessor :font_size

            sig { returns(Float) }
            attr_accessor :font_weight

            sig { returns(String) }
            attr_accessor :letter_spacing

            sig { returns(String) }
            attr_accessor :line_height

            sig do
              params(
                font_fallbacks: T::Array[String],
                font_family: String,
                font_size: String,
                font_weight: Float,
                letter_spacing: String,
                line_height: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Full font stack from the computed `font-family`, in order.
              font_fallbacks:,
              # First font in the stack.
              font_family:,
              font_size:,
              font_weight:,
              letter_spacing:,
              line_height:
            )
            end

            sig do
              override.returns(
                {
                  font_fallbacks: T::Array[String],
                  font_family: String,
                  font_size: String,
                  font_weight: Float,
                  letter_spacing: String,
                  line_height: String
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
