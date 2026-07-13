# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Utility#prefetch
    class UtilityPrefetchParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute identifier
      #   Identifier of the brand to prefetch. Provide exactly one of domain or email.
      #
      #   @return [ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier]
      required :identifier, union: -> { ContextDev::UtilityPrefetchParams::Identifier }

      # @!attribute type
      #   What to prefetch. Currently only 'brand' is supported.
      #
      #   @return [Symbol, ContextDev::Models::UtilityPrefetchParams::Type]
      required :type, enum: -> { ContextDev::UtilityPrefetchParams::Type }

      # @!attribute tags
      #   Optional caller-defined tags for tracking this request. Tags are recorded on the
      #   request's usage log and can be used to filter usage on the dashboard usage page.
      #   Up to 20 tags, each 1-50 characters.
      #
      #   @return [Array<String>, nil]
      optional :tags, ContextDev::Internal::Type::ArrayOf[String]

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer, api_name: :timeoutMS

      # @!method initialize(identifier:, type:, tags: nil, timeout_ms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::UtilityPrefetchParams} for more details.
      #
      #   @param identifier [ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier] Identifier of the brand to prefetch. Provide exactly one of domain or email.
      #
      #   @param type [Symbol, ContextDev::Models::UtilityPrefetchParams::Type] What to prefetch. Currently only 'brand' is supported.
      #
      #   @param tags [Array<String>] Optional caller-defined tags for tracking this request. Tags are recorded on the
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Identifier of the brand to prefetch. Provide exactly one of domain or email.
      module Identifier
        extend ContextDev::Internal::Type::Union

        # Prefetch brand data by domain.
        variant -> { ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier }

        # Prefetch brand data by email. The domain will be extracted and validated.
        variant -> { ContextDev::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier }

        class UtilityPrefetchDomainIdentifier < ContextDev::Internal::Type::BaseModel
          # @!attribute domain
          #   Domain name to prefetch brand data for
          #
          #   @return [String]
          required :domain, String

          # @!method initialize(domain:)
          #   Prefetch brand data by domain.
          #
          #   @param domain [String] Domain name to prefetch brand data for
        end

        class UtilityPrefetchEmailIdentifier < ContextDev::Internal::Type::BaseModel
          # @!attribute email
          #   Email address to prefetch brand data for. The domain will be extracted from the
          #   email. Free email providers (gmail.com, yahoo.com, etc.) and disposable email
          #   addresses are not allowed.
          #
          #   @return [String]
          required :email, String

          # @!method initialize(email:)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier}
          #   for more details.
          #
          #   Prefetch brand data by email. The domain will be extracted and validated.
          #
          #   @param email [String] Email address to prefetch brand data for. The domain will be extracted from the
        end

        # @!method self.variants
        #   @return [Array(ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchDomainIdentifier, ContextDev::Models::UtilityPrefetchParams::Identifier::UtilityPrefetchEmailIdentifier)]
      end

      # What to prefetch. Currently only 'brand' is supported.
      module Type
        extend ContextDev::Internal::Type::Enum

        BRAND = :brand

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
