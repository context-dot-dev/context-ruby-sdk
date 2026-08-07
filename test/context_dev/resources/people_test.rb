# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::PeopleTest < ContextDev::Test::ResourceTest
  def test_enrich
    skip("Mock server tests are disabled")

    response = @context_dev.people.enrich

    assert_pattern do
      response => ContextDev::Models::PersonEnrichResponse
    end

    assert_pattern do
      response => {
        match: ContextDev::Models::PersonEnrichResponse::Match,
        key_metadata: ContextDev::Models::PersonEnrichResponse::KeyMetadata | nil
      }
    end
  end
end
