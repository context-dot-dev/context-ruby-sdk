# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::ParseTest < ContextDev::Test::ResourceTest
  def test_handle_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.parse.handle(body: StringIO.new("Example data"))

    assert_pattern do
      response => ContextDev::Models::ParseHandleResponse
    end

    assert_pattern do
      response => {
        markdown: String,
        request_id: String,
        success: ContextDev::Models::ParseHandleResponse::Success,
        type: ContextDev::Models::ParseHandleResponse::Type,
        key_metadata: ContextDev::Models::ParseHandleResponse::KeyMetadata | nil
      }
    end
  end
end
