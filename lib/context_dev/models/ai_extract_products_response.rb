# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::AI#extract_products
    class AIExtractProductsResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute cache_metadata
      #   Cache outcome for this response. Composite responses are hits only when every
      #   cache-controlled fetch contributing to the output was a hit; age_ms is the
      #   oldest contributing hit.
      #
      #   @return [ContextDev::Models::AIExtractProductsResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::AIExtractProductsResponse::CacheMetadata }

      # @!attribute key_metadata
      #   Credit usage, included whenever a valid API key is provided.
      #
      #   @return [ContextDev::Models::AIExtractProductsResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::AIExtractProductsResponse::KeyMetadata }

      # @!attribute products
      #   Array of products extracted from the website
      #
      #   @return [Array<ContextDev::Models::AIExtractProductsResponse::Product>, nil]
      optional :products,
               -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::AIExtractProductsResponse::Product] }

      # @!method initialize(cache_metadata:, key_metadata: nil, products: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::AIExtractProductsResponse} for more details.
      #
      #   @param cache_metadata [ContextDev::Models::AIExtractProductsResponse::CacheMetadata] Cache outcome for this response. Composite responses are hits only when every ca
      #
      #   @param key_metadata [ContextDev::Models::AIExtractProductsResponse::KeyMetadata] Credit usage, included whenever a valid API key is provided.
      #
      #   @param products [Array<ContextDev::Models::AIExtractProductsResponse::Product>] Array of products extracted from the website

      # @see ContextDev::Models::AIExtractProductsResponse#cache_metadata
      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute age_ms
        #   Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @return [Integer]
        required :age_ms, Integer

        # @!attribute status
        #   Whether the response was served from cache, required fresh work, or honored
        #   zero-data-retention cache bypass.
        #
        #   @return [Symbol, ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::AIExtractProductsResponse::CacheMetadata} for more details.
        #
        #   Cache outcome for this response. Composite responses are hits only when every
        #   cache-controlled fetch contributing to the output was a hit; age_ms is the
        #   oldest contributing hit.
        #
        #   @param age_ms [Integer] Age of the cached data in milliseconds. Zero for miss and zdr responses.
        #
        #   @param status [Symbol, ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status] Whether the response was served from cache, required fresh work, or honored zero

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        #
        # @see ContextDev::Models::AIExtractProductsResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::AIExtractProductsResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits used by this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits remaining for your organization.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credit usage, included whenever a valid API key is provided.
        #
        #   @param credits_consumed [Integer] Credits used by this request.
        #
        #   @param credits_remaining [Integer] Credits remaining for your organization.
      end

      class Product < ContextDev::Internal::Type::BaseModel
        # @!attribute description
        #   Description of the product
        #
        #   @return [String]
        required :description, String

        # @!attribute features
        #   List of product features
        #
        #   @return [Array<String>]
        required :features, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute images
        #   URLs to product images on the page (up to 7)
        #
        #   @return [Array<String>]
        required :images, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute name
        #   Name of the product
        #
        #   @return [String]
        required :name, String

        # @!attribute sku
        #   Stock Keeping Unit (product identifier). Null if no identifier is found.
        #
        #   @return [String, nil]
        required :sku, String, nil?: true

        # @!attribute tags
        #   Tags associated with the product
        #
        #   @return [Array<String>]
        required :tags, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute target_audience
        #   Target audience for the product (array of strings)
        #
        #   @return [Array<String>]
        required :target_audience, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute availability
        #   Normalized stock or ordering availability
        #
        #   @return [Symbol, ContextDev::Models::AIExtractProductsResponse::Product::Availability, nil]
        optional :availability,
                 enum: -> { ContextDev::Models::AIExtractProductsResponse::Product::Availability },
                 nil?: true

        # @!attribute billing_frequency
        #   Billing frequency for the product
        #
        #   @return [Symbol, ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency, nil]
        optional :billing_frequency,
                 enum: -> { ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency },
                 nil?: true

        # @!attribute category
        #   Category of the product
        #
        #   @return [String, nil]
        optional :category, String, nil?: true

        # @!attribute currency
        #   Currency code for the price (e.g., USD, EUR)
        #
        #   @return [String, nil]
        optional :currency, String, nil?: true

        # @!attribute dimensions
        #   Dimension statements shown for the product, preserving labels, values, and units
        #
        #   @return [Array<String>, nil]
        optional :dimensions, ContextDev::Internal::Type::ArrayOf[String]

        # @!attribute image_url
        #   URL to the product image
        #
        #   @return [String, nil]
        optional :image_url, String, nil?: true

        # @!attribute price
        #   Price of the product
        #
        #   @return [Float, nil]
        optional :price, Float, nil?: true

        # @!attribute pricing_model
        #   Pricing model for the product
        #
        #   @return [Symbol, ContextDev::Models::AIExtractProductsResponse::Product::PricingModel, nil]
        optional :pricing_model,
                 enum: -> { ContextDev::Models::AIExtractProductsResponse::Product::PricingModel },
                 nil?: true

        # @!attribute regular_price
        #   Original or regular price before a displayed discount
        #
        #   @return [Float, nil]
        optional :regular_price, Float, nil?: true

        # @!attribute url
        #   URL to the product page
        #
        #   @return [String, nil]
        optional :url, String, nil?: true

        # @!method initialize(description:, features:, images:, name:, sku:, tags:, target_audience:, availability: nil, billing_frequency: nil, category: nil, currency: nil, dimensions: nil, image_url: nil, price: nil, pricing_model: nil, regular_price: nil, url: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::AIExtractProductsResponse::Product} for more details.
        #
        #   @param description [String] Description of the product
        #
        #   @param features [Array<String>] List of product features
        #
        #   @param images [Array<String>] URLs to product images on the page (up to 7)
        #
        #   @param name [String] Name of the product
        #
        #   @param sku [String, nil] Stock Keeping Unit (product identifier). Null if no identifier is found.
        #
        #   @param tags [Array<String>] Tags associated with the product
        #
        #   @param target_audience [Array<String>] Target audience for the product (array of strings)
        #
        #   @param availability [Symbol, ContextDev::Models::AIExtractProductsResponse::Product::Availability, nil] Normalized stock or ordering availability
        #
        #   @param billing_frequency [Symbol, ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency, nil] Billing frequency for the product
        #
        #   @param category [String, nil] Category of the product
        #
        #   @param currency [String, nil] Currency code for the price (e.g., USD, EUR)
        #
        #   @param dimensions [Array<String>] Dimension statements shown for the product, preserving labels, values, and units
        #
        #   @param image_url [String, nil] URL to the product image
        #
        #   @param price [Float, nil] Price of the product
        #
        #   @param pricing_model [Symbol, ContextDev::Models::AIExtractProductsResponse::Product::PricingModel, nil] Pricing model for the product
        #
        #   @param regular_price [Float, nil] Original or regular price before a displayed discount
        #
        #   @param url [String, nil] URL to the product page

        # Normalized stock or ordering availability
        #
        # @see ContextDev::Models::AIExtractProductsResponse::Product#availability
        module Availability
          extend ContextDev::Internal::Type::Enum

          IN_STOCK = :in_stock
          OUT_OF_STOCK = :out_of_stock
          LIMITED_AVAILABILITY = :limited_availability
          PREORDER = :preorder
          BACKORDER = :backorder
          MADE_TO_ORDER = :made_to_order
          DISCONTINUED = :discontinued

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Billing frequency for the product
        #
        # @see ContextDev::Models::AIExtractProductsResponse::Product#billing_frequency
        module BillingFrequency
          extend ContextDev::Internal::Type::Enum

          MONTHLY = :monthly
          YEARLY = :yearly
          ONE_TIME = :one_time
          USAGE_BASED = :usage_based

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Pricing model for the product
        #
        # @see ContextDev::Models::AIExtractProductsResponse::Product#pricing_model
        module PricingModel
          extend ContextDev::Internal::Type::Enum

          PER_SEAT = :per_seat
          FLAT = :flat
          TIERED = :tiered
          FREEMIUM = :freemium
          CUSTOM = :custom

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
