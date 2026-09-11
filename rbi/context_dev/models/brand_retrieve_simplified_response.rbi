# typed: strong

module ContextDev
  module Models
    class BrandRetrieveSimplifiedResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BrandRetrieveSimplifiedResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Cache outcome for this response. Composite responses are hits only when every
      # cache-controlled fetch contributing to the output was a hit; age_ms is the
      # oldest contributing hit.
      sig do
        returns(
          ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata
        )
      end
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # Unique id of this API call, also sent in the X-Request-Id response header. Quote
      # it when contacting support about a failed request.
      sig { returns(String) }
      attr_accessor :request_id

      # Simplified brand information
      sig do
        returns(
          T.nilable(ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand)
        )
      end
      attr_reader :brand

      sig do
        params(
          brand:
            ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::OrHash
        ).void
      end
      attr_writer :brand

      # HTTP status code of the response
      sig { returns(T.nilable(Integer)) }
      attr_reader :code

      sig { params(code: Integer).void }
      attr_writer :code

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::BrandRetrieveSimplifiedResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BrandRetrieveSimplifiedResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Status of the response, e.g., 'ok'
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      sig do
        params(
          cache_metadata:
            ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata::OrHash,
          request_id: String,
          brand:
            ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::OrHash,
          code: Integer,
          key_metadata:
            ContextDev::Models::BrandRetrieveSimplifiedResponse::KeyMetadata::OrHash,
          status: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        cache_metadata:,
        # Unique id of this API call, also sent in the X-Request-Id response header. Quote
        # it when contacting support about a failed request.
        request_id:,
        # Simplified brand information
        brand: nil,
        # HTTP status code of the response
        code: nil,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil,
        # Status of the response, e.g., 'ok'
        status: nil
      )
      end

      sig do
        override.returns(
          {
            cache_metadata:
              ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata,
            request_id: String,
            brand: ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand,
            code: Integer,
            key_metadata:
              ContextDev::Models::BrandRetrieveSimplifiedResponse::KeyMetadata,
            status: String
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata,
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
            ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata::Status::TaggedSymbol
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
              ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata::Status::OrSymbol
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
                ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata::Status::TaggedSymbol
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
                ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Brand < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand,
              ContextDev::Internal::AnyHash
            )
          end

        # An array of backdrop images for the brand
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop
              ]
            )
          )
        end
        attr_reader :backdrops

        sig do
          params(
            backdrops:
              T::Array[
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::OrHash
              ]
          ).void
        end
        attr_writer :backdrops

        # An array of brand colors
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color
              ]
            )
          )
        end
        attr_reader :colors

        sig do
          params(
            colors:
              T::Array[
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color::OrHash
              ]
          ).void
        end
        attr_writer :colors

        # The domain name of the brand
        sig { returns(T.nilable(String)) }
        attr_reader :domain

        sig { params(domain: String).void }
        attr_writer :domain

        # An array of logos associated with the brand
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo
              ]
            )
          )
        end
        attr_reader :logos

        sig do
          params(
            logos:
              T::Array[
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::OrHash
              ]
          ).void
        end
        attr_writer :logos

        # The title or name of the brand
        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        # Simplified brand information
        sig do
          params(
            backdrops:
              T::Array[
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::OrHash
              ],
            colors:
              T::Array[
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color::OrHash
              ],
            domain: String,
            logos:
              T::Array[
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::OrHash
              ],
            title: String
          ).returns(T.attached_class)
        end
        def self.new(
          # An array of backdrop images for the brand
          backdrops: nil,
          # An array of brand colors
          colors: nil,
          # The domain name of the brand
          domain: nil,
          # An array of logos associated with the brand
          logos: nil,
          # The title or name of the brand
          title: nil
        )
        end

        sig do
          override.returns(
            {
              backdrops:
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop
                ],
              colors:
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color
                ],
              domain: String,
              logos:
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo
                ],
              title: String
            }
          )
        end
        def to_hash
        end

        class Backdrop < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop,
                ContextDev::Internal::AnyHash
              )
            end

          # Array of colors in the backdrop image
          sig do
            returns(
              T.nilable(
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::Color
                ]
              )
            )
          end
          attr_reader :colors

          sig do
            params(
              colors:
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::Color::OrHash
                ]
            ).void
          end
          attr_writer :colors

          # Resolution of the backdrop image
          sig do
            returns(
              T.nilable(
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::Resolution
              )
            )
          end
          attr_reader :resolution

          sig do
            params(
              resolution:
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::Resolution::OrHash
            ).void
          end
          attr_writer :resolution

          # URL of the backdrop image
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          sig do
            params(
              colors:
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::Color::OrHash
                ],
              resolution:
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::Resolution::OrHash,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Array of colors in the backdrop image
            colors: nil,
            # Resolution of the backdrop image
            resolution: nil,
            # URL of the backdrop image
            url: nil
          )
          end

          sig do
            override.returns(
              {
                colors:
                  T::Array[
                    ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::Color
                  ],
                resolution:
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::Resolution,
                url: String
              }
            )
          end
          def to_hash
          end

          class Color < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::Color,
                  ContextDev::Internal::AnyHash
                )
              end

            # Color in hexadecimal format
            sig { returns(T.nilable(String)) }
            attr_reader :hex

            sig { params(hex: String).void }
            attr_writer :hex

            # Name of the color
            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig { params(hex: String, name: String).returns(T.attached_class) }
            def self.new(
              # Color in hexadecimal format
              hex: nil,
              # Name of the color
              name: nil
            )
            end

            sig { override.returns({ hex: String, name: String }) }
            def to_hash
            end
          end

          class Resolution < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Backdrop::Resolution,
                  ContextDev::Internal::AnyHash
                )
              end

            # Aspect ratio of the image (width/height)
            sig { returns(T.nilable(Float)) }
            attr_reader :aspect_ratio

            sig { params(aspect_ratio: Float).void }
            attr_writer :aspect_ratio

            # Height of the image in pixels
            sig { returns(T.nilable(Integer)) }
            attr_reader :height

            sig { params(height: Integer).void }
            attr_writer :height

            # Width of the image in pixels
            sig { returns(T.nilable(Integer)) }
            attr_reader :width

            sig { params(width: Integer).void }
            attr_writer :width

            # Resolution of the backdrop image
            sig do
              params(
                aspect_ratio: Float,
                height: Integer,
                width: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # Aspect ratio of the image (width/height)
              aspect_ratio: nil,
              # Height of the image in pixels
              height: nil,
              # Width of the image in pixels
              width: nil
            )
            end

            sig do
              override.returns(
                { aspect_ratio: Float, height: Integer, width: Integer }
              )
            end
            def to_hash
            end
          end
        end

        class Color < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color,
                ContextDev::Internal::AnyHash
              )
            end

          # Color in hexadecimal format
          sig { returns(T.nilable(String)) }
          attr_reader :hex

          sig { params(hex: String).void }
          attr_writer :hex

          # Name of the color
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # Where the color was observed: 'site' colors come from the website's own theme
          # signals (rendered page colors, manifest, theme-color meta), 'logo' colors from
          # logo image pixels.
          sig do
            returns(
              T.nilable(
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color::Source::TaggedSymbol
              )
            )
          end
          attr_reader :source

          sig do
            params(
              source:
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color::Source::OrSymbol
            ).void
          end
          attr_writer :source

          sig do
            params(
              hex: String,
              name: String,
              source:
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color::Source::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Color in hexadecimal format
            hex: nil,
            # Name of the color
            name: nil,
            # Where the color was observed: 'site' colors come from the website's own theme
            # signals (rendered page colors, manifest, theme-color meta), 'logo' colors from
            # logo image pixels.
            source: nil
          )
          end

          sig do
            override.returns(
              {
                hex: String,
                name: String,
                source:
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color::Source::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Where the color was observed: 'site' colors come from the website's own theme
          # signals (rendered page colors, manifest, theme-color meta), 'logo' colors from
          # logo image pixels.
          module Source
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color::Source
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SITE =
              T.let(
                :site,
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color::Source::TaggedSymbol
              )
            LOGO =
              T.let(
                :logo,
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color::Source::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Color::Source::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class Logo < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo,
                ContextDev::Internal::AnyHash
              )
            end

          # Array of colors in the logo
          sig do
            returns(
              T.nilable(
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Color
                ]
              )
            )
          end
          attr_reader :colors

          sig do
            params(
              colors:
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Color::OrHash
                ]
            ).void
          end
          attr_writer :colors

          # Indicates when this logo is best used: 'light' = best for light mode, 'dark' =
          # best for dark mode, 'has_opaque_background' = can be used for either as image
          # has its own background
          sig do
            returns(
              T.nilable(
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Mode::TaggedSymbol
              )
            )
          end
          attr_reader :mode

          sig do
            params(
              mode:
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Mode::OrSymbol
            ).void
          end
          attr_writer :mode

          # Resolution of the logo image
          sig do
            returns(
              T.nilable(
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Resolution
              )
            )
          end
          attr_reader :resolution

          sig do
            params(
              resolution:
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Resolution::OrHash
            ).void
          end
          attr_writer :resolution

          # Type of the logo based on resolution (e.g., 'icon', 'logo')
          sig do
            returns(
              T.nilable(
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Type::TaggedSymbol
              )
            )
          end
          attr_reader :type

          sig do
            params(
              type:
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Type::OrSymbol
            ).void
          end
          attr_writer :type

          # CDN hosted url of the logo (ready for display)
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          sig do
            params(
              colors:
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Color::OrHash
                ],
              mode:
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Mode::OrSymbol,
              resolution:
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Resolution::OrHash,
              type:
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Type::OrSymbol,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Array of colors in the logo
            colors: nil,
            # Indicates when this logo is best used: 'light' = best for light mode, 'dark' =
            # best for dark mode, 'has_opaque_background' = can be used for either as image
            # has its own background
            mode: nil,
            # Resolution of the logo image
            resolution: nil,
            # Type of the logo based on resolution (e.g., 'icon', 'logo')
            type: nil,
            # CDN hosted url of the logo (ready for display)
            url: nil
          )
          end

          sig do
            override.returns(
              {
                colors:
                  T::Array[
                    ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Color
                  ],
                mode:
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Mode::TaggedSymbol,
                resolution:
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Resolution,
                type:
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Type::TaggedSymbol,
                url: String
              }
            )
          end
          def to_hash
          end

          class Color < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Color,
                  ContextDev::Internal::AnyHash
                )
              end

            # Color in hexadecimal format
            sig { returns(T.nilable(String)) }
            attr_reader :hex

            sig { params(hex: String).void }
            attr_writer :hex

            # Name of the color
            sig { returns(T.nilable(String)) }
            attr_reader :name

            sig { params(name: String).void }
            attr_writer :name

            sig { params(hex: String, name: String).returns(T.attached_class) }
            def self.new(
              # Color in hexadecimal format
              hex: nil,
              # Name of the color
              name: nil
            )
            end

            sig { override.returns({ hex: String, name: String }) }
            def to_hash
            end
          end

          # Indicates when this logo is best used: 'light' = best for light mode, 'dark' =
          # best for dark mode, 'has_opaque_background' = can be used for either as image
          # has its own background
          module Mode
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Mode
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LIGHT =
              T.let(
                :light,
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Mode::TaggedSymbol
              )
            DARK =
              T.let(
                :dark,
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Mode::TaggedSymbol
              )
            HAS_OPAQUE_BACKGROUND =
              T.let(
                :has_opaque_background,
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Mode::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Mode::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Resolution < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Resolution,
                  ContextDev::Internal::AnyHash
                )
              end

            # Aspect ratio of the image (width/height)
            sig { returns(T.nilable(Float)) }
            attr_reader :aspect_ratio

            sig { params(aspect_ratio: Float).void }
            attr_writer :aspect_ratio

            # Height of the image in pixels
            sig { returns(T.nilable(Integer)) }
            attr_reader :height

            sig { params(height: Integer).void }
            attr_writer :height

            # Width of the image in pixels
            sig { returns(T.nilable(Integer)) }
            attr_reader :width

            sig { params(width: Integer).void }
            attr_writer :width

            # Resolution of the logo image
            sig do
              params(
                aspect_ratio: Float,
                height: Integer,
                width: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # Aspect ratio of the image (width/height)
              aspect_ratio: nil,
              # Height of the image in pixels
              height: nil,
              # Width of the image in pixels
              width: nil
            )
            end

            sig do
              override.returns(
                { aspect_ratio: Float, height: Integer, width: Integer }
              )
            end
            def to_hash
            end
          end

          # Type of the logo based on resolution (e.g., 'icon', 'logo')
          module Type
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ICON =
              T.let(
                :icon,
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Type::TaggedSymbol
              )
            LOGO =
              T.let(
                :logo,
                ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand::Logo::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BrandRetrieveSimplifiedResponse::KeyMetadata,
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
