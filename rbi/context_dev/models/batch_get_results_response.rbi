# typed: strong

module ContextDev
  module Models
    class BatchGetResultsResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::BatchGetResultsResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Result records on this page.
      sig do
        returns(
          T.nilable(
            T::Array[
              ContextDev::Models::BatchGetResultsResponse::Data::Variants
            ]
          )
        )
      end
      attr_reader :data

      sig do
        params(
          data:
            T::Array[
              T.any(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::OrHash,
                ContextDev::Models::BatchGetResultsResponse::Data::Error::OrHash
              )
            ]
        ).void
      end
      attr_writer :data

      # Whether another page is available.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_more

      sig { params(has_more: T::Boolean).void }
      attr_writer :has_more

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(ContextDev::Models::BatchGetResultsResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::BatchGetResultsResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Cursor for the next page.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      sig do
        params(
          request_id: String,
          data:
            T::Array[
              T.any(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::OrHash,
                ContextDev::Models::BatchGetResultsResponse::Data::Error::OrHash
              )
            ],
          has_more: T::Boolean,
          key_metadata:
            ContextDev::Models::BatchGetResultsResponse::KeyMetadata::OrHash,
          next_cursor: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Result records on this page.
        data: nil,
        # Whether another page is available.
        has_more: nil,
        # Credits this request used and your remaining balance.
        key_metadata: nil,
        # Cursor for the next page.
        next_cursor: nil
      )
      end

      sig do
        override.returns(
          {
            request_id: String,
            data:
              T::Array[
                ContextDev::Models::BatchGetResultsResponse::Data::Variants
              ],
            has_more: T::Boolean,
            key_metadata:
              ContextDev::Models::BatchGetResultsResponse::KeyMetadata,
            next_cursor: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      # One scrape outcome. result uses the single Scrape Anything response schema;
      # itemId and meta identify your input.
      module Data
        extend ContextDev::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchGetResultsResponse::Data::Ok,
              ContextDev::Models::BatchGetResultsResponse::Data::Error
            )
          end

        class Ok < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok,
                ContextDev::Internal::AnyHash
              )
            end

          # Credits charged for this page, including OCR. Cached outputs use the same
          # pricing as POST /web/scrape.
          sig { returns(Integer) }
          attr_accessor :credits_used

          # The same response as POST /web/scrape, including per-format success, failure,
          # and partial results.
          sig do
            returns(
              ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result
            )
          end
          attr_reader :result

          sig do
            params(
              result:
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::OrHash
            ).void
          end
          attr_writer :result

          sig { returns(Symbol) }
          attr_accessor :status

          # URL as submitted, or as discovered by the crawl.
          sig { returns(String) }
          attr_accessor :url

          # Your `itemId` from submission.
          sig { returns(T.nilable(String)) }
          attr_reader :item_id

          sig { params(item_id: String).void }
          attr_writer :item_id

          # Caller-supplied metadata echoed from submission.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :meta

          sig { params(meta: T::Hash[Symbol, T.anything]).void }
          attr_writer :meta

          # PDF pages recovered by OCR. Omitted when OCR did not run.
          sig { returns(T.nilable(Integer)) }
          attr_reader :ocr_pages

          sig { params(ocr_pages: Integer).void }
          attr_writer :ocr_pages

          # At least one requested output succeeded. Check result.isPartial and each output
          # success for incomplete results.
          sig do
            params(
              credits_used: Integer,
              result:
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::OrHash,
              url: String,
              item_id: String,
              meta: T::Hash[Symbol, T.anything],
              ocr_pages: Integer,
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Credits charged for this page, including OCR. Cached outputs use the same
            # pricing as POST /web/scrape.
            credits_used:,
            # The same response as POST /web/scrape, including per-format success, failure,
            # and partial results.
            result:,
            # URL as submitted, or as discovered by the crawl.
            url:,
            # Your `itemId` from submission.
            item_id: nil,
            # Caller-supplied metadata echoed from submission.
            meta: nil,
            # PDF pages recovered by OCR. Omitted when OCR did not run.
            ocr_pages: nil,
            status: :ok
          )
          end

          sig do
            override.returns(
              {
                credits_used: Integer,
                result:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result,
                status: Symbol,
                url: String,
                item_id: String,
                meta: T::Hash[Symbol, T.anything],
                ocr_pages: Integer
              }
            )
          end
          def to_hash
          end

          class Result < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result,
                  ContextDev::Internal::AnyHash
                )
              end

            # The original HTTP response body, unchanged by waits, actions, and filters.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes
              )
            end
            attr_reader :bytes

            sig do
              params(
                bytes:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::OrHash
              ).void
            end
            attr_writer :bytes

            # Whether this response came from cache.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata
              )
            end
            attr_reader :cache_metadata

            sig do
              params(
                cache_metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::OrHash
              ).void
            end
            attr_writer :cache_metadata

            # Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
            # omitted text.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Highlights
              )
            end
            attr_reader :highlights

            sig do
              params(
                highlights:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Highlights::OrHash
              ).void
            end
            attr_writer :highlights

            # Rendered HTML after content filters.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML
              )
            end
            attr_reader :html

            sig do
              params(
                html:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML::OrHash
              ).void
            end
            attr_writer :html

            # Images after content filters. `[]` when none are found.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images
              )
            end
            attr_reader :images

            sig do
              params(
                images:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::OrHash
              ).void
            end
            attr_writer :images

            # Object matching `jsonParams.schema`.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json
              )
            end
            attr_reader :json

            sig do
              params(
                json:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::OrHash
              ).void
            end
            attr_writer :json

            # Markdown after content filters.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown
              )
            end
            attr_reader :markdown

            sig do
              params(
                markdown:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown::OrHash
              ).void
            end
            attr_writer :markdown

            # Page metadata. Fields are omitted when not found.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata
              )
            end
            attr_reader :metadata

            sig do
              params(
                metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::OrHash
              ).void
            end
            attr_writer :metadata

            # Custom rules return fields after content filters; unmatched fields are null ([]
            # for lists). The google-maps parser returns business records in data.results,
            # google-maps-reviews returns data.reviews, and the google-play parser returns one
            # app record as data, google-play-reviews returns data.reviews, app-store and
            # app-store-reviews do the same for the App Store, g2-reviews returns data.reviews
            # for a G2 product, instagram-profile and instagram-post return one record as
            # data, instagram-feed returns data.posts, tiktok-profile and tiktok-video return
            # one record as data, tiktok-feed returns data.videos, tiktok-comments returns
            # data.comments, tiktok-followers, tiktok-following, and tiktok-user-search return
            # data.users, yelp-search returns up to 20 ranked organic businesses in
            # data.businesses, plus total and pagination, from a Yelp search URL; emails,
            # phone-numbers, and links return data.emails, data.phone_numbers, and data.links
            # from the rendered page; the store, Maps, G2, Instagram, and TikTok parsers read
            # their data directly, independently of DOM filters and other outputs.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed
              )
            end
            attr_reader :parsed

            sig do
              params(
                parsed:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::OrHash
              ).void
            end
            attr_writer :parsed

            # Product details found on the page.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product
              )
            end
            attr_reader :product

            sig do
              params(
                product:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::OrHash
              ).void
            end
            attr_writer :product

            # Authenticated browser profile used for this scrape, or null when no profile was
            # requested. New and existing profile requests both return the profile ID.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile
                )
              )
            end
            attr_reader :profile

            sig do
              params(
                profile:
                  T.nilable(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile::OrHash
                  )
              ).void
            end
            attr_writer :profile

            # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
            # support.
            sig { returns(String) }
            attr_accessor :request_id

            # Screenshot as a base64 image data URL.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Screenshot
              )
            end
            attr_reader :screenshot

            sig do
              params(
                screenshot:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Screenshot::OrHash
              ).void
            end
            attr_writer :screenshot

            # Final URL after redirects and browser actions.
            sig { returns(String) }
            attr_accessor :url

            # True when at least one requested output succeeds but the response has failed or
            # incomplete outputs. Absent when all requested outputs fail.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial::TaggedBoolean
                )
              )
            end
            attr_reader :is_partial

            sig do
              params(
                is_partial:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial::OrBoolean
              ).void
            end
            attr_writer :is_partial

            # Credits this request used and your remaining balance.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::KeyMetadata
                )
              )
            end
            attr_reader :key_metadata

            sig do
              params(
                key_metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::KeyMetadata::OrHash
              ).void
            end
            attr_writer :key_metadata

            # The same response as POST /web/scrape, including per-format success, failure,
            # and partial results.
            sig do
              params(
                bytes:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::OrHash,
                cache_metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::OrHash,
                highlights:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Highlights::OrHash,
                html:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML::OrHash,
                images:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::OrHash,
                json:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::OrHash,
                markdown:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown::OrHash,
                metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::OrHash,
                parsed:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::OrHash,
                product:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::OrHash,
                profile:
                  T.nilable(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile::OrHash
                  ),
                request_id: String,
                screenshot:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Screenshot::OrHash,
                url: String,
                is_partial:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial::OrBoolean,
                key_metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::KeyMetadata::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # The original HTTP response body, unchanged by waits, actions, and filters.
              bytes:,
              # Whether this response came from cache.
              cache_metadata:,
              # Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
              # omitted text.
              highlights:,
              # Rendered HTML after content filters.
              html:,
              # Images after content filters. `[]` when none are found.
              images:,
              # Object matching `jsonParams.schema`.
              json:,
              # Markdown after content filters.
              markdown:,
              # Page metadata. Fields are omitted when not found.
              metadata:,
              # Custom rules return fields after content filters; unmatched fields are null ([]
              # for lists). The google-maps parser returns business records in data.results,
              # google-maps-reviews returns data.reviews, and the google-play parser returns one
              # app record as data, google-play-reviews returns data.reviews, app-store and
              # app-store-reviews do the same for the App Store, g2-reviews returns data.reviews
              # for a G2 product, instagram-profile and instagram-post return one record as
              # data, instagram-feed returns data.posts, tiktok-profile and tiktok-video return
              # one record as data, tiktok-feed returns data.videos, tiktok-comments returns
              # data.comments, tiktok-followers, tiktok-following, and tiktok-user-search return
              # data.users, yelp-search returns up to 20 ranked organic businesses in
              # data.businesses, plus total and pagination, from a Yelp search URL; emails,
              # phone-numbers, and links return data.emails, data.phone_numbers, and data.links
              # from the rendered page; the store, Maps, G2, Instagram, and TikTok parsers read
              # their data directly, independently of DOM filters and other outputs.
              parsed:,
              # Product details found on the page.
              product:,
              # Authenticated browser profile used for this scrape, or null when no profile was
              # requested. New and existing profile requests both return the profile ID.
              profile:,
              # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
              # support.
              request_id:,
              # Screenshot as a base64 image data URL.
              screenshot:,
              # Final URL after redirects and browser actions.
              url:,
              # True when at least one requested output succeeds but the response has failed or
              # incomplete outputs. Absent when all requested outputs fail.
              is_partial: nil,
              # Credits this request used and your remaining balance.
              key_metadata: nil
            )
            end

            sig do
              override.returns(
                {
                  bytes:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes,
                  cache_metadata:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata,
                  highlights:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Highlights,
                  html:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML,
                  images:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images,
                  json:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json,
                  markdown:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown,
                  metadata:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata,
                  parsed:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed,
                  product:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product,
                  profile:
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile
                    ),
                  request_id: String,
                  screenshot:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Screenshot,
                  url: String,
                  is_partial:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial::TaggedBoolean,
                  key_metadata:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::KeyMetadata
                }
              )
            end
            def to_hash
            end

            class Bytes < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::Data
                  )
                )
              end
              attr_reader :data

              sig do
                params(
                  data:
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::Data::OrHash
                    )
                ).void
              end
              attr_writer :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # The original HTTP response body, unchanged by waits, actions, and filters.
              sig do
                params(
                  data:
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::Data::OrHash
                    ),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data:
                      T.nilable(
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::Data
                      ),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end

              class Data < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Bytes::Data,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Body as base64, after HTTP decompression. Up to 50 MiB decoded.
                sig { returns(String) }
                attr_accessor :base64

                sig { returns(String) }
                attr_accessor :content_type

                sig do
                  params(base64: String, content_type: String).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # Body as base64, after HTTP decompression. Up to 50 MiB decoded.
                  base64:,
                  content_type:
                )
                end

                sig do
                  override.returns({ base64: String, content_type: String })
                end
                def to_hash
                end
              end
            end

            class CacheMetadata < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata,
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
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status::TaggedSymbol
                )
              end
              attr_accessor :status

              # Whether this response came from cache.
              sig do
                params(
                  age_ms: Integer,
                  status:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status::OrSymbol
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
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status::TaggedSymbol
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
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                HIT =
                  T.let(
                    :hit,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status::TaggedSymbol
                  )
                MISS =
                  T.let(
                    :miss,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status::TaggedSymbol
                  )
                ZDR =
                  T.let(
                    :zdr,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::CacheMetadata::Status::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Highlights < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Highlights,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(T::Array[String])) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
              # omitted text.
              sig do
                params(
                  data: T.nilable(T::Array[String]),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(T::Array[String]),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end
            end

            class HTML < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::HTML,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Rendered HTML after content filters.
              sig do
                params(
                  data: T.nilable(String),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(String),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end
            end

            class Images < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data
                    ]
                  )
                )
              end
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Images after content filters. `[]` when none are found.
              sig do
                params(
                  data:
                    T.nilable(
                      T::Array[
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::OrHash
                      ]
                    ),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data:
                      T.nilable(
                        T::Array[
                          ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data
                        ]
                      ),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end

              class Data < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Alt text, if present.
                sig { returns(T.nilable(String)) }
                attr_accessor :alt

                # Image URL, or a data URI for inline images.
                sig { returns(String) }
                attr_accessor :url

                sig do
                  returns(
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol
                    )
                  )
                end
                attr_reader :classification

                sig do
                  params(
                    classification:
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::OrSymbol
                  ).void
                end
                attr_writer :classification

                # Hosted image URL, valid for 24 hours after capture. Requires `file` enrichment
                # and ZDR disabled.
                sig { returns(T.nilable(String)) }
                attr_reader :file_url

                sig { params(file_url: String).void }
                attr_writer :file_url

                sig { returns(T.nilable(Integer)) }
                attr_reader :height

                sig { params(height: Integer).void }
                attr_writer :height

                sig { returns(T.nilable(Integer)) }
                attr_reader :width

                sig { params(width: Integer).void }
                attr_writer :width

                sig do
                  params(
                    alt: T.nilable(String),
                    url: String,
                    classification:
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::OrSymbol,
                    file_url: String,
                    height: Integer,
                    width: Integer
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Alt text, if present.
                  alt:,
                  # Image URL, or a data URI for inline images.
                  url:,
                  classification: nil,
                  # Hosted image URL, valid for 24 hours after capture. Requires `file` enrichment
                  # and ZDR disabled.
                  file_url: nil,
                  height: nil,
                  width: nil
                )
                end

                sig do
                  override.returns(
                    {
                      alt: T.nilable(String),
                      url: String,
                      classification:
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol,
                      file_url: String,
                      height: Integer,
                      width: Integer
                    }
                  )
                end
                def to_hash
                end

                module Classification
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  PHOTOGRAPHY =
                    T.let(
                      :photography,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol
                    )
                  ILLUSTRATION =
                    T.let(
                      :illustration,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol
                    )
                  LOGO =
                    T.let(
                      :logo,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol
                    )
                  WORDMARK =
                    T.let(
                      :wordmark,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol
                    )
                  ICON =
                    T.let(
                      :icon,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol
                    )
                  PATTERN =
                    T.let(
                      :pattern,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol
                    )
                  GRAPHIC =
                    T.let(
                      :graphic,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol
                    )
                  OTHER =
                    T.let(
                      :other,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Images::Data::Classification::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end

            class Json < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # True when the page was too long to read in full, so values found only in the
              # unread parts may be missing.
              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated::TaggedBoolean
                  )
                )
              end
              attr_reader :is_truncated

              sig do
                params(
                  is_truncated:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated::OrBoolean
                ).void
              end
              attr_writer :is_truncated

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Object matching `jsonParams.schema`.
              sig do
                params(
                  data: T.nilable(T::Hash[Symbol, T.anything]),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  is_truncated:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated::OrBoolean,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # True when the page was too long to read in full, so values found only in the
                # unread parts may be missing.
                is_truncated: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(T::Hash[Symbol, T.anything]),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    is_truncated:
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated::TaggedBoolean,
                    message: String
                  }
                )
              end
              def to_hash
              end

              # True when the page was too long to read in full, so values found only in the
              # unread parts may be missing.
              module IsTruncated
                extend ContextDev::Internal::Type::Enum

                TaggedBoolean =
                  T.type_alias do
                    T.all(
                      T::Boolean,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated
                    )
                  end
                OrBoolean = T.type_alias { T::Boolean }

                TRUE =
                  T.let(
                    true,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated::TaggedBoolean
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Json::IsTruncated::TaggedBoolean
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Markdown < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Markdown,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Markdown after content filters.
              sig do
                params(
                  data: T.nilable(String),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(String),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end
            end

            class Metadata < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Additional non-social meta tags not promoted to top-level metadata fields.
              sig do
                returns(
                  T.nilable(
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::AdditionalMeta::Variants
                    ]
                  )
                )
              end
              attr_reader :additional_meta

              sig do
                params(
                  additional_meta:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::AdditionalMeta::Variants
                    ]
                ).void
              end
              attr_writer :additional_meta

              # Resolved alternate links from link rel=alternate tags.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate
                    ]
                  )
                )
              end
              attr_reader :alternates

              sig do
                params(
                  alternates:
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate::OrHash
                    ]
                ).void
              end
              attr_writer :alternates

              # Author metadata, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :author

              sig { params(author: String).void }
              attr_writer :author

              # Resolved canonical URL, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :canonical_url

              sig { params(canonical_url: String).void }
              attr_writer :canonical_url

              # Best description extracted from standard, Open Graph, or Twitter metadata.
              sig { returns(T.nilable(String)) }
              attr_reader :description

              sig { params(description: String).void }
              attr_writer :description

              # Resolved favicon URL, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :favicon

              sig { params(favicon: String).void }
              attr_writer :favicon

              # Up to 500 h1–h6 headings in document order, before content filtering.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading
                    ]
                  )
                )
              end
              attr_reader :headings

              sig do
                params(
                  headings:
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading::OrHash
                    ]
                ).void
              end
              attr_writer :headings

              # Primary resolved preview image from Open Graph, Twitter, or image metadata.
              sig { returns(T.nilable(String)) }
              attr_reader :image

              sig { params(image: String).void }
              attr_writer :image

              # JSON-LD structured data blocks parsed from the page.
              sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
              attr_reader :json_ld

              sig do
                params(json_ld: T::Array[T::Hash[Symbol, T.anything]]).void
              end
              attr_writer :json_ld

              # Keywords extracted from the page's keywords meta tag.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :keywords

              sig { params(keywords: T::Array[String]).void }
              attr_writer :keywords

              # Language extracted from html lang or language meta tags.
              sig { returns(T.nilable(String)) }
              attr_reader :language

              sig { params(language: String).void }
              attr_writer :language

              # Modified timestamp/date from page metadata, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :modified_time

              sig { params(modified_time: String).void }
              attr_writer :modified_time

              # Open Graph metadata with the og: prefix removed and keys camel-cased.
              sig do
                returns(
                  T.nilable(
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::OpenGraph::Variants
                    ]
                  )
                )
              end
              attr_reader :open_graph

              sig do
                params(
                  open_graph:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::OpenGraph::Variants
                    ]
                ).void
              end
              attr_writer :open_graph

              # Published timestamp/date from page metadata, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :published_time

              sig { params(published_time: String).void }
              attr_writer :published_time

              # Robots meta directive, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :robots

              sig { params(robots: String).void }
              attr_writer :robots

              # Site or application name from page metadata.
              sig { returns(T.nilable(String)) }
              attr_reader :site_name

              sig { params(site_name: String).void }
              attr_writer :site_name

              # Best title extracted from the page.
              sig { returns(T.nilable(String)) }
              attr_reader :title

              sig { params(title: String).void }
              attr_writer :title

              # Twitter card metadata with the twitter: prefix removed and keys camel-cased.
              sig do
                returns(
                  T.nilable(
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Twitter::Variants
                    ]
                  )
                )
              end
              attr_reader :twitter

              sig do
                params(
                  twitter:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Twitter::Variants
                    ]
                ).void
              end
              attr_writer :twitter

              # Page metadata. Fields are omitted when not found.
              sig do
                params(
                  additional_meta:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::AdditionalMeta::Variants
                    ],
                  alternates:
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate::OrHash
                    ],
                  author: String,
                  canonical_url: String,
                  description: String,
                  favicon: String,
                  headings:
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading::OrHash
                    ],
                  image: String,
                  json_ld: T::Array[T::Hash[Symbol, T.anything]],
                  keywords: T::Array[String],
                  language: String,
                  modified_time: String,
                  open_graph:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::OpenGraph::Variants
                    ],
                  published_time: String,
                  robots: String,
                  site_name: String,
                  title: String,
                  twitter:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Twitter::Variants
                    ]
                ).returns(T.attached_class)
              end
              def self.new(
                # Additional non-social meta tags not promoted to top-level metadata fields.
                additional_meta: nil,
                # Resolved alternate links from link rel=alternate tags.
                alternates: nil,
                # Author metadata, when present.
                author: nil,
                # Resolved canonical URL, when present.
                canonical_url: nil,
                # Best description extracted from standard, Open Graph, or Twitter metadata.
                description: nil,
                # Resolved favicon URL, when present.
                favicon: nil,
                # Up to 500 h1–h6 headings in document order, before content filtering.
                headings: nil,
                # Primary resolved preview image from Open Graph, Twitter, or image metadata.
                image: nil,
                # JSON-LD structured data blocks parsed from the page.
                json_ld: nil,
                # Keywords extracted from the page's keywords meta tag.
                keywords: nil,
                # Language extracted from html lang or language meta tags.
                language: nil,
                # Modified timestamp/date from page metadata, when present.
                modified_time: nil,
                # Open Graph metadata with the og: prefix removed and keys camel-cased.
                open_graph: nil,
                # Published timestamp/date from page metadata, when present.
                published_time: nil,
                # Robots meta directive, when present.
                robots: nil,
                # Site or application name from page metadata.
                site_name: nil,
                # Best title extracted from the page.
                title: nil,
                # Twitter card metadata with the twitter: prefix removed and keys camel-cased.
                twitter: nil
              )
              end

              sig do
                override.returns(
                  {
                    additional_meta:
                      T::Hash[
                        Symbol,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::AdditionalMeta::Variants
                      ],
                    alternates:
                      T::Array[
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate
                      ],
                    author: String,
                    canonical_url: String,
                    description: String,
                    favicon: String,
                    headings:
                      T::Array[
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading
                      ],
                    image: String,
                    json_ld: T::Array[T::Hash[Symbol, T.anything]],
                    keywords: T::Array[String],
                    language: String,
                    modified_time: String,
                    open_graph:
                      T::Hash[
                        Symbol,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::OpenGraph::Variants
                      ],
                    published_time: String,
                    robots: String,
                    site_name: String,
                    title: String,
                    twitter:
                      T::Hash[
                        Symbol,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Twitter::Variants
                      ]
                  }
                )
              end
              def to_hash
              end

              module AdditionalMeta
                extend ContextDev::Internal::Type::Union

                Variants = T.type_alias { T.any(String, T::Array[String]) }

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::AdditionalMeta::Variants
                    ]
                  )
                end
                def self.variants
                end

                StringArray =
                  T.let(
                    ContextDev::Internal::Type::ArrayOf[String],
                    ContextDev::Internal::Type::Converter
                  )
              end

              class Alternate < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Alternate,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Resolved alternate URL.
                sig { returns(String) }
                attr_accessor :href

                # Language or locale for the alternate URL, when present.
                sig { returns(T.nilable(String)) }
                attr_reader :hreflang

                sig { params(hreflang: String).void }
                attr_writer :hreflang

                # Alternate resource title, when present.
                sig { returns(T.nilable(String)) }
                attr_reader :title

                sig { params(title: String).void }
                attr_writer :title

                # Alternate resource MIME type, when present.
                sig { returns(T.nilable(String)) }
                attr_reader :type

                sig { params(type: String).void }
                attr_writer :type

                sig do
                  params(
                    href: String,
                    hreflang: String,
                    title: String,
                    type: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Resolved alternate URL.
                  href:,
                  # Language or locale for the alternate URL, when present.
                  hreflang: nil,
                  # Alternate resource title, when present.
                  title: nil,
                  # Alternate resource MIME type, when present.
                  type: nil
                )
                end

                sig do
                  override.returns(
                    {
                      href: String,
                      hreflang: String,
                      title: String,
                      type: String
                    }
                  )
                end
                def to_hash
                end
              end

              class Heading < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Heading,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Heading level, 1–6 (from h1–h6).
                sig { returns(Integer) }
                attr_accessor :level

                # Heading text with whitespace collapsed, truncated to 1000 characters.
                sig { returns(String) }
                attr_accessor :text

                sig do
                  params(level: Integer, text: String).returns(T.attached_class)
                end
                def self.new(
                  # Heading level, 1–6 (from h1–h6).
                  level:,
                  # Heading text with whitespace collapsed, truncated to 1000 characters.
                  text:
                )
                end

                sig { override.returns({ level: Integer, text: String }) }
                def to_hash
                end
              end

              module OpenGraph
                extend ContextDev::Internal::Type::Union

                Variants = T.type_alias { T.any(String, T::Array[String]) }

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::OpenGraph::Variants
                    ]
                  )
                end
                def self.variants
                end

                StringArray =
                  T.let(
                    ContextDev::Internal::Type::ArrayOf[String],
                    ContextDev::Internal::Type::Converter
                  )
              end

              module Twitter
                extend ContextDev::Internal::Type::Union

                Variants = T.type_alias { T.any(String, T::Array[String]) }

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Metadata::Twitter::Variants
                    ]
                  )
                end
                def self.variants
                end

                StringArray =
                  T.let(
                    ContextDev::Internal::Type::ArrayOf[String],
                    ContextDev::Internal::Type::Converter
                  )
              end
            end

            class Parsed < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # The selected prebuilt parser name, or custom when type is omitted, custom rules
              # are used, or parsing is not requested.
              sig do
                returns(
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                )
              end
              attr_accessor :type

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Custom rules return fields after content filters; unmatched fields are null ([]
              # for lists). The google-maps parser returns business records in data.results,
              # google-maps-reviews returns data.reviews, and the google-play parser returns one
              # app record as data, google-play-reviews returns data.reviews, app-store and
              # app-store-reviews do the same for the App Store, g2-reviews returns data.reviews
              # for a G2 product, instagram-profile and instagram-post return one record as
              # data, instagram-feed returns data.posts, tiktok-profile and tiktok-video return
              # one record as data, tiktok-feed returns data.videos, tiktok-comments returns
              # data.comments, tiktok-followers, tiktok-following, and tiktok-user-search return
              # data.users, yelp-search returns up to 20 ranked organic businesses in
              # data.businesses, plus total and pagination, from a Yelp search URL; emails,
              # phone-numbers, and links return data.emails, data.phone_numbers, and data.links
              # from the rendered page; the store, Maps, G2, Instagram, and TikTok parsers read
              # their data directly, independently of DOM filters and other outputs.
              sig do
                params(
                  data: T.nilable(T::Hash[Symbol, T.anything]),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  type:
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::OrSymbol,
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # The selected prebuilt parser name, or custom when type is omitted, custom rules
                # are used, or parsing is not requested.
                type:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(T::Hash[Symbol, T.anything]),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    type:
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol,
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end

              # The selected prebuilt parser name, or custom when type is omitted, custom rules
              # are used, or parsing is not requested.
              module Type
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                CUSTOM =
                  T.let(
                    :custom,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                GOOGLE_MAPS =
                  T.let(
                    :"google-maps",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                GOOGLE_MAPS_REVIEWS =
                  T.let(
                    :"google-maps-reviews",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                GOOGLE_PLAY =
                  T.let(
                    :"google-play",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                GOOGLE_PLAY_REVIEWS =
                  T.let(
                    :"google-play-reviews",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                APP_STORE =
                  T.let(
                    :"app-store",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                APP_STORE_REVIEWS =
                  T.let(
                    :"app-store-reviews",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                G2_REVIEWS =
                  T.let(
                    :"g2-reviews",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                INSTAGRAM_PROFILE =
                  T.let(
                    :"instagram-profile",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                INSTAGRAM_POST =
                  T.let(
                    :"instagram-post",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                INSTAGRAM_FEED =
                  T.let(
                    :"instagram-feed",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_PROFILE =
                  T.let(
                    :"tiktok-profile",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_VIDEO =
                  T.let(
                    :"tiktok-video",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_FEED =
                  T.let(
                    :"tiktok-feed",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_COMMENTS =
                  T.let(
                    :"tiktok-comments",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_FOLLOWERS =
                  T.let(
                    :"tiktok-followers",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_FOLLOWING =
                  T.let(
                    :"tiktok-following",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_USER_SEARCH =
                  T.let(
                    :"tiktok-user-search",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                YELP_SEARCH =
                  T.let(
                    :"yelp-search",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                EMAILS =
                  T.let(
                    :emails,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                PHONE_NUMBERS =
                  T.let(
                    :"phone-numbers",
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )
                LINKS =
                  T.let(
                    :links,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Parsed::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Product < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data
                  )
                )
              end
              attr_reader :data

              sig do
                params(
                  data:
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::OrHash
                    )
                ).void
              end
              attr_writer :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Product details found on the page.
              sig do
                params(
                  data:
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::OrHash
                    ),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data:
                      T.nilable(
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data
                      ),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end

              class Data < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Whether the page is a product detail page.
                sig { returns(T::Boolean) }
                attr_accessor :is_product_page

                # The extracted product, or null when the page is not a product detail page.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product
                    )
                  )
                end
                attr_reader :product

                sig do
                  params(
                    product:
                      T.nilable(
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::OrHash
                      )
                  ).void
                end
                attr_writer :product

                sig do
                  params(
                    is_product_page: T::Boolean,
                    product:
                      T.nilable(
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::OrHash
                      )
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Whether the page is a product detail page.
                  is_product_page:,
                  # The extracted product, or null when the page is not a product detail page.
                  product:
                )
                end

                sig do
                  override.returns(
                    {
                      is_product_page: T::Boolean,
                      product:
                        T.nilable(
                          ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product
                        )
                    }
                  )
                end
                def to_hash
                end

                class Product < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Stock or ordering availability.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    )
                  end
                  attr_accessor :availability

                  # Brand or vendor.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :brand

                  # Product category.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :category

                  # ISO 4217 currency code.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :currency

                  # Product description.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :description

                  # Product dimensions as shown on the page.
                  sig { returns(T::Array[String]) }
                  attr_accessor :dimensions

                  # Key features and specifications.
                  sig { returns(T::Array[String]) }
                  attr_accessor :features

                  # Product image URLs, main image first.
                  sig { returns(T::Array[String]) }
                  attr_accessor :images

                  # Main product image URL.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :image_url

                  # Product name.
                  sig { returns(String) }
                  attr_accessor :name

                  # Current price.
                  sig { returns(T.nilable(Float)) }
                  attr_accessor :price

                  # List price before any discount.
                  sig { returns(T.nilable(Float)) }
                  attr_accessor :regular_price

                  # Product identifier such as a SKU or model number.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :sku

                  # Product tags.
                  sig { returns(T::Array[String]) }
                  attr_accessor :tags

                  # Intended audience.
                  sig { returns(T::Array[String]) }
                  attr_accessor :target_audience

                  # Product variations, such as different colors or sizes, with their attributes and
                  # images. Empty if none are found. May not include every variation offered by the
                  # store.
                  sig do
                    returns(
                      T::Array[
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant
                      ]
                    )
                  end
                  attr_accessor :variants

                  # The extracted product, or null when the page is not a product detail page.
                  sig do
                    params(
                      availability:
                        T.nilable(
                          ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::OrSymbol
                        ),
                      brand: T.nilable(String),
                      category: T.nilable(String),
                      currency: T.nilable(String),
                      description: T.nilable(String),
                      dimensions: T::Array[String],
                      features: T::Array[String],
                      images: T::Array[String],
                      image_url: T.nilable(String),
                      name: String,
                      price: T.nilable(Float),
                      regular_price: T.nilable(Float),
                      sku: T.nilable(String),
                      tags: T::Array[String],
                      target_audience: T::Array[String],
                      variants:
                        T::Array[
                          ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant::OrHash
                        ]
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Stock or ordering availability.
                    availability:,
                    # Brand or vendor.
                    brand:,
                    # Product category.
                    category:,
                    # ISO 4217 currency code.
                    currency:,
                    # Product description.
                    description:,
                    # Product dimensions as shown on the page.
                    dimensions:,
                    # Key features and specifications.
                    features:,
                    # Product image URLs, main image first.
                    images:,
                    # Main product image URL.
                    image_url:,
                    # Product name.
                    name:,
                    # Current price.
                    price:,
                    # List price before any discount.
                    regular_price:,
                    # Product identifier such as a SKU or model number.
                    sku:,
                    # Product tags.
                    tags:,
                    # Intended audience.
                    target_audience:,
                    # Product variations, such as different colors or sizes, with their attributes and
                    # images. Empty if none are found. May not include every variation offered by the
                    # store.
                    variants:
                  )
                  end

                  sig do
                    override.returns(
                      {
                        availability:
                          T.nilable(
                            ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::TaggedSymbol
                          ),
                        brand: T.nilable(String),
                        category: T.nilable(String),
                        currency: T.nilable(String),
                        description: T.nilable(String),
                        dimensions: T::Array[String],
                        features: T::Array[String],
                        images: T::Array[String],
                        image_url: T.nilable(String),
                        name: String,
                        price: T.nilable(Float),
                        regular_price: T.nilable(Float),
                        sku: T.nilable(String),
                        tags: T::Array[String],
                        target_audience: T::Array[String],
                        variants:
                          T::Array[
                            ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant
                          ]
                      }
                    )
                  end
                  def to_hash
                  end

                  # Stock or ordering availability.
                  module Availability
                    extend ContextDev::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    IN_STOCK =
                      T.let(
                        :in_stock,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    OUT_OF_STOCK =
                      T.let(
                        :out_of_stock,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    LIMITED_AVAILABILITY =
                      T.let(
                        :limited_availability,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    PREORDER =
                      T.let(
                        :preorder,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    BACKORDER =
                      T.let(
                        :backorder,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    MADE_TO_ORDER =
                      T.let(
                        :made_to_order,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    DISCONTINUED =
                      T.let(
                        :discontinued,
                        ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Availability::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end

                  class Variant < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Product::Data::Product::Variant,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Explicit variant attributes such as color, size, material, pattern and
                    # properties declared by page.
                    sig { returns(T::Hash[Symbol, String]) }
                    attr_accessor :attributes

                    # Original source image URLs explicitly attached to this variant.
                    sig { returns(T::Array[String]) }
                    attr_accessor :images

                    sig { returns(T.nilable(String)) }
                    attr_accessor :sku

                    # Variant or offer URL when provided by the source. May be shared by variants.
                    sig { returns(T.nilable(String)) }
                    attr_accessor :url

                    sig do
                      params(
                        attributes: T::Hash[Symbol, String],
                        images: T::Array[String],
                        sku: T.nilable(String),
                        url: T.nilable(String)
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Explicit variant attributes such as color, size, material, pattern and
                      # properties declared by page.
                      attributes:,
                      # Original source image URLs explicitly attached to this variant.
                      images:,
                      sku:,
                      # Variant or offer URL when provided by the source. May be shared by variants.
                      url:
                    )
                    end

                    sig do
                      override.returns(
                        {
                          attributes: T::Hash[Symbol, String],
                          images: T::Array[String],
                          sku: T.nilable(String),
                          url: T.nilable(String)
                        }
                      )
                    end
                    def to_hash
                    end
                  end
                end
              end
            end

            class Profile < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Profile,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Save this ID after creating a profile, then reuse it as
              # sharedParams.profile.profileId with type "existing".
              sig { returns(String) }
              attr_accessor :id

              # Authenticated browser profile used for this scrape, or null when no profile was
              # requested. New and existing profile requests both return the profile ID.
              sig { params(id: String).returns(T.attached_class) }
              def self.new(
                # Save this ID after creating a profile, then reuse it as
                # sharedParams.profile.profileId with type "existing".
                id:
              )
              end

              sig { override.returns({ id: String }) }
              def to_hash
              end
            end

            class Screenshot < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::Screenshot,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Screenshot as a base64 image data URL.
              sig do
                params(
                  data: T.nilable(String),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(String),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end
            end

            # True when at least one requested output succeeds but the response has failed or
            # incomplete outputs. Absent when all requested outputs fail.
            module IsPartial
              extend ContextDev::Internal::Type::Enum

              TaggedBoolean =
                T.type_alias do
                  T.all(
                    T::Boolean,
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial
                  )
                end
              OrBoolean = T.type_alias { T::Boolean }

              TRUE =
                T.let(
                  true,
                  ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial::TaggedBoolean
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::IsPartial::TaggedBoolean
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
                    ContextDev::Models::BatchGetResultsResponse::Data::Ok::Result::KeyMetadata,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Credits charged for this request.
              sig { returns(Integer) }
              attr_accessor :credits_consumed

              # Credits remaining for your organization.
              sig { returns(Integer) }
              attr_accessor :credits_remaining

              # Credits this request used and your remaining balance.
              sig do
                params(
                  credits_consumed: Integer,
                  credits_remaining: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # Credits charged for this request.
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

        class Error < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::BatchGetResultsResponse::Data::Error,
                ContextDev::Internal::AnyHash
              )
            end

          # Why the page failed.
          sig { returns(String) }
          attr_accessor :error_code

          # Human-readable failure detail.
          sig { returns(String) }
          attr_accessor :message

          # The page could not be scraped.
          sig { returns(Symbol) }
          attr_accessor :status

          # URL as submitted, or as discovered by the crawl.
          sig { returns(String) }
          attr_accessor :url

          # Credits charged for this page, including OCR. Cached outputs use the same
          # pricing as POST /web/scrape.
          sig { returns(T.nilable(Integer)) }
          attr_reader :credits_used

          sig { params(credits_used: Integer).void }
          attr_writer :credits_used

          # Your `itemId` from submission.
          sig { returns(T.nilable(String)) }
          attr_reader :item_id

          sig { params(item_id: String).void }
          attr_writer :item_id

          # Caller-supplied metadata echoed from submission.
          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :meta

          sig { params(meta: T::Hash[Symbol, T.anything]).void }
          attr_writer :meta

          # PDF pages recovered by OCR. Omitted when OCR did not run.
          sig { returns(T.nilable(Integer)) }
          attr_reader :ocr_pages

          sig { params(ocr_pages: Integer).void }
          attr_writer :ocr_pages

          # Per-format failures when scraping returned a structured response. Omitted for
          # errors that prevent scraping.
          sig do
            returns(
              T.nilable(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result
              )
            )
          end
          attr_reader :result

          sig do
            params(
              result:
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::OrHash
            ).void
          end
          attr_writer :result

          # A page the batch could not fetch.
          sig do
            params(
              error_code: String,
              message: String,
              url: String,
              credits_used: Integer,
              item_id: String,
              meta: T::Hash[Symbol, T.anything],
              ocr_pages: Integer,
              result:
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::OrHash,
              status: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Why the page failed.
            error_code:,
            # Human-readable failure detail.
            message:,
            # URL as submitted, or as discovered by the crawl.
            url:,
            # Credits charged for this page, including OCR. Cached outputs use the same
            # pricing as POST /web/scrape.
            credits_used: nil,
            # Your `itemId` from submission.
            item_id: nil,
            # Caller-supplied metadata echoed from submission.
            meta: nil,
            # PDF pages recovered by OCR. Omitted when OCR did not run.
            ocr_pages: nil,
            # Per-format failures when scraping returned a structured response. Omitted for
            # errors that prevent scraping.
            result: nil,
            # The page could not be scraped.
            status: :error
          )
          end

          sig do
            override.returns(
              {
                error_code: String,
                message: String,
                status: Symbol,
                url: String,
                credits_used: Integer,
                item_id: String,
                meta: T::Hash[Symbol, T.anything],
                ocr_pages: Integer,
                result:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result
              }
            )
          end
          def to_hash
          end

          class Result < ContextDev::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result,
                  ContextDev::Internal::AnyHash
                )
              end

            # The original HTTP response body, unchanged by waits, actions, and filters.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes
              )
            end
            attr_reader :bytes

            sig do
              params(
                bytes:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::OrHash
              ).void
            end
            attr_writer :bytes

            # Whether this response came from cache.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata
              )
            end
            attr_reader :cache_metadata

            sig do
              params(
                cache_metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::OrHash
              ).void
            end
            attr_writer :cache_metadata

            # Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
            # omitted text.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Highlights
              )
            end
            attr_reader :highlights

            sig do
              params(
                highlights:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Highlights::OrHash
              ).void
            end
            attr_writer :highlights

            # Rendered HTML after content filters.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML
              )
            end
            attr_reader :html

            sig do
              params(
                html:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML::OrHash
              ).void
            end
            attr_writer :html

            # Images after content filters. `[]` when none are found.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images
              )
            end
            attr_reader :images

            sig do
              params(
                images:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::OrHash
              ).void
            end
            attr_writer :images

            # Object matching `jsonParams.schema`.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json
              )
            end
            attr_reader :json

            sig do
              params(
                json:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::OrHash
              ).void
            end
            attr_writer :json

            # Markdown after content filters.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown
              )
            end
            attr_reader :markdown

            sig do
              params(
                markdown:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown::OrHash
              ).void
            end
            attr_writer :markdown

            # Page metadata. Fields are omitted when not found.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata
              )
            end
            attr_reader :metadata

            sig do
              params(
                metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::OrHash
              ).void
            end
            attr_writer :metadata

            # Custom rules return fields after content filters; unmatched fields are null ([]
            # for lists). The google-maps parser returns business records in data.results,
            # google-maps-reviews returns data.reviews, and the google-play parser returns one
            # app record as data, google-play-reviews returns data.reviews, app-store and
            # app-store-reviews do the same for the App Store, g2-reviews returns data.reviews
            # for a G2 product, instagram-profile and instagram-post return one record as
            # data, instagram-feed returns data.posts, tiktok-profile and tiktok-video return
            # one record as data, tiktok-feed returns data.videos, tiktok-comments returns
            # data.comments, tiktok-followers, tiktok-following, and tiktok-user-search return
            # data.users, yelp-search returns up to 20 ranked organic businesses in
            # data.businesses, plus total and pagination, from a Yelp search URL; emails,
            # phone-numbers, and links return data.emails, data.phone_numbers, and data.links
            # from the rendered page; the store, Maps, G2, Instagram, and TikTok parsers read
            # their data directly, independently of DOM filters and other outputs.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed
              )
            end
            attr_reader :parsed

            sig do
              params(
                parsed:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::OrHash
              ).void
            end
            attr_writer :parsed

            # Product details found on the page.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product
              )
            end
            attr_reader :product

            sig do
              params(
                product:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::OrHash
              ).void
            end
            attr_writer :product

            # Authenticated browser profile used for this scrape, or null when no profile was
            # requested. New and existing profile requests both return the profile ID.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile
                )
              )
            end
            attr_reader :profile

            sig do
              params(
                profile:
                  T.nilable(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile::OrHash
                  )
              ).void
            end
            attr_writer :profile

            # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
            # support.
            sig { returns(String) }
            attr_accessor :request_id

            # Screenshot as a base64 image data URL.
            sig do
              returns(
                ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Screenshot
              )
            end
            attr_reader :screenshot

            sig do
              params(
                screenshot:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Screenshot::OrHash
              ).void
            end
            attr_writer :screenshot

            # Final URL after redirects and browser actions.
            sig { returns(String) }
            attr_accessor :url

            # True when at least one requested output succeeds but the response has failed or
            # incomplete outputs. Absent when all requested outputs fail.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial::TaggedBoolean
                )
              )
            end
            attr_reader :is_partial

            sig do
              params(
                is_partial:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial::OrBoolean
              ).void
            end
            attr_writer :is_partial

            # Credits this request used and your remaining balance.
            sig do
              returns(
                T.nilable(
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::KeyMetadata
                )
              )
            end
            attr_reader :key_metadata

            sig do
              params(
                key_metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::KeyMetadata::OrHash
              ).void
            end
            attr_writer :key_metadata

            # Per-format failures when scraping returned a structured response. Omitted for
            # errors that prevent scraping.
            sig do
              params(
                bytes:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::OrHash,
                cache_metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::OrHash,
                highlights:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Highlights::OrHash,
                html:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML::OrHash,
                images:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::OrHash,
                json:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::OrHash,
                markdown:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown::OrHash,
                metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::OrHash,
                parsed:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::OrHash,
                product:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::OrHash,
                profile:
                  T.nilable(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile::OrHash
                  ),
                request_id: String,
                screenshot:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Screenshot::OrHash,
                url: String,
                is_partial:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial::OrBoolean,
                key_metadata:
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::KeyMetadata::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # The original HTTP response body, unchanged by waits, actions, and filters.
              bytes:,
              # Whether this response came from cache.
              cache_metadata:,
              # Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
              # omitted text.
              highlights:,
              # Rendered HTML after content filters.
              html:,
              # Images after content filters. `[]` when none are found.
              images:,
              # Object matching `jsonParams.schema`.
              json:,
              # Markdown after content filters.
              markdown:,
              # Page metadata. Fields are omitted when not found.
              metadata:,
              # Custom rules return fields after content filters; unmatched fields are null ([]
              # for lists). The google-maps parser returns business records in data.results,
              # google-maps-reviews returns data.reviews, and the google-play parser returns one
              # app record as data, google-play-reviews returns data.reviews, app-store and
              # app-store-reviews do the same for the App Store, g2-reviews returns data.reviews
              # for a G2 product, instagram-profile and instagram-post return one record as
              # data, instagram-feed returns data.posts, tiktok-profile and tiktok-video return
              # one record as data, tiktok-feed returns data.videos, tiktok-comments returns
              # data.comments, tiktok-followers, tiktok-following, and tiktok-user-search return
              # data.users, yelp-search returns up to 20 ranked organic businesses in
              # data.businesses, plus total and pagination, from a Yelp search URL; emails,
              # phone-numbers, and links return data.emails, data.phone_numbers, and data.links
              # from the rendered page; the store, Maps, G2, Instagram, and TikTok parsers read
              # their data directly, independently of DOM filters and other outputs.
              parsed:,
              # Product details found on the page.
              product:,
              # Authenticated browser profile used for this scrape, or null when no profile was
              # requested. New and existing profile requests both return the profile ID.
              profile:,
              # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
              # support.
              request_id:,
              # Screenshot as a base64 image data URL.
              screenshot:,
              # Final URL after redirects and browser actions.
              url:,
              # True when at least one requested output succeeds but the response has failed or
              # incomplete outputs. Absent when all requested outputs fail.
              is_partial: nil,
              # Credits this request used and your remaining balance.
              key_metadata: nil
            )
            end

            sig do
              override.returns(
                {
                  bytes:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes,
                  cache_metadata:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata,
                  highlights:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Highlights,
                  html:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML,
                  images:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images,
                  json:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json,
                  markdown:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown,
                  metadata:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata,
                  parsed:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed,
                  product:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product,
                  profile:
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile
                    ),
                  request_id: String,
                  screenshot:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Screenshot,
                  url: String,
                  is_partial:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial::TaggedBoolean,
                  key_metadata:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::KeyMetadata
                }
              )
            end
            def to_hash
            end

            class Bytes < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::Data
                  )
                )
              end
              attr_reader :data

              sig do
                params(
                  data:
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::Data::OrHash
                    )
                ).void
              end
              attr_writer :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # The original HTTP response body, unchanged by waits, actions, and filters.
              sig do
                params(
                  data:
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::Data::OrHash
                    ),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data:
                      T.nilable(
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::Data
                      ),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end

              class Data < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Bytes::Data,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Body as base64, after HTTP decompression. Up to 50 MiB decoded.
                sig { returns(String) }
                attr_accessor :base64

                sig { returns(String) }
                attr_accessor :content_type

                sig do
                  params(base64: String, content_type: String).returns(
                    T.attached_class
                  )
                end
                def self.new(
                  # Body as base64, after HTTP decompression. Up to 50 MiB decoded.
                  base64:,
                  content_type:
                )
                end

                sig do
                  override.returns({ base64: String, content_type: String })
                end
                def to_hash
                end
              end
            end

            class CacheMetadata < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata,
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
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status::TaggedSymbol
                )
              end
              attr_accessor :status

              # Whether this response came from cache.
              sig do
                params(
                  age_ms: Integer,
                  status:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status::OrSymbol
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
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status::TaggedSymbol
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
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                HIT =
                  T.let(
                    :hit,
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status::TaggedSymbol
                  )
                MISS =
                  T.let(
                    :miss,
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status::TaggedSymbol
                  )
                ZDR =
                  T.let(
                    :zdr,
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::CacheMetadata::Status::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Highlights < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Highlights,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(T::Array[String])) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Relevant Markdown excerpts in page order. `[Heading]` adds context; `…` marks
              # omitted text.
              sig do
                params(
                  data: T.nilable(T::Array[String]),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(T::Array[String]),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end
            end

            class HTML < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::HTML,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Rendered HTML after content filters.
              sig do
                params(
                  data: T.nilable(String),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(String),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end
            end

            class Images < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data
                    ]
                  )
                )
              end
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Images after content filters. `[]` when none are found.
              sig do
                params(
                  data:
                    T.nilable(
                      T::Array[
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::OrHash
                      ]
                    ),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data:
                      T.nilable(
                        T::Array[
                          ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data
                        ]
                      ),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end

              class Data < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Alt text, if present.
                sig { returns(T.nilable(String)) }
                attr_accessor :alt

                # Image URL, or a data URI for inline images.
                sig { returns(String) }
                attr_accessor :url

                sig do
                  returns(
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol
                    )
                  )
                end
                attr_reader :classification

                sig do
                  params(
                    classification:
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::OrSymbol
                  ).void
                end
                attr_writer :classification

                # Hosted image URL, valid for 24 hours after capture. Requires `file` enrichment
                # and ZDR disabled.
                sig { returns(T.nilable(String)) }
                attr_reader :file_url

                sig { params(file_url: String).void }
                attr_writer :file_url

                sig { returns(T.nilable(Integer)) }
                attr_reader :height

                sig { params(height: Integer).void }
                attr_writer :height

                sig { returns(T.nilable(Integer)) }
                attr_reader :width

                sig { params(width: Integer).void }
                attr_writer :width

                sig do
                  params(
                    alt: T.nilable(String),
                    url: String,
                    classification:
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::OrSymbol,
                    file_url: String,
                    height: Integer,
                    width: Integer
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Alt text, if present.
                  alt:,
                  # Image URL, or a data URI for inline images.
                  url:,
                  classification: nil,
                  # Hosted image URL, valid for 24 hours after capture. Requires `file` enrichment
                  # and ZDR disabled.
                  file_url: nil,
                  height: nil,
                  width: nil
                )
                end

                sig do
                  override.returns(
                    {
                      alt: T.nilable(String),
                      url: String,
                      classification:
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol,
                      file_url: String,
                      height: Integer,
                      width: Integer
                    }
                  )
                end
                def to_hash
                end

                module Classification
                  extend ContextDev::Internal::Type::Enum

                  TaggedSymbol =
                    T.type_alias do
                      T.all(
                        Symbol,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification
                      )
                    end
                  OrSymbol = T.type_alias { T.any(Symbol, String) }

                  PHOTOGRAPHY =
                    T.let(
                      :photography,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol
                    )
                  ILLUSTRATION =
                    T.let(
                      :illustration,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol
                    )
                  LOGO =
                    T.let(
                      :logo,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol
                    )
                  WORDMARK =
                    T.let(
                      :wordmark,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol
                    )
                  ICON =
                    T.let(
                      :icon,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol
                    )
                  PATTERN =
                    T.let(
                      :pattern,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol
                    )
                  GRAPHIC =
                    T.let(
                      :graphic,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol
                    )
                  OTHER =
                    T.let(
                      :other,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol
                    )

                  sig do
                    override.returns(
                      T::Array[
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Images::Data::Classification::TaggedSymbol
                      ]
                    )
                  end
                  def self.values
                  end
                end
              end
            end

            class Json < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # True when the page was too long to read in full, so values found only in the
              # unread parts may be missing.
              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated::TaggedBoolean
                  )
                )
              end
              attr_reader :is_truncated

              sig do
                params(
                  is_truncated:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated::OrBoolean
                ).void
              end
              attr_writer :is_truncated

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Object matching `jsonParams.schema`.
              sig do
                params(
                  data: T.nilable(T::Hash[Symbol, T.anything]),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  is_truncated:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated::OrBoolean,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # True when the page was too long to read in full, so values found only in the
                # unread parts may be missing.
                is_truncated: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(T::Hash[Symbol, T.anything]),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    is_truncated:
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated::TaggedBoolean,
                    message: String
                  }
                )
              end
              def to_hash
              end

              # True when the page was too long to read in full, so values found only in the
              # unread parts may be missing.
              module IsTruncated
                extend ContextDev::Internal::Type::Enum

                TaggedBoolean =
                  T.type_alias do
                    T.all(
                      T::Boolean,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated
                    )
                  end
                OrBoolean = T.type_alias { T::Boolean }

                TRUE =
                  T.let(
                    true,
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated::TaggedBoolean
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Json::IsTruncated::TaggedBoolean
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Markdown < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Markdown,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Markdown after content filters.
              sig do
                params(
                  data: T.nilable(String),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(String),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end
            end

            class Metadata < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Additional non-social meta tags not promoted to top-level metadata fields.
              sig do
                returns(
                  T.nilable(
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::AdditionalMeta::Variants
                    ]
                  )
                )
              end
              attr_reader :additional_meta

              sig do
                params(
                  additional_meta:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::AdditionalMeta::Variants
                    ]
                ).void
              end
              attr_writer :additional_meta

              # Resolved alternate links from link rel=alternate tags.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate
                    ]
                  )
                )
              end
              attr_reader :alternates

              sig do
                params(
                  alternates:
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate::OrHash
                    ]
                ).void
              end
              attr_writer :alternates

              # Author metadata, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :author

              sig { params(author: String).void }
              attr_writer :author

              # Resolved canonical URL, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :canonical_url

              sig { params(canonical_url: String).void }
              attr_writer :canonical_url

              # Best description extracted from standard, Open Graph, or Twitter metadata.
              sig { returns(T.nilable(String)) }
              attr_reader :description

              sig { params(description: String).void }
              attr_writer :description

              # Resolved favicon URL, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :favicon

              sig { params(favicon: String).void }
              attr_writer :favicon

              # Up to 500 h1–h6 headings in document order, before content filtering.
              sig do
                returns(
                  T.nilable(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading
                    ]
                  )
                )
              end
              attr_reader :headings

              sig do
                params(
                  headings:
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading::OrHash
                    ]
                ).void
              end
              attr_writer :headings

              # Primary resolved preview image from Open Graph, Twitter, or image metadata.
              sig { returns(T.nilable(String)) }
              attr_reader :image

              sig { params(image: String).void }
              attr_writer :image

              # JSON-LD structured data blocks parsed from the page.
              sig { returns(T.nilable(T::Array[T::Hash[Symbol, T.anything]])) }
              attr_reader :json_ld

              sig do
                params(json_ld: T::Array[T::Hash[Symbol, T.anything]]).void
              end
              attr_writer :json_ld

              # Keywords extracted from the page's keywords meta tag.
              sig { returns(T.nilable(T::Array[String])) }
              attr_reader :keywords

              sig { params(keywords: T::Array[String]).void }
              attr_writer :keywords

              # Language extracted from html lang or language meta tags.
              sig { returns(T.nilable(String)) }
              attr_reader :language

              sig { params(language: String).void }
              attr_writer :language

              # Modified timestamp/date from page metadata, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :modified_time

              sig { params(modified_time: String).void }
              attr_writer :modified_time

              # Open Graph metadata with the og: prefix removed and keys camel-cased.
              sig do
                returns(
                  T.nilable(
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::OpenGraph::Variants
                    ]
                  )
                )
              end
              attr_reader :open_graph

              sig do
                params(
                  open_graph:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::OpenGraph::Variants
                    ]
                ).void
              end
              attr_writer :open_graph

              # Published timestamp/date from page metadata, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :published_time

              sig { params(published_time: String).void }
              attr_writer :published_time

              # Robots meta directive, when present.
              sig { returns(T.nilable(String)) }
              attr_reader :robots

              sig { params(robots: String).void }
              attr_writer :robots

              # Site or application name from page metadata.
              sig { returns(T.nilable(String)) }
              attr_reader :site_name

              sig { params(site_name: String).void }
              attr_writer :site_name

              # Best title extracted from the page.
              sig { returns(T.nilable(String)) }
              attr_reader :title

              sig { params(title: String).void }
              attr_writer :title

              # Twitter card metadata with the twitter: prefix removed and keys camel-cased.
              sig do
                returns(
                  T.nilable(
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Twitter::Variants
                    ]
                  )
                )
              end
              attr_reader :twitter

              sig do
                params(
                  twitter:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Twitter::Variants
                    ]
                ).void
              end
              attr_writer :twitter

              # Page metadata. Fields are omitted when not found.
              sig do
                params(
                  additional_meta:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::AdditionalMeta::Variants
                    ],
                  alternates:
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate::OrHash
                    ],
                  author: String,
                  canonical_url: String,
                  description: String,
                  favicon: String,
                  headings:
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading::OrHash
                    ],
                  image: String,
                  json_ld: T::Array[T::Hash[Symbol, T.anything]],
                  keywords: T::Array[String],
                  language: String,
                  modified_time: String,
                  open_graph:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::OpenGraph::Variants
                    ],
                  published_time: String,
                  robots: String,
                  site_name: String,
                  title: String,
                  twitter:
                    T::Hash[
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Twitter::Variants
                    ]
                ).returns(T.attached_class)
              end
              def self.new(
                # Additional non-social meta tags not promoted to top-level metadata fields.
                additional_meta: nil,
                # Resolved alternate links from link rel=alternate tags.
                alternates: nil,
                # Author metadata, when present.
                author: nil,
                # Resolved canonical URL, when present.
                canonical_url: nil,
                # Best description extracted from standard, Open Graph, or Twitter metadata.
                description: nil,
                # Resolved favicon URL, when present.
                favicon: nil,
                # Up to 500 h1–h6 headings in document order, before content filtering.
                headings: nil,
                # Primary resolved preview image from Open Graph, Twitter, or image metadata.
                image: nil,
                # JSON-LD structured data blocks parsed from the page.
                json_ld: nil,
                # Keywords extracted from the page's keywords meta tag.
                keywords: nil,
                # Language extracted from html lang or language meta tags.
                language: nil,
                # Modified timestamp/date from page metadata, when present.
                modified_time: nil,
                # Open Graph metadata with the og: prefix removed and keys camel-cased.
                open_graph: nil,
                # Published timestamp/date from page metadata, when present.
                published_time: nil,
                # Robots meta directive, when present.
                robots: nil,
                # Site or application name from page metadata.
                site_name: nil,
                # Best title extracted from the page.
                title: nil,
                # Twitter card metadata with the twitter: prefix removed and keys camel-cased.
                twitter: nil
              )
              end

              sig do
                override.returns(
                  {
                    additional_meta:
                      T::Hash[
                        Symbol,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::AdditionalMeta::Variants
                      ],
                    alternates:
                      T::Array[
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate
                      ],
                    author: String,
                    canonical_url: String,
                    description: String,
                    favicon: String,
                    headings:
                      T::Array[
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading
                      ],
                    image: String,
                    json_ld: T::Array[T::Hash[Symbol, T.anything]],
                    keywords: T::Array[String],
                    language: String,
                    modified_time: String,
                    open_graph:
                      T::Hash[
                        Symbol,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::OpenGraph::Variants
                      ],
                    published_time: String,
                    robots: String,
                    site_name: String,
                    title: String,
                    twitter:
                      T::Hash[
                        Symbol,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Twitter::Variants
                      ]
                  }
                )
              end
              def to_hash
              end

              module AdditionalMeta
                extend ContextDev::Internal::Type::Union

                Variants = T.type_alias { T.any(String, T::Array[String]) }

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::AdditionalMeta::Variants
                    ]
                  )
                end
                def self.variants
                end

                StringArray =
                  T.let(
                    ContextDev::Internal::Type::ArrayOf[String],
                    ContextDev::Internal::Type::Converter
                  )
              end

              class Alternate < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Alternate,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Resolved alternate URL.
                sig { returns(String) }
                attr_accessor :href

                # Language or locale for the alternate URL, when present.
                sig { returns(T.nilable(String)) }
                attr_reader :hreflang

                sig { params(hreflang: String).void }
                attr_writer :hreflang

                # Alternate resource title, when present.
                sig { returns(T.nilable(String)) }
                attr_reader :title

                sig { params(title: String).void }
                attr_writer :title

                # Alternate resource MIME type, when present.
                sig { returns(T.nilable(String)) }
                attr_reader :type

                sig { params(type: String).void }
                attr_writer :type

                sig do
                  params(
                    href: String,
                    hreflang: String,
                    title: String,
                    type: String
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Resolved alternate URL.
                  href:,
                  # Language or locale for the alternate URL, when present.
                  hreflang: nil,
                  # Alternate resource title, when present.
                  title: nil,
                  # Alternate resource MIME type, when present.
                  type: nil
                )
                end

                sig do
                  override.returns(
                    {
                      href: String,
                      hreflang: String,
                      title: String,
                      type: String
                    }
                  )
                end
                def to_hash
                end
              end

              class Heading < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Heading,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Heading level, 1–6 (from h1–h6).
                sig { returns(Integer) }
                attr_accessor :level

                # Heading text with whitespace collapsed, truncated to 1000 characters.
                sig { returns(String) }
                attr_accessor :text

                sig do
                  params(level: Integer, text: String).returns(T.attached_class)
                end
                def self.new(
                  # Heading level, 1–6 (from h1–h6).
                  level:,
                  # Heading text with whitespace collapsed, truncated to 1000 characters.
                  text:
                )
                end

                sig { override.returns({ level: Integer, text: String }) }
                def to_hash
                end
              end

              module OpenGraph
                extend ContextDev::Internal::Type::Union

                Variants = T.type_alias { T.any(String, T::Array[String]) }

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::OpenGraph::Variants
                    ]
                  )
                end
                def self.variants
                end

                StringArray =
                  T.let(
                    ContextDev::Internal::Type::ArrayOf[String],
                    ContextDev::Internal::Type::Converter
                  )
              end

              module Twitter
                extend ContextDev::Internal::Type::Union

                Variants = T.type_alias { T.any(String, T::Array[String]) }

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Metadata::Twitter::Variants
                    ]
                  )
                end
                def self.variants
                end

                StringArray =
                  T.let(
                    ContextDev::Internal::Type::ArrayOf[String],
                    ContextDev::Internal::Type::Converter
                  )
              end
            end

            class Parsed < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # The selected prebuilt parser name, or custom when type is omitted, custom rules
              # are used, or parsing is not requested.
              sig do
                returns(
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                )
              end
              attr_accessor :type

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Custom rules return fields after content filters; unmatched fields are null ([]
              # for lists). The google-maps parser returns business records in data.results,
              # google-maps-reviews returns data.reviews, and the google-play parser returns one
              # app record as data, google-play-reviews returns data.reviews, app-store and
              # app-store-reviews do the same for the App Store, g2-reviews returns data.reviews
              # for a G2 product, instagram-profile and instagram-post return one record as
              # data, instagram-feed returns data.posts, tiktok-profile and tiktok-video return
              # one record as data, tiktok-feed returns data.videos, tiktok-comments returns
              # data.comments, tiktok-followers, tiktok-following, and tiktok-user-search return
              # data.users, yelp-search returns up to 20 ranked organic businesses in
              # data.businesses, plus total and pagination, from a Yelp search URL; emails,
              # phone-numbers, and links return data.emails, data.phone_numbers, and data.links
              # from the rendered page; the store, Maps, G2, Instagram, and TikTok parsers read
              # their data directly, independently of DOM filters and other outputs.
              sig do
                params(
                  data: T.nilable(T::Hash[Symbol, T.anything]),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  type:
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::OrSymbol,
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # The selected prebuilt parser name, or custom when type is omitted, custom rules
                # are used, or parsing is not requested.
                type:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(T::Hash[Symbol, T.anything]),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    type:
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol,
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end

              # The selected prebuilt parser name, or custom when type is omitted, custom rules
              # are used, or parsing is not requested.
              module Type
                extend ContextDev::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                CUSTOM =
                  T.let(
                    :custom,
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                GOOGLE_MAPS =
                  T.let(
                    :"google-maps",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                GOOGLE_MAPS_REVIEWS =
                  T.let(
                    :"google-maps-reviews",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                GOOGLE_PLAY =
                  T.let(
                    :"google-play",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                GOOGLE_PLAY_REVIEWS =
                  T.let(
                    :"google-play-reviews",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                APP_STORE =
                  T.let(
                    :"app-store",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                APP_STORE_REVIEWS =
                  T.let(
                    :"app-store-reviews",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                G2_REVIEWS =
                  T.let(
                    :"g2-reviews",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                INSTAGRAM_PROFILE =
                  T.let(
                    :"instagram-profile",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                INSTAGRAM_POST =
                  T.let(
                    :"instagram-post",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                INSTAGRAM_FEED =
                  T.let(
                    :"instagram-feed",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_PROFILE =
                  T.let(
                    :"tiktok-profile",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_VIDEO =
                  T.let(
                    :"tiktok-video",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_FEED =
                  T.let(
                    :"tiktok-feed",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_COMMENTS =
                  T.let(
                    :"tiktok-comments",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_FOLLOWERS =
                  T.let(
                    :"tiktok-followers",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_FOLLOWING =
                  T.let(
                    :"tiktok-following",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                TIKTOK_USER_SEARCH =
                  T.let(
                    :"tiktok-user-search",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                YELP_SEARCH =
                  T.let(
                    :"yelp-search",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                EMAILS =
                  T.let(
                    :emails,
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                PHONE_NUMBERS =
                  T.let(
                    :"phone-numbers",
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )
                LINKS =
                  T.let(
                    :links,
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Parsed::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end

            class Product < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig do
                returns(
                  T.nilable(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data
                  )
                )
              end
              attr_reader :data

              sig do
                params(
                  data:
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::OrHash
                    )
                ).void
              end
              attr_writer :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Product details found on the page.
              sig do
                params(
                  data:
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::OrHash
                    ),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data:
                      T.nilable(
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data
                      ),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end

              class Data < ContextDev::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data,
                      ContextDev::Internal::AnyHash
                    )
                  end

                # Whether the page is a product detail page.
                sig { returns(T::Boolean) }
                attr_accessor :is_product_page

                # The extracted product, or null when the page is not a product detail page.
                sig do
                  returns(
                    T.nilable(
                      ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product
                    )
                  )
                end
                attr_reader :product

                sig do
                  params(
                    product:
                      T.nilable(
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::OrHash
                      )
                  ).void
                end
                attr_writer :product

                sig do
                  params(
                    is_product_page: T::Boolean,
                    product:
                      T.nilable(
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::OrHash
                      )
                  ).returns(T.attached_class)
                end
                def self.new(
                  # Whether the page is a product detail page.
                  is_product_page:,
                  # The extracted product, or null when the page is not a product detail page.
                  product:
                )
                end

                sig do
                  override.returns(
                    {
                      is_product_page: T::Boolean,
                      product:
                        T.nilable(
                          ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product
                        )
                    }
                  )
                end
                def to_hash
                end

                class Product < ContextDev::Internal::Type::BaseModel
                  OrHash =
                    T.type_alias do
                      T.any(
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product,
                        ContextDev::Internal::AnyHash
                      )
                    end

                  # Stock or ordering availability.
                  sig do
                    returns(
                      T.nilable(
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    )
                  end
                  attr_accessor :availability

                  # Brand or vendor.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :brand

                  # Product category.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :category

                  # ISO 4217 currency code.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :currency

                  # Product description.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :description

                  # Product dimensions as shown on the page.
                  sig { returns(T::Array[String]) }
                  attr_accessor :dimensions

                  # Key features and specifications.
                  sig { returns(T::Array[String]) }
                  attr_accessor :features

                  # Product image URLs, main image first.
                  sig { returns(T::Array[String]) }
                  attr_accessor :images

                  # Main product image URL.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :image_url

                  # Product name.
                  sig { returns(String) }
                  attr_accessor :name

                  # Current price.
                  sig { returns(T.nilable(Float)) }
                  attr_accessor :price

                  # List price before any discount.
                  sig { returns(T.nilable(Float)) }
                  attr_accessor :regular_price

                  # Product identifier such as a SKU or model number.
                  sig { returns(T.nilable(String)) }
                  attr_accessor :sku

                  # Product tags.
                  sig { returns(T::Array[String]) }
                  attr_accessor :tags

                  # Intended audience.
                  sig { returns(T::Array[String]) }
                  attr_accessor :target_audience

                  # Product variations, such as different colors or sizes, with their attributes and
                  # images. Empty if none are found. May not include every variation offered by the
                  # store.
                  sig do
                    returns(
                      T::Array[
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant
                      ]
                    )
                  end
                  attr_accessor :variants

                  # The extracted product, or null when the page is not a product detail page.
                  sig do
                    params(
                      availability:
                        T.nilable(
                          ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::OrSymbol
                        ),
                      brand: T.nilable(String),
                      category: T.nilable(String),
                      currency: T.nilable(String),
                      description: T.nilable(String),
                      dimensions: T::Array[String],
                      features: T::Array[String],
                      images: T::Array[String],
                      image_url: T.nilable(String),
                      name: String,
                      price: T.nilable(Float),
                      regular_price: T.nilable(Float),
                      sku: T.nilable(String),
                      tags: T::Array[String],
                      target_audience: T::Array[String],
                      variants:
                        T::Array[
                          ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant::OrHash
                        ]
                    ).returns(T.attached_class)
                  end
                  def self.new(
                    # Stock or ordering availability.
                    availability:,
                    # Brand or vendor.
                    brand:,
                    # Product category.
                    category:,
                    # ISO 4217 currency code.
                    currency:,
                    # Product description.
                    description:,
                    # Product dimensions as shown on the page.
                    dimensions:,
                    # Key features and specifications.
                    features:,
                    # Product image URLs, main image first.
                    images:,
                    # Main product image URL.
                    image_url:,
                    # Product name.
                    name:,
                    # Current price.
                    price:,
                    # List price before any discount.
                    regular_price:,
                    # Product identifier such as a SKU or model number.
                    sku:,
                    # Product tags.
                    tags:,
                    # Intended audience.
                    target_audience:,
                    # Product variations, such as different colors or sizes, with their attributes and
                    # images. Empty if none are found. May not include every variation offered by the
                    # store.
                    variants:
                  )
                  end

                  sig do
                    override.returns(
                      {
                        availability:
                          T.nilable(
                            ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::TaggedSymbol
                          ),
                        brand: T.nilable(String),
                        category: T.nilable(String),
                        currency: T.nilable(String),
                        description: T.nilable(String),
                        dimensions: T::Array[String],
                        features: T::Array[String],
                        images: T::Array[String],
                        image_url: T.nilable(String),
                        name: String,
                        price: T.nilable(Float),
                        regular_price: T.nilable(Float),
                        sku: T.nilable(String),
                        tags: T::Array[String],
                        target_audience: T::Array[String],
                        variants:
                          T::Array[
                            ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant
                          ]
                      }
                    )
                  end
                  def to_hash
                  end

                  # Stock or ordering availability.
                  module Availability
                    extend ContextDev::Internal::Type::Enum

                    TaggedSymbol =
                      T.type_alias do
                        T.all(
                          Symbol,
                          ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability
                        )
                      end
                    OrSymbol = T.type_alias { T.any(Symbol, String) }

                    IN_STOCK =
                      T.let(
                        :in_stock,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    OUT_OF_STOCK =
                      T.let(
                        :out_of_stock,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    LIMITED_AVAILABILITY =
                      T.let(
                        :limited_availability,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    PREORDER =
                      T.let(
                        :preorder,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    BACKORDER =
                      T.let(
                        :backorder,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    MADE_TO_ORDER =
                      T.let(
                        :made_to_order,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::TaggedSymbol
                      )
                    DISCONTINUED =
                      T.let(
                        :discontinued,
                        ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::TaggedSymbol
                      )

                    sig do
                      override.returns(
                        T::Array[
                          ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Availability::TaggedSymbol
                        ]
                      )
                    end
                    def self.values
                    end
                  end

                  class Variant < ContextDev::Internal::Type::BaseModel
                    OrHash =
                      T.type_alias do
                        T.any(
                          ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Product::Data::Product::Variant,
                          ContextDev::Internal::AnyHash
                        )
                      end

                    # Explicit variant attributes such as color, size, material, pattern and
                    # properties declared by page.
                    sig { returns(T::Hash[Symbol, String]) }
                    attr_accessor :attributes

                    # Original source image URLs explicitly attached to this variant.
                    sig { returns(T::Array[String]) }
                    attr_accessor :images

                    sig { returns(T.nilable(String)) }
                    attr_accessor :sku

                    # Variant or offer URL when provided by the source. May be shared by variants.
                    sig { returns(T.nilable(String)) }
                    attr_accessor :url

                    sig do
                      params(
                        attributes: T::Hash[Symbol, String],
                        images: T::Array[String],
                        sku: T.nilable(String),
                        url: T.nilable(String)
                      ).returns(T.attached_class)
                    end
                    def self.new(
                      # Explicit variant attributes such as color, size, material, pattern and
                      # properties declared by page.
                      attributes:,
                      # Original source image URLs explicitly attached to this variant.
                      images:,
                      sku:,
                      # Variant or offer URL when provided by the source. May be shared by variants.
                      url:
                    )
                    end

                    sig do
                      override.returns(
                        {
                          attributes: T::Hash[Symbol, String],
                          images: T::Array[String],
                          sku: T.nilable(String),
                          url: T.nilable(String)
                        }
                      )
                    end
                    def to_hash
                    end
                  end
                end
              end
            end

            class Profile < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Profile,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Save this ID after creating a profile, then reuse it as
              # sharedParams.profile.profileId with type "existing".
              sig { returns(String) }
              attr_accessor :id

              # Authenticated browser profile used for this scrape, or null when no profile was
              # requested. New and existing profile requests both return the profile ID.
              sig { params(id: String).returns(T.attached_class) }
              def self.new(
                # Save this ID after creating a profile, then reuse it as
                # sharedParams.profile.profileId with type "existing".
                id:
              )
              end

              sig { override.returns({ id: String }) }
              def to_hash
              end
            end

            class Screenshot < ContextDev::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::Screenshot,
                    ContextDev::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(String)) }
              attr_accessor :data

              sig { returns(T::Boolean) }
              attr_accessor :requested

              # `true` if returned, `false` if it failed, `null` if not requested.
              sig { returns(T.nilable(T::Boolean)) }
              attr_accessor :success

              # Why the output failed. Present only when `success` is `false`.
              sig { returns(T.nilable(String)) }
              attr_reader :error_code

              sig { params(error_code: String).void }
              attr_writer :error_code

              # Explanation of the failure and possible next steps.
              sig { returns(T.nilable(String)) }
              attr_reader :message

              sig { params(message: String).void }
              attr_writer :message

              # Screenshot as a base64 image data URL.
              sig do
                params(
                  data: T.nilable(String),
                  requested: T::Boolean,
                  success: T.nilable(T::Boolean),
                  error_code: String,
                  message: String
                ).returns(T.attached_class)
              end
              def self.new(
                data:,
                requested:,
                # `true` if returned, `false` if it failed, `null` if not requested.
                success:,
                # Why the output failed. Present only when `success` is `false`.
                error_code: nil,
                # Explanation of the failure and possible next steps.
                message: nil
              )
              end

              sig do
                override.returns(
                  {
                    data: T.nilable(String),
                    requested: T::Boolean,
                    success: T.nilable(T::Boolean),
                    error_code: String,
                    message: String
                  }
                )
              end
              def to_hash
              end
            end

            # True when at least one requested output succeeds but the response has failed or
            # incomplete outputs. Absent when all requested outputs fail.
            module IsPartial
              extend ContextDev::Internal::Type::Enum

              TaggedBoolean =
                T.type_alias do
                  T.all(
                    T::Boolean,
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial
                  )
                end
              OrBoolean = T.type_alias { T::Boolean }

              TRUE =
                T.let(
                  true,
                  ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial::TaggedBoolean
                )

              sig do
                override.returns(
                  T::Array[
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::IsPartial::TaggedBoolean
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
                    ContextDev::Models::BatchGetResultsResponse::Data::Error::Result::KeyMetadata,
                    ContextDev::Internal::AnyHash
                  )
                end

              # Credits charged for this request.
              sig { returns(Integer) }
              attr_accessor :credits_consumed

              # Credits remaining for your organization.
              sig { returns(Integer) }
              attr_accessor :credits_remaining

              # Credits this request used and your remaining balance.
              sig do
                params(
                  credits_consumed: Integer,
                  credits_remaining: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                # Credits charged for this request.
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

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::BatchGetResultsResponse::Data::Variants
            ]
          )
        end
        def self.variants
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::BatchGetResultsResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
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
