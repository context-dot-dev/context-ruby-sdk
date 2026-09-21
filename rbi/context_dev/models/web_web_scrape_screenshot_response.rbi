# typed: strong

module ContextDev
  module Models
    class WebWebScrapeScreenshotResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebWebScrapeScreenshotResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Cache outcome for this response. Composite responses are hits only when every
      # cache-controlled fetch contributing to the output was a hit; age_ms is the
      # oldest contributing hit.
      sig do
        returns(
          ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata
        )
      end
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # Height of the returned image in pixels.
      sig { returns(Integer) }
      attr_accessor :height

      # Unique id of this API call, also sent in the X-Request-Id response header. Quote
      # it when contacting support about a failed request.
      sig { returns(String) }
      attr_accessor :request_id

      # Public image URL for standard requests, or an in-memory data URL when ZDR or
      # non-empty custom headers are supplied.
      sig { returns(String) }
      attr_accessor :screenshot

      # The requested page URL.
      sig { returns(String) }
      attr_accessor :url

      # Width of the returned image in pixels.
      sig { returns(Integer) }
      attr_accessor :width

      # How complete the returned content is. `loaded` means the page finished the waits
      # the request asked for. `still-loading` only occurs with
      # timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
      # reached first, so the content reflects the DOM at that moment and late-rendering
      # parts may be missing. Partial results are billed at the base request cost.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState::TaggedSymbol
          )
        )
      end
      attr_reader :final_dom_state

      sig do
        params(
          final_dom_state:
            ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState::OrSymbol
        ).void
      end
      attr_writer :final_dom_state

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::WebWebScrapeScreenshotResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebWebScrapeScreenshotResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::OrHash,
          height: Integer,
          request_id: String,
          screenshot: String,
          url: String,
          width: Integer,
          final_dom_state:
            ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState::OrSymbol,
          key_metadata:
            ContextDev::Models::WebWebScrapeScreenshotResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        cache_metadata:,
        # Height of the returned image in pixels.
        height:,
        # Unique id of this API call, also sent in the X-Request-Id response header. Quote
        # it when contacting support about a failed request.
        request_id:,
        # Public image URL for standard requests, or an in-memory data URL when ZDR or
        # non-empty custom headers are supplied.
        screenshot:,
        # The requested page URL.
        url:,
        # Width of the returned image in pixels.
        width:,
        # How complete the returned content is. `loaded` means the page finished the waits
        # the request asked for. `still-loading` only occurs with
        # timeoutOpts.behavior=return-partial: the timeoutOpts.milliseconds deadline was
        # reached first, so the content reflects the DOM at that moment and late-rendering
        # parts may be missing. Partial results are billed at the base request cost.
        final_dom_state: nil,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            cache_metadata:
              ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata,
            height: Integer,
            request_id: String,
            screenshot: String,
            url: String,
            width: Integer,
            final_dom_state:
              ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState::TaggedSymbol,
            key_metadata:
              ContextDev::Models::WebWebScrapeScreenshotResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata,
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
            ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status::TaggedSymbol
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
              ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status::OrSymbol
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
                ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status::TaggedSymbol
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
                ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
              ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOADED =
          T.let(
            :loaded,
            ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState::TaggedSymbol
          )
        STILL_LOADING =
          T.let(
            :"still-loading",
            ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState::TaggedSymbol
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
              ContextDev::Models::WebWebScrapeScreenshotResponse::KeyMetadata,
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
