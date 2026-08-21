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

      # Status of the response, e.g., 'ok'
      sig { returns(String) }
      attr_accessor :status

      # The starting URL that was analyzed
      sig { returns(String) }
      attr_accessor :url

      # List of URLs whose Markdown was used for extraction
      sig { returns(T::Array[String]) }
      attr_accessor :urls_analyzed

      # Metadata about the API key used for the request. Included in every response
      # whenever a valid API key is provided, even when the response status is not 200.
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
          data: T::Hash[Symbol, T.anything],
          metadata: ContextDev::Models::WebExtractResponse::Metadata::OrHash,
          status: String,
          url: String,
          urls_analyzed: T::Array[String],
          key_metadata:
            ContextDev::Models::WebExtractResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Extracted data matching the request schema
        data:,
        metadata:,
        # Status of the response, e.g., 'ok'
        status:,
        # The starting URL that was analyzed
        url:,
        # List of URLs whose Markdown was used for extraction
        urls_analyzed:,
        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            data: T::Hash[Symbol, T.anything],
            metadata: ContextDev::Models::WebExtractResponse::Metadata,
            status: String,
            url: String,
            urls_analyzed: T::Array[String],
            key_metadata: ContextDev::Models::WebExtractResponse::KeyMetadata
          }
        )
      end
      def to_hash
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

        # The number of credits consumed by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # The number of credits remaining for your organization after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Metadata about the API key used for the request. Included in every response
        # whenever a valid API key is provided, even when the response status is not 200.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # The number of credits consumed by this request.
          credits_consumed:,
          # The number of credits remaining for your organization after this request.
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
