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

      # Maximum number of monitors allowed for the account. Defaults to the plan
      # allowance unless a custom limit is set for the organization.
      sig { returns(Integer) }
      attr_accessor :monitors_limit

      # Number of monitors the account currently has.
      sig { returns(Integer) }
      attr_accessor :monitors_used

      # The plan tier the limit was resolved from.
      sig do
        returns(
          ContextDev::Models::MonitorGetLimitsResponse::Plan::TaggedSymbol
        )
      end
      attr_accessor :plan

      sig do
        params(
          monitors_limit: Integer,
          monitors_used: Integer,
          plan: ContextDev::Models::MonitorGetLimitsResponse::Plan::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Maximum number of monitors allowed for the account. Defaults to the plan
        # allowance unless a custom limit is set for the organization.
        monitors_limit:,
        # Number of monitors the account currently has.
        monitors_used:,
        # The plan tier the limit was resolved from.
        plan:
      )
      end

      sig do
        override.returns(
          {
            monitors_limit: Integer,
            monitors_used: Integer,
            plan:
              ContextDev::Models::MonitorGetLimitsResponse::Plan::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The plan tier the limit was resolved from.
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
    end
  end
end
