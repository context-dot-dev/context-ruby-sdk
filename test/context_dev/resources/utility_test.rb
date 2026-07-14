# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::UtilityTest < ContextDev::Test::ResourceTest
  def test_prefetch_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.utility.prefetch(identifier: {domain: "xxx"}, type: :brand)

    assert_pattern do
      response => ContextDev::Models::UtilityPrefetchResponse
    end

    assert_pattern do
      response => {
        domain: String | nil,
        key_metadata: ContextDev::Models::UtilityPrefetchResponse::KeyMetadata | nil,
        message: String | nil,
        status: String | nil,
        type: ContextDev::Models::UtilityPrefetchResponse::Type | nil
      }
    end
  end
end
