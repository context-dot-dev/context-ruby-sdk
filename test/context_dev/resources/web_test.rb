# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::WebTest < ContextDev::Test::ResourceTest
  def test_answers_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.answers(task: "Find the pricing page URL and plan names for context.dev.")

    assert_pattern do
      response => ContextDev::Models::WebAnswersResponse
    end

    assert_pattern do
      response => {
        json_content: ^(ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]),
        sources: ^(ContextDev::Internal::Type::ArrayOf[String]),
        key_metadata: ContextDev::Models::WebAnswersResponse::KeyMetadata | nil,
        partial: ContextDev::Internal::Type::Boolean | nil
      }
    end
  end

  def test_extract_competitors_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.extract_competitors(domain: "xxx")

    assert_pattern do
      response => ContextDev::Models::WebExtractCompetitorsResponse
    end

    assert_pattern do
      response => {
        competitors: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebExtractCompetitorsResponse::Competitor]),
        domain: String,
        request_id: String,
        status: ContextDev::Models::WebExtractCompetitorsResponse::Status,
        target: ContextDev::Models::WebExtractCompetitorsResponse::Target,
        key_metadata: ContextDev::Models::WebExtractCompetitorsResponse::KeyMetadata | nil,
        partial: ContextDev::Internal::Type::Boolean | nil
      }
    end
  end

  def test_extract_styleguide
    skip("Mock server tests are disabled")

    response = @context_dev.web.extract_styleguide

    assert_pattern do
      response => ContextDev::Models::WebExtractStyleguideResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::WebExtractStyleguideResponse::CacheMetadata,
        request_id: String,
        code: Integer | nil,
        domain: String | nil,
        final_dom_state: ContextDev::Models::WebExtractStyleguideResponse::FinalDomState | nil,
        key_metadata: ContextDev::Models::WebExtractStyleguideResponse::KeyMetadata | nil,
        status: String | nil,
        styleguide: ContextDev::Models::WebExtractStyleguideResponse::Styleguide | nil
      }
    end
  end

  def test_map_urls_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.map_urls(domain: "xxx")

    assert_pattern do
      response => ContextDev::Models::WebMapURLsResponse
    end

    assert_pattern do
      response => {
        domain: String,
        request_id: String,
        success: ContextDev::Models::WebMapURLsResponse::Success,
        urls: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebMapURLsResponse::URL]),
        key_metadata: ContextDev::Models::WebMapURLsResponse::KeyMetadata | nil,
        partial: ContextDev::Internal::Type::Boolean | nil
      }
    end
  end

  def test_scrape_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.scrape(formats: {}, url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::WebScrapeResponse
    end

    assert_pattern do
      response => {
        bytes: ContextDev::Models::WebScrapeResponse::Bytes,
        cache_metadata: ContextDev::Models::WebScrapeResponse::CacheMetadata,
        highlights: ContextDev::Models::WebScrapeResponse::Highlights,
        html: ContextDev::Models::WebScrapeResponse::HTML,
        images: ContextDev::Models::WebScrapeResponse::Images,
        json: ContextDev::Models::WebScrapeResponse::Json,
        markdown: ContextDev::Models::WebScrapeResponse::Markdown,
        metadata: ContextDev::Models::WebScrapeResponse::Metadata,
        parsed: ContextDev::Models::WebScrapeResponse::Parsed,
        request_id: String,
        screenshot: ContextDev::Models::WebScrapeResponse::Screenshot,
        url: String,
        is_partial: ContextDev::Models::WebScrapeResponse::IsPartial | nil,
        key_metadata: ContextDev::Models::WebScrapeResponse::KeyMetadata | nil
      }
    end
  end

  def test_screenshot
    skip("Mock server tests are disabled")

    response = @context_dev.web.screenshot

    assert_pattern do
      response => ContextDev::Models::WebScreenshotResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::WebScreenshotResponse::CacheMetadata,
        request_id: String,
        code: Integer | nil,
        domain: String | nil,
        final_dom_state: ContextDev::Models::WebScreenshotResponse::FinalDomState | nil,
        height: Integer | nil,
        key_metadata: ContextDev::Models::WebScreenshotResponse::KeyMetadata | nil,
        screenshot: String | nil,
        screenshot_type: ContextDev::Models::WebScreenshotResponse::ScreenshotType | nil,
        status: String | nil,
        width: Integer | nil
      }
    end
  end

  def test_search_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.search(query: "x")

    assert_pattern do
      response => ContextDev::Models::WebSearchResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::WebSearchResponse::CacheMetadata,
        query: String,
        request_id: String,
        results: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebSearchResponse::Result]),
        key_metadata: ContextDev::Models::WebSearchResponse::KeyMetadata | nil,
        partial: ContextDev::Internal::Type::Boolean | nil
      }
    end
  end

  def test_web_crawl_md_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.web_crawl_md(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::WebWebCrawlMdResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::WebWebCrawlMdResponse::CacheMetadata,
        metadata: ContextDev::Models::WebWebCrawlMdResponse::Metadata,
        request_id: String,
        results: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebCrawlMdResponse::Result]),
        key_metadata: ContextDev::Models::WebWebCrawlMdResponse::KeyMetadata | nil,
        partial: ContextDev::Internal::Type::Boolean | nil
      }
    end
  end
end
