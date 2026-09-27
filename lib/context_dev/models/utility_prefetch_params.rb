# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Utility#prefetch
    class UtilityPrefetchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute identifier
      #   Identifier of the target to prefetch. Provide exactly one of domain or email.
      #
      #   @return [ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier]
      required :identifier, union: -> { ContextDev::UtilityPrefetchParams::Identifier }

      # @!attribute type
      #   Data to prefetch.
      #
      #   @return [Symbol, ContextDev::Models::UtilityPrefetchParams::Type]
      required :type, enum: -> { ContextDev::UtilityPrefetchParams::Type }

      # @!attribute tags
      #   Labels for filtering usage in the dashboard.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline and what to return when it passes.
      #
      #   @return [ContextDev::Models::UtilityPrefetchParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::UtilityPrefetchParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!method initialize(identifier:, type:, tags: nil, timeout_opts: nil, request_options: {})
      #   @param identifier [ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier] Identifier of the target to prefetch. Provide exactly one of domain or email.
      #
      #   @param type [Symbol, ContextDev::Models::UtilityPrefetchParams::Type] Data to prefetch.
      #
      #   @param tags [Array<String>] Labels for filtering usage in the dashboard.
      #
      #   @param timeout_opts [ContextDev::Models::UtilityPrefetchParams::TimeoutOpts] Request deadline and what to return when it passes.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Identifier of the target to prefetch. Provide exactly one of domain or email.
      module Identifier
        extend ContextDev::Internal::Type::Union

        # Prefetch by domain.
        variant -> { ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier }

        # Prefetch by email. The domain will be extracted and validated.
        variant -> { ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier }

        class UtilityPrefetchDomainIdentifier < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #   Domain, e.g. `stripe.com`.
          #
          #   @return [String]
          required :domain, String

          # @!method initialize(domain:)
          #   Prefetch by domain.
          #
          #   @param domain [String] Domain, e.g. `stripe.com`.
        end

        class UtilityPrefetchEmailIdentifier < ContextDev::Internal::Type::BaseModel
          # @!attribute email
          #   Email address to prefetch data for. The domain will be extracted from the email.
          #   Free email providers (gmail.com, yahoo.com, etc.) and disposable email addresses
          #   are not allowed.
          #
          #   @return [String]
          required :email, String

          # @!method initialize(email:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier}
          #   for more details.
          #
          #   Prefetch by email. The domain will be extracted and validated.
          #
          #   @param email [String] Email address to prefetch data for. The domain will be extracted from the email.
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier)]
      end

      # Data to prefetch.
      module Type
        extend ContextDev::Internal::Type::Enum

        BRAND = :brand
        STYLEGUIDE = :styleguide

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        # @!attribute milliseconds
        #   Deadline in milliseconds.
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   Only "fail" is supported: return 408 at the deadline.
        #
        #   @return [Symbol, ContextDev::Models::UtilityPrefetchParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::UtilityPrefetchParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Request deadline and what to return when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::UtilityPrefetchParams::TimeoutOpts::Behavior] Only "fail" is supported: return 408 at the deadline.

        # Only "fail" is supported: return 408 at the deadline.
        #
        # @see ContextDev::Models::UtilityPrefetchParams::TimeoutOpts#behavior
        module Behavior
          extend ContextDev::Internal::Type::Enum

          FAIL = :fail

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
