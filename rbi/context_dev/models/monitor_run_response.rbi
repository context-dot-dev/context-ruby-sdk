# typed: strong

module ContextDev
  module Models
    class MonitorRunResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorRunResponse,
            ContextDev::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :monitor_id

      sig { returns(T::Boolean) }
      attr_accessor :queued

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # ID of the queued run; pass it to Retrieve a monitor run.
      sig { returns(String) }
      attr_accessor :run_id

      # Credits this request used and your remaining balance.
      sig do
        returns(T.nilable(ContextDev::Models::MonitorRunResponse::KeyMetadata))
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::MonitorRunResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          monitor_id: String,
          queued: T::Boolean,
          request_id: String,
          run_id: String,
          key_metadata:
            ContextDev::Models::MonitorRunResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        monitor_id:,
        queued:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # ID of the queued run; pass it to Retrieve a monitor run.
        run_id:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            monitor_id: String,
            queued: T::Boolean,
            request_id: String,
            run_id: String,
            key_metadata: ContextDev::Models::MonitorRunResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorRunResponse::KeyMetadata,
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
