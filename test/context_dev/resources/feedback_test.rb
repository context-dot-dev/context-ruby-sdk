# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::FeedbackTest < ContextDev::Test::ResourceTest
  def test_submit_required_params
    skip("Mock server tests are disabled")

    response =
      @context_dev.feedback.submit(
        category: :bug,
        note: "Markdown drops the plan comparison table; expected all 4 rows."
      )

    assert_pattern do
      response => ContextDev::Models::FeedbackSubmitResponse
    end

    assert_pattern do
      response => {
        already_submitted: ContextDev::Internal::Type::Boolean,
        feedback_id: String,
        request_id: String,
        key_metadata: ContextDev::Models::FeedbackSubmitResponse::KeyMetadata | nil
      }
    end
  end
end
