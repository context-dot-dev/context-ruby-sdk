# typed: strong

module ContextDev
  module Models
    class AIExtractProductsResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::AIExtractProductsResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Cache outcome for this response. Composite responses are hits only when every
      # cache-controlled fetch contributing to the output was a hit; age_ms is the
      # oldest contributing hit.
      sig do
        returns(ContextDev::Models::AIExtractProductsResponse::CacheMetadata)
      end
      attr_reader :cache_metadata

      sig do
        params(
          cache_metadata:
            ContextDev::Models::AIExtractProductsResponse::CacheMetadata::OrHash
        ).void
      end
      attr_writer :cache_metadata

      # Credit usage, included whenever a valid API key is provided.
      sig do
        returns(
          T.nilable(ContextDev::Models::AIExtractProductsResponse::KeyMetadata)
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::AIExtractProductsResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      # Array of products extracted from the website
      sig do
        returns(
          T.nilable(
            T::Array[ContextDev::Models::AIExtractProductsResponse::Product]
          )
        )
      end
      attr_reader :products

      sig do
        params(
          products:
            T::Array[
              ContextDev::Models::AIExtractProductsResponse::Product::OrHash
            ]
        ).void
      end
      attr_writer :products

      sig do
        params(
          cache_metadata:
            ContextDev::Models::AIExtractProductsResponse::CacheMetadata::OrHash,
          key_metadata:
            ContextDev::Models::AIExtractProductsResponse::KeyMetadata::OrHash,
          products:
            T::Array[
              ContextDev::Models::AIExtractProductsResponse::Product::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        cache_metadata:,
        # Credit usage, included whenever a valid API key is provided.
        key_metadata: nil,
        # Array of products extracted from the website
        products: nil
      )
      end

      sig do
        override.returns(
          {
            cache_metadata:
              ContextDev::Models::AIExtractProductsResponse::CacheMetadata,
            key_metadata:
              ContextDev::Models::AIExtractProductsResponse::KeyMetadata,
            products:
              T::Array[ContextDev::Models::AIExtractProductsResponse::Product]
          }
        )
      end
      def to_hash
      end

      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::AIExtractProductsResponse::CacheMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Age of the cached data in milliseconds. Zero for miss and zdr responses.
        sig { returns(Integer) }
        attr_accessor :age_ms

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        sig do
          returns(
            ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        # Cache outcome for this response. Composite responses are hits only when every
        # cache-controlled fetch contributing to the output was a hit; age_ms is the
        # oldest contributing hit.
        sig do
          params(
            age_ms: Integer,
            status:
              ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Age of the cached data in milliseconds. Zero for miss and zdr responses.
          age_ms:,
          # Whether the response was served from cache, required fresh work, or honored
          # zero-data-retention cache bypass.
          status:
        )
        end

        sig do
          override.returns(
            {
              age_ms: Integer,
              status:
                ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Whether the response was served from cache, required fresh work, or honored
        # zero-data-retention cache bypass.
        module Status
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          HIT =
            T.let(
              :hit,
              ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status::TaggedSymbol
            )
          MISS =
            T.let(
              :miss,
              ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status::TaggedSymbol
            )
          ZDR =
            T.let(
              :zdr,
              ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::AIExtractProductsResponse::CacheMetadata::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::AIExtractProductsResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits used by this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits remaining for your organization.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credit usage, included whenever a valid API key is provided.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits used by this request.
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

      class Product < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::AIExtractProductsResponse::Product,
              ContextDev::Internal::AnyHash
            )
          end

        # Description of the product
        sig { returns(String) }
        attr_accessor :description

        # List of product features
        sig { returns(T::Array[String]) }
        attr_accessor :features

        # URLs to product images on the page (up to 7)
        sig { returns(T::Array[String]) }
        attr_accessor :images

        # Name of the product
        sig { returns(String) }
        attr_accessor :name

        # Stock Keeping Unit (product identifier). Null if no identifier is found.
        sig { returns(T.nilable(String)) }
        attr_accessor :sku

        # Tags associated with the product
        sig { returns(T::Array[String]) }
        attr_accessor :tags

        # Target audience for the product (array of strings)
        sig { returns(T::Array[String]) }
        attr_accessor :target_audience

        # Normalized stock or ordering availability
        sig do
          returns(
            T.nilable(
              ContextDev::Models::AIExtractProductsResponse::Product::Availability::TaggedSymbol
            )
          )
        end
        attr_accessor :availability

        # Billing frequency for the product
        sig do
          returns(
            T.nilable(
              ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency::TaggedSymbol
            )
          )
        end
        attr_accessor :billing_frequency

        # Category of the product
        sig { returns(T.nilable(String)) }
        attr_accessor :category

        # Currency code for the price (e.g., USD, EUR)
        sig { returns(T.nilable(String)) }
        attr_accessor :currency

        # Dimension statements shown for the product, preserving labels, values, and units
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :dimensions

        sig { params(dimensions: T::Array[String]).void }
        attr_writer :dimensions

        # URL to the product image
        sig { returns(T.nilable(String)) }
        attr_accessor :image_url

        # Price of the product
        sig { returns(T.nilable(Float)) }
        attr_accessor :price

        # Pricing model for the product
        sig do
          returns(
            T.nilable(
              ContextDev::Models::AIExtractProductsResponse::Product::PricingModel::TaggedSymbol
            )
          )
        end
        attr_accessor :pricing_model

        # Original or regular price before a displayed discount
        sig { returns(T.nilable(Float)) }
        attr_accessor :regular_price

        # URL to the product page
        sig { returns(T.nilable(String)) }
        attr_accessor :url

        sig do
          params(
            description: String,
            features: T::Array[String],
            images: T::Array[String],
            name: String,
            sku: T.nilable(String),
            tags: T::Array[String],
            target_audience: T::Array[String],
            availability:
              T.nilable(
                ContextDev::Models::AIExtractProductsResponse::Product::Availability::OrSymbol
              ),
            billing_frequency:
              T.nilable(
                ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency::OrSymbol
              ),
            category: T.nilable(String),
            currency: T.nilable(String),
            dimensions: T::Array[String],
            image_url: T.nilable(String),
            price: T.nilable(Float),
            pricing_model:
              T.nilable(
                ContextDev::Models::AIExtractProductsResponse::Product::PricingModel::OrSymbol
              ),
            regular_price: T.nilable(Float),
            url: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Description of the product
          description:,
          # List of product features
          features:,
          # URLs to product images on the page (up to 7)
          images:,
          # Name of the product
          name:,
          # Stock Keeping Unit (product identifier). Null if no identifier is found.
          sku:,
          # Tags associated with the product
          tags:,
          # Target audience for the product (array of strings)
          target_audience:,
          # Normalized stock or ordering availability
          availability: nil,
          # Billing frequency for the product
          billing_frequency: nil,
          # Category of the product
          category: nil,
          # Currency code for the price (e.g., USD, EUR)
          currency: nil,
          # Dimension statements shown for the product, preserving labels, values, and units
          dimensions: nil,
          # URL to the product image
          image_url: nil,
          # Price of the product
          price: nil,
          # Pricing model for the product
          pricing_model: nil,
          # Original or regular price before a displayed discount
          regular_price: nil,
          # URL to the product page
          url: nil
        )
        end

        sig do
          override.returns(
            {
              description: String,
              features: T::Array[String],
              images: T::Array[String],
              name: String,
              sku: T.nilable(String),
              tags: T::Array[String],
              target_audience: T::Array[String],
              availability:
                T.nilable(
                  ContextDev::Models::AIExtractProductsResponse::Product::Availability::TaggedSymbol
                ),
              billing_frequency:
                T.nilable(
                  ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency::TaggedSymbol
                ),
              category: T.nilable(String),
              currency: T.nilable(String),
              dimensions: T::Array[String],
              image_url: T.nilable(String),
              price: T.nilable(Float),
              pricing_model:
                T.nilable(
                  ContextDev::Models::AIExtractProductsResponse::Product::PricingModel::TaggedSymbol
                ),
              regular_price: T.nilable(Float),
              url: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Normalized stock or ordering availability
        module Availability
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::AIExtractProductsResponse::Product::Availability
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          IN_STOCK =
            T.let(
              :in_stock,
              ContextDev::Models::AIExtractProductsResponse::Product::Availability::TaggedSymbol
            )
          OUT_OF_STOCK =
            T.let(
              :out_of_stock,
              ContextDev::Models::AIExtractProductsResponse::Product::Availability::TaggedSymbol
            )
          LIMITED_AVAILABILITY =
            T.let(
              :limited_availability,
              ContextDev::Models::AIExtractProductsResponse::Product::Availability::TaggedSymbol
            )
          PREORDER =
            T.let(
              :preorder,
              ContextDev::Models::AIExtractProductsResponse::Product::Availability::TaggedSymbol
            )
          BACKORDER =
            T.let(
              :backorder,
              ContextDev::Models::AIExtractProductsResponse::Product::Availability::TaggedSymbol
            )
          MADE_TO_ORDER =
            T.let(
              :made_to_order,
              ContextDev::Models::AIExtractProductsResponse::Product::Availability::TaggedSymbol
            )
          DISCONTINUED =
            T.let(
              :discontinued,
              ContextDev::Models::AIExtractProductsResponse::Product::Availability::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::AIExtractProductsResponse::Product::Availability::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Billing frequency for the product
        module BillingFrequency
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MONTHLY =
            T.let(
              :monthly,
              ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency::TaggedSymbol
            )
          YEARLY =
            T.let(
              :yearly,
              ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency::TaggedSymbol
            )
          ONE_TIME =
            T.let(
              :one_time,
              ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency::TaggedSymbol
            )
          USAGE_BASED =
            T.let(
              :usage_based,
              ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::AIExtractProductsResponse::Product::BillingFrequency::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Pricing model for the product
        module PricingModel
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::AIExtractProductsResponse::Product::PricingModel
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PER_SEAT =
            T.let(
              :per_seat,
              ContextDev::Models::AIExtractProductsResponse::Product::PricingModel::TaggedSymbol
            )
          FLAT =
            T.let(
              :flat,
              ContextDev::Models::AIExtractProductsResponse::Product::PricingModel::TaggedSymbol
            )
          TIERED =
            T.let(
              :tiered,
              ContextDev::Models::AIExtractProductsResponse::Product::PricingModel::TaggedSymbol
            )
          FREEMIUM =
            T.let(
              :freemium,
              ContextDev::Models::AIExtractProductsResponse::Product::PricingModel::TaggedSymbol
            )
          CUSTOM =
            T.let(
              :custom,
              ContextDev::Models::AIExtractProductsResponse::Product::PricingModel::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::AIExtractProductsResponse::Product::PricingModel::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
