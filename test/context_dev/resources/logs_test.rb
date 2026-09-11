# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::LogsTest < ContextDev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @context_dev.logs.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => ContextDev::Models::LogRetrieveResponse
    end

    assert_pattern do
      response => {
        data: ContextDev::Models::LogRetrieveResponse::Data,
        request_id: String,
        key_metadata: ContextDev::Models::LogRetrieveResponse::KeyMetadata | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @context_dev.logs.list

    assert_pattern do
      response => ContextDev::Models::LogListResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::LogListResponse::Data]),
        has_more: ContextDev::Internal::Type::Boolean,
        limit: Integer,
        page: Integer,
        request_id: String,
        key_metadata: ContextDev::Models::LogListResponse::KeyMetadata | nil
      }
    end
  end
end
