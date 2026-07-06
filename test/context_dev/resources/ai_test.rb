# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::AITest < ContextDev::Test::ResourceTest
  def test_extract_product_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.ai.extract_product(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::AIExtractProductResponse
    end

    assert_pattern do
      response => {
        is_product_page: ContextDev::Internal::Type::Boolean | nil,
        key_metadata: ContextDev::Models::AIExtractProductResponse::KeyMetadata | nil,
        platform: ContextDev::Models::AIExtractProductResponse::Platform | nil,
        product: ContextDev::Models::AIExtractProductResponse::Product | nil
      }
    end
  end

  def test_extract_products_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.ai.extract_products(body: {domain: "domain"})

    assert_pattern do
      response => ContextDev::Models::AIExtractProductsResponse
    end

    assert_pattern do
      response => {
        key_metadata: ContextDev::Models::AIExtractProductsResponse::KeyMetadata | nil,
        products: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::AIExtractProductsResponse::Product]) | nil
      }
    end
  end
end
