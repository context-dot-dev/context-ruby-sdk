# typed: strong

module ContextDev
  module Models
    class MonitorGetLimitsResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorGetLimitsResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Most monitors you can have: your plan's allowance or a custom limit.
      sig { returns(Integer) }
      attr_accessor :monitors_limit

      # Number of monitors the account currently has.
      sig { returns(Integer) }
      attr_accessor :monitors_used

      # `starter` means Developer; `pro` means Pro or Growth; `scale` means Scale or
      # Enterprise.
      sig do
        returns(
          ContextDev::Models::MonitorGetLimitsResponse::Plan::TaggedSymbol
        )
      end
      attr_accessor :plan

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(ContextDev::Models::MonitorGetLimitsResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::MonitorGetLimitsResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          monitors_limit: Integer,
          monitors_used: Integer,
          plan: ContextDev::Models::MonitorGetLimitsResponse::Plan::OrSymbol,
          request_id: String,
          key_metadata:
            ContextDev::Models::MonitorGetLimitsResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Most monitors you can have: your plan's allowance or a custom limit.
        monitors_limit:,
        # Number of monitors the account currently has.
        monitors_used:,
        # `starter` means Developer; `pro` means Pro or Growth; `scale` means Scale or
        # Enterprise.
        plan:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            monitors_limit: Integer,
            monitors_used: Integer,
            plan:
              ContextDev::Models::MonitorGetLimitsResponse::Plan::TaggedSymbol,
            request_id: String,
            key_metadata:
              ContextDev::Models::MonitorGetLimitsResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      # `starter` means Developer; `pro` means Pro or Growth; `scale` means Scale or
      # Enterprise.
      module Plan
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::Models::MonitorGetLimitsResponse::Plan)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        FREE =
          T.let(
            :free,
            ContextDev::Models::MonitorGetLimitsResponse::Plan::TaggedSymbol
          )
        STARTER =
          T.let(
            :starter,
            ContextDev::Models::MonitorGetLimitsResponse::Plan::TaggedSymbol
          )
        PRO =
          T.let(
            :pro,
            ContextDev::Models::MonitorGetLimitsResponse::Plan::TaggedSymbol
          )
        SCALE =
          T.let(
            :scale,
            ContextDev::Models::MonitorGetLimitsResponse::Plan::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::Models::MonitorGetLimitsResponse::Plan::TaggedSymbol
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
              ContextDev::Models::MonitorGetLimitsResponse::KeyMetadata,
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
