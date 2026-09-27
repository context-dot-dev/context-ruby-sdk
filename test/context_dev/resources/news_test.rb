# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::NewsTest < ContextDev::Test::ResourceTest
  def test_search_required_params
    skip("Mock server tests are disabled")

    response =
      @context_dev.news.search(search_by: {entity: {domain: "stripe.com", type: :domain}, type: :entity})

    assert_pattern do
      response => ContextDev::Models::NewsSearchResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::NewsSearchResponse::Data]),
        has_more: ContextDev::Internal::Type::Boolean,
        meta: ContextDev::Models::NewsSearchResponse::Meta,
        next_cursor: String | nil,
        request_id: String,
        key_metadata: ContextDev::Models::NewsSearchResponse::KeyMetadata | nil
      }
    end
  end
end
