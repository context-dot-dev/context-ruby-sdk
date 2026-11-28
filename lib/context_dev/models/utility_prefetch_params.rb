# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Utility#prefetch
    class UtilityPrefetchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute identifier
      #   Domain or work email to prefetch. Provide exactly one.
      #
      #   @return [ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier]
      required :identifier, union: -> { ContextDev::UtilityPrefetchParams::Identifier }

      # @!attribute type
      #   Data to prefetch.
      #
      #   @return [Symbol, ContextDev::Models::UtilityPrefetchParams::Type]
      required :type, enum: -> { ContextDev::UtilityPrefetchParams::Type }

      # @!attribute policies
      #   Access policy IDs to apply; each URL must pass all of them. Requires access
      #   policies enabled for your organization; otherwise returns
      #   `ACCESS_POLICIES_NOT_ENABLED`.
      #
      #   @return [Array<String>, nil]
      optional :policies, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute tags
      #   Labels for this request. Filter usage and request logs by them in the dashboard
      #   or with `GET /org/logs`.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_opts
      #   Request deadline. The request fails with 408 when it passes.
      #
      #   @return [ContextDev::Models::UtilityPrefetchParams::TimeoutOpts, nil]
      optional :timeout_opts, -> { ContextDev::UtilityPrefetchParams::TimeoutOpts }, api_name: :timeoutOpts

      # @!method initialize(identifier:, type:, policies: nil, tags: nil, timeout_opts: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::UtilityPrefetchParams} for more details.
      #
      #   @param identifier [ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier] Domain or work email to prefetch. Provide exactly one.
      #
      #   @param type [Symbol, ContextDev::Models::UtilityPrefetchParams::Type] Data to prefetch.
      #
      #   @param policies [Array<String>] Access policy IDs to apply; each URL must pass all of them. Requires access poli
      #
      #   @param tags [Array<String>] Labels for this request. Filter usage and request logs by them in the dashboard
      #
      #   @param timeout_opts [ContextDev::Models::UtilityPrefetchParams::TimeoutOpts] Request deadline. The request fails with 408 when it passes.
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Domain or work email to prefetch. Provide exactly one.
      module Identifier
        extend ContextDev::Internal::Type::Union

        # Prefetch by domain.
        variant -> { ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier }

        # Prefetch by work email. Context.dev uses the email's domain.
        variant -> { ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier }

        class UtilityPrefetchDomainIdentifier < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #   Domain to prefetch, such as `stripe.com`.
          #
          #   @return [String]
          required :domain, String

          # @!method initialize(domain:)
          #   Prefetch by domain.
          #
          #   @param domain [String] Domain to prefetch, such as `stripe.com`.
        end

        class UtilityPrefetchEmailIdentifier < ContextDev::Internal::Type::BaseModel
          # @!attribute email
          #   Work email whose domain to prefetch. Free email providers such as `gmail.com`
          #   and disposable addresses are rejected with 422.
          #
          #   @return [String]
          required :email, String

          # @!method initialize(email:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier}
          #   for more details.
          #
          #   Prefetch by work email. Context.dev uses the email's domain.
          #
          #   @param email [String] Work email whose domain to prefetch. Free email providers such as `gmail.com` an
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
        #   Only `fail` is supported: the request returns 408 at the deadline.
        #
        #   @return [Symbol, ContextDev::Models::UtilityPrefetchParams::TimeoutOpts::Behavior, nil]
        optional :behavior, enum: -> { ContextDev::UtilityPrefetchParams::TimeoutOpts::Behavior }

        # @!method initialize(milliseconds:, behavior: nil)
        #   Request deadline. The request fails with 408 when it passes.
        #
        #   @param milliseconds [Integer] Deadline in milliseconds.
        #
        #   @param behavior [Symbol, ContextDev::Models::UtilityPrefetchParams::TimeoutOpts::Behavior] Only `fail` is supported: the request returns 408 at the deadline.

        # Only `fail` is supported: the request returns 408 at the deadline.
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
