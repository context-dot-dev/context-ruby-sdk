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
      #   What to prefetch: 'brand' warms the brand data cache, 'styleguide' warms the
      #   styleguide cache.
      #
      #   @return [Symbol, ContextDev::Models::UtilityPrefetchParams::Type]
      required :type, enum: -> { ContextDev::UtilityPrefetchParams::Type }

      # @!attribute tags
      #   Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Optional request deadline and behavior on timeout. For GET requests, use
      #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
      #   timeoutOpts object.
      #
      #   @return [ContextDev::Models::UtilityPrefetchParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::UtilityPrefetchParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!method initialize(identifier:, type:, tags: nil, timeout_opts: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::UtilityPrefetchParams} for more details.
      #
      #   @param identifier [ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier] Identifier of the target to prefetch. Provide exactly one of domain or email.
      #
      #   @param type [Symbol, ContextDev::Models::UtilityPrefetchParams::Type] What to prefetch: 'brand' warms the brand data cache, 'styleguide' warms the sty
      #
      #   @param tags [Array<String>] Optional tags for tracking usage. Up to 20 tags, each 1 to 50 characters.
      #
      #   @param timeout_opts [ContextDev::Models::UtilityPrefetchParams::TimeoutOpts] Optional request deadline and behavior on timeout. For GET requests, use timeout
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
          #   Domain name to prefetch data for
          #
          #   @return [String]
          required :domain, String

          # @!method initialize(domain:)
          #   Prefetch by domain.
          #
          #   @param domain [String] Domain name to prefetch data for
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

      # What to prefetch: 'brand' warms the brand data cache, 'styleguide' warms the
      # styleguide cache.
      module Type
        extend ContextDev::Internal::Type::Enum

        BRAND = :brand
        STYLEGUIDE = :styleguide

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class TimeoutOpts < ContextDev::Internal::Type::BaseModel
        # @!attribute milliseconds
        #   Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @return [Integer]
        required :milliseconds, Integer

        # @!attribute behavior
        #   What to do at the deadline. This endpoint supports "fail": return 408
        #   REQUEST_TIMEOUT without charging credits.
        #
        #   @return [Symbol, ContextDev::Models::UtilityPrefetchParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::UtilityPrefetchParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::UtilityPrefetchParams::TimeoutOpts} for more details.
        #
        #   Optional request deadline and behavior on timeout. For GET requests, use
        #   timeoutOpts[milliseconds]=30000&timeoutOpts[behavior]=fail or a JSON-encoded
        #   timeoutOpts object.
        #
        #   @param milliseconds [Integer] Request deadline in milliseconds. Maximum: 300000 (5 minutes).
        #
        #   @param behavior [Symbol, ContextDev::Models::UtilityPrefetchParams::TimeoutOpts::Behavior] What to do at the deadline. This endpoint supports "fail": return 408 REQUEST_TI

        # What to do at the deadline. This endpoint supports "fail": return 408
        # REQUEST_TIMEOUT without charging credits.
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
