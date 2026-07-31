# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::BatchTest < ContextDev::Test::ResourceTest
  def test_retrieve
    skip("Mock server tests are disabled")

    response = @context_dev.batch.retrieve("batch_9f2c8a")

    assert_pattern do
      response => ContextDev::Models::BatchRetrieveResponse
    end

    assert_pattern do
      response => {
        id: String,
        crawl: ContextDev::CrawlControls | nil,
        credits: ContextDev::Models::BatchRetrieveResponse::Credits,
        failure: ContextDev::Failure | nil,
        format_: ContextDev::Models::BatchRetrieveResponse::Format,
        input: ContextDev::Intake,
        invalid_urls: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchRetrieveResponse::InvalidURL]),
        mode: ContextDev::Models::BatchRetrieveResponse::Mode,
        page_errors: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::PageErrorCount]),
        progress: ContextDev::Models::BatchRetrieveResponse::Progress,
        results: ContextDev::Models::BatchRetrieveResponse::Results | nil,
        status: ContextDev::Models::BatchRetrieveResponse::Status,
        tags: ^(ContextDev::Internal::Type::ArrayOf[String]),
        timing: ContextDev::Models::BatchRetrieveResponse::Timing,
        key_metadata: ContextDev::Models::BatchRetrieveResponse::KeyMetadata | nil
      }
    end
  end

  def test_list
    skip("Mock server tests are disabled")

    response = @context_dev.batch.list

    assert_pattern do
      response => ContextDev::Models::BatchListResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BatchListResponse::Data]) | nil,
        has_more: ContextDev::Internal::Type::Boolean | nil,
        key_metadata: ContextDev::Models::BatchListResponse::KeyMetadata | nil,
        next_cursor: String | nil
      }
    end
  end

  def test_cancel
    skip("Mock server tests are disabled")

    response = @context_dev.batch.cancel("batch_9f2c8a")

    assert_pattern do
      response => ContextDev::Models::BatchCancelResponse
    end

    assert_pattern do
      response => {
        id: String,
        crawl: ContextDev::CrawlControls | nil,
        credits: ContextDev::Models::BatchCancelResponse::Credits,
        failure: ContextDev::Failure | nil,
        format_: ContextDev::Models::BatchCancelResponse::Format,
        input: ContextDev::Intake,
        mode: ContextDev::Models::BatchCancelResponse::Mode,
        page_errors: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::PageErrorCount]),
        progress: ContextDev::Models::BatchCancelResponse::Progress,
        results: ContextDev::Models::BatchCancelResponse::Results | nil,
        status: ContextDev::Models::BatchCancelResponse::Status,
        tags: ^(ContextDev::Internal::Type::ArrayOf[String]),
        timing: ContextDev::Models::BatchCancelResponse::Timing,
        key_metadata: ContextDev::Models::BatchCancelResponse::KeyMetadata | nil
      }
    end
  end

  def test_get_results
    skip("Mock server tests are disabled")

    response = @context_dev.batch.get_results("batch_9f2c8a")

    assert_pattern do
      response => ContextDev::Models::BatchGetResultsResponse
    end

    assert_pattern do
      response => {
        data: ^(ContextDev::Internal::Type::ArrayOf[union: ContextDev::Models::BatchGetResultsResponse::Data]) | nil,
        has_more: ContextDev::Internal::Type::Boolean | nil,
        key_metadata: ContextDev::Models::BatchGetResultsResponse::KeyMetadata | nil,
        next_cursor: String | nil
      }
    end
  end

  def test_submit_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.batch.submit(identifiers: {})

    assert_pattern do
      response => ContextDev::Models::BatchSubmitResponse
    end

    assert_pattern do
      response => {
        code: ContextDev::Models::BatchSubmitResponse::Code,
        metadata: ContextDev::Models::BatchSubmitResponse::Metadata,
        person: ContextDev::Models::BatchSubmitResponse::Person,
        status: ContextDev::Models::BatchSubmitResponse::Status,
        key_metadata: ContextDev::Models::BatchSubmitResponse::KeyMetadata | nil
      }
    end
  end
end
