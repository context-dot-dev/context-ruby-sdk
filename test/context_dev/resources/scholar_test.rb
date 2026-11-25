# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::ScholarTest < ContextDev::Test::ResourceTest
  def test_search_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.scholar.search(query: "CRISPR off-target effects in human cells")

    assert_pattern do
      response => ContextDev::Models::ScholarSearchResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::ScholarSearchResponse::Data]),
        has_more: ContextDev::Internal::Type::Boolean,
        meta: ContextDev::Models::ScholarSearchResponse::Meta,
        next_cursor: String | nil,
        request_id: String,
        key_metadata: ContextDev::Models::ScholarSearchResponse::KeyMetadata | nil
      }
    end
  end
end
