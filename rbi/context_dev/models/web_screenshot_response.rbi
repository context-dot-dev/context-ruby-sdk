# typed: strong

module ContextDev
  module Models
    class WebScreenshotResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebScreenshotResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Cache status of this response.
      sig { returns(ContextDev::Models::WebScreenshotResponse::CacheMetadata) }
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebScreenshotResponse::CacheMetadata::OrHash
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

      # Normalized domain that was captured.
      sig { returns(T.nilable(String)) }
      attr_reader :domain

      sig { params(domain: String).void }
      attr_writer :domain

      # `loaded`, or `still-loading` when capture ended before the page finished
      # loading.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebScreenshotResponse::FinalDomState::TaggedSymbol
          )
        )
      end
      attr_reader :final_dom_state

      sig do
        params(
          final_dom_state:
            ContextDev::Models::WebScreenshotResponse::FinalDomState::OrSymbol
        ).void
      end
      attr_writer :final_dom_state

      # Height of the returned image, in pixels.
      sig { returns(T.nilable(Integer)) }
      attr_reader :height

      sig { params(height: Integer).void }
      attr_writer :height

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(ContextDev::Models::WebScreenshotResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebScreenshotResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # URL of the screenshot image. A data URL instead when `zdr` is `enabled` or
      # `headers` are sent.
      sig { returns(T.nilable(String)) }
      attr_reader :screenshot

      sig { params(screenshot: String).void }
      attr_writer :screenshot

      # Whether the image covers the viewport or the full page.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebScreenshotResponse::ScreenshotType::TaggedSymbol
          )
        )
      end
      attr_reader :screenshot_type

      sig do
        params(
          screenshot_type:
            ContextDev::Models::WebScreenshotResponse::ScreenshotType::OrSymbol
        ).void
      end
      attr_writer :screenshot_type

      # Always `ok` on success.
      sig { returns(T.nilable(String)) }
      attr_reader :status

      sig { params(status: String).void }
      attr_writer :status

      # Width of the returned image, in pixels.
      sig { returns(T.nilable(Integer)) }
      attr_reader :width

      sig { params(width: Integer).void }
      attr_writer :width

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebScreenshotResponse::CacheMetadata::OrHash,
          request_id: String,
          code: Integer,
          domain: String,
          final_dom_state:
            ContextDev::Models::WebScreenshotResponse::FinalDomState::OrSymbol,
          height: Integer,
          key_metadata:
            ContextDev::Models::WebScreenshotResponse::KeyMetadata::OrHash,
          screenshot: String,
          screenshot_type:
            ContextDev::Models::WebScreenshotResponse::ScreenshotType::OrSymbol,
          status: String,
          width: Integer
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
        # Normalized domain that was captured.
        domain: nil,
        # `loaded`, or `still-loading` when capture ended before the page finished
        # loading.
        final_dom_state: nil,
        # Height of the returned image, in pixels.
        height: nil,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # URL of the screenshot image. A data URL instead when `zdr` is `enabled` or
        # `headers` are sent.
        screenshot: nil,
        # Whether the image covers the viewport or the full page.
        screenshot_type: nil,
        # Always `ok` on success.
        status: nil,
        # Width of the returned image, in pixels.
        width: nil
      )
      end

      sig do
        override.returns(
          {
            cache_metadata:
              ContextDev::Models::WebScreenshotResponse::CacheMetadata,
            request_id: String,
            code: Integer,
            domain: String,
            final_dom_state:
              ContextDev::Models::WebScreenshotResponse::FinalDomState::TaggedSymbol,
            height: Integer,
            key_metadata:
              ContextDev::Models::WebScreenshotResponse::KeyMetadata,
            screenshot: String,
            screenshot_type:
              ContextDev::Models::WebScreenshotResponse::ScreenshotType::TaggedSymbol,
            status: String,
            width: Integer
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebScreenshotResponse::CacheMetadata,
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
            ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Cache status of this response.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status::OrSymbol
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
                ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status::TaggedSymbol
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
                ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebScreenshotResponse::CacheMetadata::Status::TaggedSymbol
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
              ContextDev::Models::WebScreenshotResponse::FinalDomState
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOADED =
          T.let(
            :loaded,
            ContextDev::Models::WebScreenshotResponse::FinalDomState::TaggedSymbol
          )
        STILL_LOADING =
          T.let(
            :"still-loading",
            ContextDev::Models::WebScreenshotResponse::FinalDomState::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebScreenshotResponse::FinalDomState::TaggedSymbol
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
              ContextDev::Models::WebScreenshotResponse::KeyMetadata,
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

      # Whether the image covers the viewport or the full page.
      module ScreenshotType
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              ContextDev::Models::WebScreenshotResponse::ScreenshotType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        VIEWPORT =
          T.let(
            :viewport,
            ContextDev::Models::WebScreenshotResponse::ScreenshotType::TaggedSymbol
          )
        FULL_PAGE =
          T.let(
            :fullPage,
            ContextDev::Models::WebScreenshotResponse::ScreenshotType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebScreenshotResponse::ScreenshotType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
