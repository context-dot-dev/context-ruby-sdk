# typed: strong

module ContextDev
  module Models
    class WebExtractResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::WebExtractResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Cache outcome for this response. Composite responses are hits only when every
      # cache-controlled fetch contributing to the output was a hit; age_ms is the
      # oldest contributing hit.
      sig { returns(ContextDev::Models::WebExtractResponse::CacheMetadata) }
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebExtractResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # Extracted data matching the request schema
      sig { returns(T::Hash[Symbol, T.anything]) }
      attr_accessor :data

      sig { returns(ContextDev::Models::WebExtractResponse::Metadata) }
      attr_reader :metadata

      sig do
        params(
          metadata: ContextDev::Models::WebExtractResponse::Metadata::OrHash
        ).void
      end
      attr_writer :metadata

      # Unique id of this API call, also sent in the X-Request-Id response header. Quote
      # it when contacting support about a failed request.
      sig { returns(String) }
      attr_accessor :request_id

      # Status of the response, e.g., 'ok'
      sig { returns(String) }
      attr_accessor :status

      # The starting URL that was analyzed
      sig { returns(String) }
      attr_accessor :url

      # List of URLs whose Markdown was used for extraction
      sig { returns(T::Array[String]) }
      attr_accessor :urls_analyzed

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(T.nilable(ContextDev::Models::WebExtractResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::WebExtractResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::WebExtractResponse::CacheMetadata::OrHash,
          data: T::Hash[Symbol, T.anything],
          metadata: ContextDev::Models::WebExtractResponse::Metadata::OrHash,
          request_id: String,
          status: String,
          url: String,
          urls_analyzed: T::Array[String],
          key_metadata:
            ContextDev::Models::WebExtractResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        cache_metadata:,
        # Extracted data matching the request schema
        data:,
        metadata:,
        # Unique id of this API call, also sent in the X-Request-Id response header. Quote
        # it when contacting support about a failed request.
        request_id:,
        # Status of the response, e.g., 'ok'
        status:,
        # The starting URL that was analyzed
        url:,
        # List of URLs whose Markdown was used for extraction
        urls_analyzed:,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            cache_metadata:
              ContextDev::Models::WebExtractResponse::CacheMetadata,
            data: T::Hash[Symbol, T.anything],
            metadata: ContextDev::Models::WebExtractResponse::Metadata,
            request_id: String,
            status: String,
            url: String,
            urls_analyzed: T::Array[String],
            key_metadata: ContextDev::Models::WebExtractResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractResponse::CacheMetadata,
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
            ContextDev::Models::WebExtractResponse::CacheMetadata::Status::TaggedSymbol
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
              ContextDev::Models::WebExtractResponse::CacheMetadata::Status::OrSymbol
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
                ContextDev::Models::WebExtractResponse::CacheMetadata::Status::TaggedSymbol
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
                ContextDev::Models::WebExtractResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::WebExtractResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::WebExtractResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::WebExtractResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::WebExtractResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Metadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::WebExtractResponse::Metadata,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :max_crawl_depth

        # Number of crawled pages excluded because they were anti-bot challenges, error
        # pages, or parked-domain placeholders.
        sig { returns(Integer) }
        attr_accessor :num_blocked

        sig { returns(Integer) }
        attr_accessor :num_failed

        sig { returns(Integer) }
        attr_accessor :num_skipped

        sig { returns(Integer) }
        attr_accessor :num_succeeded

        sig { returns(Integer) }
        attr_accessor :num_urls

        # One verified outcome per requested browser action, in request order.
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied
              ]
            )
          )
        end
        attr_reader :actions_applied

        sig do
          params(
            actions_applied:
              T::Array[
                ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::OrHash
              ]
          ).void
        end
        attr_writer :actions_applied

        sig do
          params(
            max_crawl_depth: Integer,
            num_blocked: Integer,
            num_failed: Integer,
            num_skipped: Integer,
            num_succeeded: Integer,
            num_urls: Integer,
            actions_applied:
              T::Array[
                ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          max_crawl_depth:,
          # Number of crawled pages excluded because they were anti-bot challenges, error
          # pages, or parked-domain placeholders.
          num_blocked:,
          num_failed:,
          num_skipped:,
          num_succeeded:,
          num_urls:,
          # One verified outcome per requested browser action, in request order.
          actions_applied: nil
        )
        end

        sig do
          override.returns(
            {
              max_crawl_depth: Integer,
              num_blocked: Integer,
              num_failed: Integer,
              num_skipped: Integer,
              num_succeeded: Integer,
              num_urls: Integer,
              actions_applied:
                T::Array[
                  ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied
                ]
            }
          )
        end
        def to_hash
        end

        class ActionsApplied < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied,
                ContextDev::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :instruction

          # Applied means the requested page state was visibly verified. Failed means it was
          # not verified. Skipped means it was not attempted.
          sig do
            returns(
              ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status::TaggedSymbol
            )
          end
          attr_accessor :status

          # Visible page evidence used to verify an applied action.
          sig { returns(T.nilable(String)) }
          attr_reader :completion_evidence

          sig { params(completion_evidence: String).void }
          attr_writer :completion_evidence

          sig { returns(T.nilable(Float)) }
          attr_reader :duration_ms

          sig { params(duration_ms: Float).void }
          attr_writer :duration_ms

          sig { returns(T.nilable(String)) }
          attr_reader :error

          sig { params(error: String).void }
          attr_writer :error

          sig { returns(T.nilable(String)) }
          attr_reader :method_

          sig { params(method_: String).void }
          attr_writer :method_

          sig { returns(T.nilable(String)) }
          attr_reader :target_description

          sig { params(target_description: String).void }
          attr_writer :target_description

          sig do
            params(
              instruction: String,
              status:
                ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status::OrSymbol,
              completion_evidence: String,
              duration_ms: Float,
              error: String,
              method_: String,
              target_description: String
            ).returns(T.attached_class)
          end
          def self.new(
            instruction:,
            # Applied means the requested page state was visibly verified. Failed means it was
            # not verified. Skipped means it was not attempted.
            status:,
            # Visible page evidence used to verify an applied action.
            completion_evidence: nil,
            duration_ms: nil,
            error: nil,
            method_: nil,
            target_description: nil
          )
          end

          sig do
            override.returns(
              {
                instruction: String,
                status:
                  ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status::TaggedSymbol,
                completion_evidence: String,
                duration_ms: Float,
                error: String,
                method_: String,
                target_description: String
              }
            )
          end
          def to_hash
          end

          # Applied means the requested page state was visibly verified. Failed means it was
          # not verified. Skipped means it was not attempted.
          module Status
            extend ContextDev::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            APPLIED =
              T.let(
                :applied,
                ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status::TaggedSymbol
              )
            FAILED =
              T.let(
                :failed,
                ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status::TaggedSymbol
              )
            SKIPPED =
              T.let(
                :skipped,
                ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  ContextDev::Models::WebExtractResponse::Metadata::ActionsApplied::Status::TaggedSymbol
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
              ContextDev::Models::WebExtractResponse::KeyMetadata,
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
