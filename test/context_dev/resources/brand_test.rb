# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::BrandTest < ContextDev::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve(body: {domain: "stripe.com", type: :by_domain})

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::BrandRetrieveResponse::CacheMetadata,
        brand: ContextDev::Models::BrandRetrieveResponse::Brand | nil,
        code: Integer | nil,
        key_metadata: ContextDev::Models::BrandRetrieveResponse::KeyMetadata | nil,
        status: String | nil
      }
    end
  end

  def test_retrieve_simplified_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve_simplified(domain: "xxx")

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveSimplifiedResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::BrandRetrieveSimplifiedResponse::CacheMetadata,
        brand: ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand | nil,
        code: Integer | nil,
        key_metadata: ContextDev::Models::BrandRetrieveSimplifiedResponse::KeyMetadata | nil,
        status: String | nil
      }
    end
  end

  def test_search_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.search(query: "x")

    assert_pattern do
      response => ContextDev::Models::BrandSearchResponse
    end

    assert_pattern do
      response => {
        results: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandSearchResponse::Result]),
        key_metadata: ContextDev::Models::BrandSearchResponse::KeyMetadata | nil
      }
    end
  end
end
