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

  def test_extract_required_params
    skip("Mock server tests are disabled")

    response =
      @context_dev.web.extract(
        schema: {type: "bar", properties: "bar", required: "bar", additionalProperties: "bar"},
        url: "https://example.com"
      )

    assert_pattern do
      response => ContextDev::Models::WebExtractResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::WebExtractResponse::CacheMetadata,
        data: ^(ContextDev::Internal::Type::HashOf[ContextDev::Internal::Type::Unknown]),
        metadata: ContextDev::Models::WebExtractResponse::Metadata,
        request_id: String,
        status: String,
        url: String,
        urls_analyzed: ^(ContextDev::Internal::Type::ArrayOf[String]),
        key_metadata: ContextDev::Models::WebExtractResponse::KeyMetadata | nil,
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

  def test_extract_fonts
    skip("Mock server tests are disabled")

    response = @context_dev.web.extract_fonts

    assert_pattern do
      response => ContextDev::Models::WebExtractFontsResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::WebExtractFontsResponse::CacheMetadata,
        code: Integer,
        domain: String,
        fonts: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebExtractFontsResponse::Font]),
        request_id: String,
        status: String,
        final_dom_state: ContextDev::Models::WebExtractFontsResponse::FinalDomState | nil,
        font_links: ^(ContextDev::Internal::Type::HashOf[ContextDev::Models::WebExtractFontsResponse::FontLink]) | nil,
        key_metadata: ContextDev::Models::WebExtractFontsResponse::KeyMetadata | nil
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
        html: ContextDev::Models::WebScrapeResponse::HTML,
        images: ContextDev::Models::WebScrapeResponse::Images,
        markdown: ContextDev::Models::WebScrapeResponse::Markdown,
        metadata: ContextDev::Models::WebScrapeResponse::Metadata,
        parsed: ContextDev::Models::WebScrapeResponse::Parsed,
        request_id: String,
        screenshot: ContextDev::Models::WebScrapeResponse::Screenshot,
        url: String,
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

  def test_web_scrape_bytes_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.web_scrape_bytes(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::WebWebScrapeBytesResponse
    end

    assert_pattern do
      response => {
        bytes: String,
        cache_metadata: ContextDev::Models::WebWebScrapeBytesResponse::CacheMetadata,
        content_length: Integer,
        content_type: String,
        encoding: ContextDev::Models::WebWebScrapeBytesResponse::Encoding,
        final_url: String,
        request_id: String,
        status_code: Integer,
        success: ContextDev::Models::WebWebScrapeBytesResponse::Success,
        url: String,
        key_metadata: ContextDev::Models::WebWebScrapeBytesResponse::KeyMetadata | nil
      }
    end
  end

  def test_web_scrape_html_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.web_scrape_html(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::WebWebScrapeHTMLResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::WebWebScrapeHTMLResponse::CacheMetadata,
        final_dom_state: ContextDev::Models::WebWebScrapeHTMLResponse::FinalDomState,
        html: String,
        metadata: ContextDev::Models::WebWebScrapeHTMLResponse::Metadata,
        request_id: String,
        success: ContextDev::Models::WebWebScrapeHTMLResponse::Success,
        type: ContextDev::Models::WebWebScrapeHTMLResponse::Type,
        url: String,
        actions_applied: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebScrapeHTMLResponse::ActionsApplied]) | nil,
        actions_html_stale: ContextDev::Internal::Type::Boolean | nil,
        extracted: ^(ContextDev::Internal::Type::HashOf[union: ContextDev::Models::WebWebScrapeHTMLResponse::Extracted, nil?: true]) | nil,
        key_metadata: ContextDev::Models::WebWebScrapeHTMLResponse::KeyMetadata | nil
      }
    end
  end

  def test_web_scrape_images_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.web_scrape_images(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::WebWebScrapeImagesResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::WebWebScrapeImagesResponse::CacheMetadata,
        images: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebScrapeImagesResponse::Image]),
        request_id: String,
        success: ContextDev::Models::WebWebScrapeImagesResponse::Success,
        url: String,
        actions_applied: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebScrapeImagesResponse::ActionsApplied]) | nil,
        final_dom_state: ContextDev::Models::WebWebScrapeImagesResponse::FinalDomState | nil,
        key_metadata: ContextDev::Models::WebWebScrapeImagesResponse::KeyMetadata | nil,
        partial: ContextDev::Internal::Type::Boolean | nil
      }
    end
  end

  def test_web_scrape_md_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.web_scrape_md(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::WebWebScrapeMdResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::WebWebScrapeMdResponse::CacheMetadata,
        content_length: Integer,
        final_dom_state: ContextDev::Models::WebWebScrapeMdResponse::FinalDomState,
        markdown: String,
        metadata: ContextDev::Models::WebWebScrapeMdResponse::Metadata,
        request_id: String,
        success: ContextDev::Models::WebWebScrapeMdResponse::Success,
        url: String,
        actions_applied: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::WebWebScrapeMdResponse::ActionsApplied]) | nil,
        actions_html_stale: ContextDev::Internal::Type::Boolean | nil,
        html: String | nil,
        key_metadata: ContextDev::Models::WebWebScrapeMdResponse::KeyMetadata | nil
      }
    end
  end

  def test_web_scrape_screenshot_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.web_scrape_screenshot(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::WebWebScrapeScreenshotResponse
    end

    assert_pattern do
      response => {
        cache_metadata: ContextDev::Models::WebWebScrapeScreenshotResponse::CacheMetadata,
        height: Integer,
        request_id: String,
        screenshot: String,
        url: String,
        width: Integer,
        final_dom_state: ContextDev::Models::WebWebScrapeScreenshotResponse::FinalDomState | nil,
        key_metadata: ContextDev::Models::WebWebScrapeScreenshotResponse::KeyMetadata | nil
      }
    end
  end

  def test_web_scrape_sitemap_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.web.web_scrape_sitemap(domain: "xxx")

    assert_pattern do
      response => ContextDev::Models::WebWebScrapeSitemapResponse
    end

    assert_pattern do
      response => {
        domain: String,
        meta: ContextDev::Models::WebWebScrapeSitemapResponse::Meta,
        request_id: String,
        success: ContextDev::Models::WebWebScrapeSitemapResponse::Success,
        urls: ^(ContextDev::Internal::Type::ArrayOf[String]),
        key_metadata: ContextDev::Models::WebWebScrapeSitemapResponse::KeyMetadata | nil,
        partial: ContextDev::Internal::Type::Boolean | nil
      }
    end
  end
end
