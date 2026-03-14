# frozen_string_literal: true

require_relative "../test_helper"

class ContextDev::Test::Resources::BrandTest < ContextDev::Test::ResourceTest
  def test_retrieve_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve(domain: "domain")

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveResponse
    end

    assert_pattern do
      response => {
        brand: ContextDev::Models::BrandRetrieveResponse::Brand | nil,
        code: Integer | nil,
        status: String | nil
      }
    end
  end

  def test_ai_product_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.ai_product(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::BrandAIProductResponse
    end

    assert_pattern do
      response => {
        is_product_page: ContextDev::Internal::Type::Boolean | nil,
        platform: ContextDev::Models::BrandAIProductResponse::Platform | nil,
        product: ContextDev::Models::BrandAIProductResponse::Product | nil
      }
    end
  end

  def test_ai_products_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.ai_products(body: {domain: "domain"})

    assert_pattern do
      response => ContextDev::Models::BrandAIProductsResponse
    end

    assert_pattern do
      response => {
        products: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandAIProductsResponse::Product]) | nil
      }
    end
  end

  def test_ai_query_required_params
    skip("Mock server tests are disabled")

    response =
      @context_dev.brand.ai_query(
        data_to_extract: [
          {
            datapoint_description: "datapoint_description",
            datapoint_example: "datapoint_example",
            datapoint_name: "datapoint_name",
            datapoint_type: :text
          }
        ],
        domain: "domain"
      )

    assert_pattern do
      response => ContextDev::Models::BrandAIQueryResponse
    end

    assert_pattern do
      response => {
        data_extracted: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandAIQueryResponse::DataExtracted]) | nil,
        domain: String | nil,
        status: String | nil,
        urls_analyzed: ^(ContextDev::Internal::Type::ArrayOf[String]) | nil
      }
    end
  end

  def test_fonts_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.fonts(domain: "domain")

    assert_pattern do
      response => ContextDev::Models::BrandFontsResponse
    end

    assert_pattern do
      response => {
        code: Integer,
        domain: String,
        fonts: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandFontsResponse::Font]),
        status: String
      }
    end
  end

  def test_identify_from_transaction_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.identify_from_transaction(transaction_info: "transaction_info")

    assert_pattern do
      response => ContextDev::Models::BrandIdentifyFromTransactionResponse
    end

    assert_pattern do
      response => {
        brand: ContextDev::Models::BrandIdentifyFromTransactionResponse::Brand | nil,
        code: Integer | nil,
        status: String | nil
      }
    end
  end

  def test_prefetch_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.prefetch(domain: "domain")

    assert_pattern do
      response => ContextDev::Models::BrandPrefetchResponse
    end

    assert_pattern do
      response => {
        domain: String | nil,
        message: String | nil,
        status: String | nil
      }
    end
  end

  def test_prefetch_by_email_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.prefetch_by_email(email: "dev@stainless.com")

    assert_pattern do
      response => ContextDev::Models::BrandPrefetchByEmailResponse
    end

    assert_pattern do
      response => {
        domain: String | nil,
        message: String | nil,
        status: String | nil
      }
    end
  end

  def test_retrieve_by_email_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve_by_email(email: "dev@stainless.com")

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveByEmailResponse
    end

    assert_pattern do
      response => {
        brand: ContextDev::Models::BrandRetrieveByEmailResponse::Brand | nil,
        code: Integer | nil,
        status: String | nil
      }
    end
  end

  def test_retrieve_by_isin_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve_by_isin(isin: "SE60513A9993")

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveByIsinResponse
    end

    assert_pattern do
      response => {
        brand: ContextDev::Models::BrandRetrieveByIsinResponse::Brand | nil,
        code: Integer | nil,
        status: String | nil
      }
    end
  end

  def test_retrieve_by_name_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve_by_name(name: "xxx")

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveByNameResponse
    end

    assert_pattern do
      response => {
        brand: ContextDev::Models::BrandRetrieveByNameResponse::Brand | nil,
        code: Integer | nil,
        status: String | nil
      }
    end
  end

  def test_retrieve_by_ticker_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve_by_ticker(ticker: "ticker")

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveByTickerResponse
    end

    assert_pattern do
      response => {
        brand: ContextDev::Models::BrandRetrieveByTickerResponse::Brand | nil,
        code: Integer | nil,
        status: String | nil
      }
    end
  end

  def test_retrieve_naics_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve_naics(input: "input")

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveNaicsResponse
    end

    assert_pattern do
      response => {
        codes: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandRetrieveNaicsResponse::Code]) | nil,
        domain: String | nil,
        status: String | nil,
        type: String | nil
      }
    end
  end

  def test_retrieve_simplified_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.retrieve_simplified(domain: "domain")

    assert_pattern do
      response => ContextDev::Models::BrandRetrieveSimplifiedResponse
    end

    assert_pattern do
      response => {
        brand: ContextDev::Models::BrandRetrieveSimplifiedResponse::Brand | nil,
        code: Integer | nil,
        status: String | nil
      }
    end
  end

  def test_screenshot_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.screenshot(domain: "domain")

    assert_pattern do
      response => ContextDev::Models::BrandScreenshotResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        domain: String | nil,
        screenshot: String | nil,
        screenshot_type: ContextDev::Models::BrandScreenshotResponse::ScreenshotType | nil,
        status: String | nil
      }
    end
  end

  def test_styleguide
    skip("Mock server tests are disabled")

    response = @context_dev.brand.styleguide

    assert_pattern do
      response => ContextDev::Models::BrandStyleguideResponse
    end

    assert_pattern do
      response => {
        code: Integer | nil,
        domain: String | nil,
        status: String | nil,
        styleguide: ContextDev::Models::BrandStyleguideResponse::Styleguide | nil
      }
    end
  end

  def test_web_scrape_html_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.web_scrape_html(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::BrandWebScrapeHTMLResponse
    end

    assert_pattern do
      response => {
        html: String,
        success: ContextDev::Models::BrandWebScrapeHTMLResponse::Success,
        url: String
      }
    end
  end

  def test_web_scrape_images_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.web_scrape_images(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::BrandWebScrapeImagesResponse
    end

    assert_pattern do
      response => {
        images: ^(ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandWebScrapeImagesResponse::Image]),
        success: ContextDev::Models::BrandWebScrapeImagesResponse::Success,
        url: String
      }
    end
  end

  def test_web_scrape_md_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.web_scrape_md(url: "https://example.com")

    assert_pattern do
      response => ContextDev::Models::BrandWebScrapeMdResponse
    end

    assert_pattern do
      response => {
        markdown: String,
        success: ContextDev::Models::BrandWebScrapeMdResponse::Success,
        url: String
      }
    end
  end

  def test_web_scrape_sitemap_required_params
    skip("Mock server tests are disabled")

    response = @context_dev.brand.web_scrape_sitemap(domain: "domain")

    assert_pattern do
      response => ContextDev::Models::BrandWebScrapeSitemapResponse
    end

    assert_pattern do
      response => {
        domain: String,
        meta: ContextDev::Models::BrandWebScrapeSitemapResponse::Meta,
        success: ContextDev::Models::BrandWebScrapeSitemapResponse::Success,
        urls: ^(ContextDev::Internal::Type::ArrayOf[String])
      }
    end
  end
end
