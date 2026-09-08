# typed: strong

module ContextDev
  module Models
    class WebhookDelivery < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(ContextDev::WebhookDelivery, ContextDev::Internal::AnyHash)
        end

      sig { returns(Time) }
      attr_accessor :attempted_at

      sig { returns(T.nilable(ContextDev::WebhookDelivery::Error)) }
      attr_reader :error

      sig do
        params(
          error: T.nilable(ContextDev::WebhookDelivery::Error::OrHash)
        ).void
      end
      attr_writer :error

      # The event this delivery carried. Deliveries recorded before event selection
      # existed report change.detected.
      sig { returns(ContextDev::WebhookDelivery::Event::TaggedSymbol) }
      attr_accessor :event

      # Identifier sent in the X-Context-Id header.
      sig { returns(String) }
      attr_accessor :event_id

      # The endpoint's final HTTP response status, or null when no response was
      # received.
      sig { returns(T.nilable(Integer)) }
      attr_accessor :http_status

      # Delivery outcome. delivered means any 2xx response; rejected means a non-2xx
      # response; failed means no HTTP response was received; skipped_unsafe_url means
      # the URL failed the public-endpoint safety check.
      sig { returns(ContextDev::WebhookDelivery::Status::TaggedSymbol) }
      attr_accessor :status

      # Delivery ID for status checks and retries, when available.
      sig { returns(T.nilable(String)) }
      attr_reader :delivery_id

      sig { params(delivery_id: String).void }
      attr_writer :delivery_id

      sig do
        params(
          attempted_at: Time,
          error: T.nilable(ContextDev::WebhookDelivery::Error::OrHash),
          event: ContextDev::WebhookDelivery::Event::OrSymbol,
          event_id: String,
          http_status: T.nilable(Integer),
          status: ContextDev::WebhookDelivery::Status::OrSymbol,
          delivery_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        attempted_at:,
        error:,
        # The event this delivery carried. Deliveries recorded before event selection
        # existed report change.detected.
        event:,
        # Identifier sent in the X-Context-Id header.
        event_id:,
        # The endpoint's final HTTP response status, or null when no response was
        # received.
        http_status:,
        # Delivery outcome. delivered means any 2xx response; rejected means a non-2xx
        # response; failed means no HTTP response was received; skipped_unsafe_url means
        # the URL failed the public-endpoint safety check.
        status:,
        # Delivery ID for status checks and retries, when available.
        delivery_id: nil
      )
      end

      sig do
        override.returns(
          {
            attempted_at: Time,
            error: T.nilable(ContextDev::WebhookDelivery::Error),
            event: ContextDev::WebhookDelivery::Event::TaggedSymbol,
            event_id: String,
            http_status: T.nilable(Integer),
            status: ContextDev::WebhookDelivery::Status::TaggedSymbol,
            delivery_id: String
          }
        )
      end
      def to_hash
      end

      class Error < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::WebhookDelivery::Error,
              ContextDev::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :code

        sig { returns(String) }
        attr_accessor :message

        sig { params(code: String, message: String).returns(T.attached_class) }
        def self.new(code:, message:)
        end

        sig { override.returns({ code: String, message: String }) }
        def to_hash
        end
      end

      # The event this delivery carried. Deliveries recorded before event selection
      # existed report change.detected.
      module Event
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebhookDelivery::Event) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CHANGE_DETECTED =
          T.let(
            :"change.detected",
            ContextDev::WebhookDelivery::Event::TaggedSymbol
          )
        RUN_COMPLETED =
          T.let(
            :"run.completed",
            ContextDev::WebhookDelivery::Event::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::WebhookDelivery::Event::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Delivery outcome. delivered means any 2xx response; rejected means a non-2xx
      # response; failed means no HTTP response was received; skipped_unsafe_url means
      # the URL failed the public-endpoint safety check.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::WebhookDelivery::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DELIVERED =
          T.let(:delivered, ContextDev::WebhookDelivery::Status::TaggedSymbol)
        REJECTED =
          T.let(:rejected, ContextDev::WebhookDelivery::Status::TaggedSymbol)
        FAILED =
          T.let(:failed, ContextDev::WebhookDelivery::Status::TaggedSymbol)
        SKIPPED_UNSAFE_URL =
          T.let(
            :skipped_unsafe_url,
            ContextDev::WebhookDelivery::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::WebhookDelivery::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
