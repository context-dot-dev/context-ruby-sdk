# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::BrandTest < ContextDev::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve(body: {domain: "stripe.com"})

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveResponse
    end

    assert_pattern do
      response => {
        brand: ContextDev::Models::BrandRetrieveResponse::Brand | nil,
        code: Integer | nil,
        key_metadata: ContextDev::Models::BrandRetrieveResponse::KeyMetadata | nil,
        status: String | nil
      }
    end
  end

  def test_retrieve_simplified_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve_simplified(domain: "domain")

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveSimplifiedResponse
    end

    assert_pattern do
      response => {
        brand: ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand | nil,
        code: Integer | nil,
        key_metadata: ContextDev::Models::BrandRetrieveSimplifiedResponse::KeyMetadata | nil,
        status: String | nil
      }
    end
  end
end
