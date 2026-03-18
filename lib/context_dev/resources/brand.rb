# frozen_string_literal: true

module ContextDev
  module Resources
    class Brand
      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandRetrieveParams} for more details.
      #
      # Retrieve logos, backdrops, colors, industry, description, and more from any
      # domain
      #
      # @overload retrieve(domain:, force_language: nil, max_speed: nil, timeout_ms: nil, request_options: {})
      #
      # @param domain [String] Domain name to retrieve brand data for (e.g., 'example.com', 'google.com'). Cann
      #
      # @param force_language [Symbol, ContextDev::Models::BrandRetrieveParams::ForceLanguage] Optional parameter to force the language of the retrieved brand data. Works with
      #
      # @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandRetrieveResponse]
      #
      # @see ContextDev::Models::BrandRetrieveParams
      def retrieve(params)
        parsed, options = ContextDev::BrandRetrieveParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/retrieve",
          query: query.transform_keys(max_speed: "maxSpeed", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::BrandRetrieveResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandAIProductParams} for more details.
      #
      # Beta feature: Given a single URL, determines if it is a product detail page,
      # classifies the platform/product type, and extracts the product information.
      # Supports Amazon, TikTok Shop, Etsy, and generic ecommerce sites.
      #
      # @overload ai_product(url:, timeout_ms: nil, request_options: {})
      #
      # @param url [String] The product page URL to extract product data from.
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. Maximum allowed value is 30000
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandAIProductResponse]
      #
      # @see ContextDev::Models::BrandAIProductParams
      def ai_product(params)
        parsed, options = ContextDev::BrandAIProductParams.dump_request(params)
        @client.request(
          method: :post,
          path: "brand/ai/product",
          body: parsed,
          model: ContextDev::Models::BrandAIProductResponse,
          options: options
        )
      end

      # Beta feature: Extract product information from a brand's website. Brand.dev will
      # analyze the website and return a list of products with details such as name,
      # description, image, pricing, features, and more.
      #
      # @overload ai_products(body:, request_options: {})
      #
      # @param body [ContextDev::Models::BrandAIProductsParams::Body::ByDomain, ContextDev::Models::BrandAIProductsParams::Body::ByDirectURL]
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandAIProductsResponse]
      #
      # @see ContextDev::Models::BrandAIProductsParams
      def ai_products(params)
        parsed, options = ContextDev::BrandAIProductsParams.dump_request(params)
        @client.request(
          method: :post,
          path: "brand/ai/products",
          body: parsed[:body],
          model: ContextDev::Models::BrandAIProductsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandAIQueryParams} for more details.
      #
      # Use AI to extract specific data points from a brand's website. The AI will crawl
      # the website and extract the requested information based on the provided data
      # points.
      #
      # @overload ai_query(data_to_extract:, domain:, specific_pages: nil, timeout_ms: nil, request_options: {})
      #
      # @param data_to_extract [Array<ContextDev::Models::BrandAIQueryParams::DataToExtract>] Array of data points to extract from the website
      #
      # @param domain [String] The domain name to analyze
      #
      # @param specific_pages [ContextDev::Models::BrandAIQueryParams::SpecificPages] Optional object specifying which pages to analyze
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandAIQueryResponse]
      #
      # @see ContextDev::Models::BrandAIQueryParams
      def ai_query(params)
        parsed, options = ContextDev::BrandAIQueryParams.dump_request(params)
        @client.request(
          method: :post,
          path: "brand/ai/query",
          body: parsed,
          model: ContextDev::Models::BrandAIQueryResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandFontsParams} for more details.
      #
      # Extract font information from a brand's website including font families, usage
      # statistics, fallbacks, and element/word counts.
      #
      # @overload fonts(domain:, timeout_ms: nil, request_options: {})
      #
      # @param domain [String] Domain name to extract fonts from (e.g., 'example.com', 'google.com'). The domai
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandFontsResponse]
      #
      # @see ContextDev::Models::BrandFontsParams
      def fonts(params)
        parsed, options = ContextDev::BrandFontsParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/fonts",
          query: query.transform_keys(timeout_ms: "timeoutMS"),
          model: ContextDev::Models::BrandFontsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandIdentifyFromTransactionParams} for more details.
      #
      # Endpoint specially designed for platforms that want to identify transaction data
      # by the transaction title.
      #
      # @overload identify_from_transaction(transaction_info:, city: nil, country_gl: nil, force_language: nil, high_confidence_only: nil, max_speed: nil, mcc: nil, phone: nil, timeout_ms: nil, request_options: {})
      #
      # @param transaction_info [String] Transaction information to identify the brand
      #
      # @param city [String] Optional city name to prioritize when searching for the brand.
      #
      # @param country_gl [Symbol, ContextDev::Models::BrandIdentifyFromTransactionParams::CountryGl] Optional country code (GL parameter) to specify the country. This affects the ge
      #
      # @param force_language [Symbol, ContextDev::Models::BrandIdentifyFromTransactionParams::ForceLanguage] Optional parameter to force the language of the retrieved brand data.
      #
      # @param high_confidence_only [Boolean] When set to true, the API will perform an additional verification steps to ensur
      #
      # @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
      #
      # @param mcc [String] Optional Merchant Category Code (MCC) to help identify the business category/ind
      #
      # @param phone [Float] Optional phone number from the transaction to help verify brand match.
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandIdentifyFromTransactionResponse]
      #
      # @see ContextDev::Models::BrandIdentifyFromTransactionParams
      def identify_from_transaction(params)
        parsed, options = ContextDev::BrandIdentifyFromTransactionParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/transaction_identifier",
          query: query.transform_keys(max_speed: "maxSpeed", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::BrandIdentifyFromTransactionResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandPrefetchParams} for more details.
      #
      # Signal that you may fetch brand data for a particular domain soon to improve
      # latency. This endpoint does not charge credits and is available for paid
      # customers to optimize future requests. [You must be on a paid plan to use this
      # endpoint]
      #
      # @overload prefetch(domain:, timeout_ms: nil, request_options: {})
      #
      # @param domain [String] Domain name to prefetch brand data for
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandPrefetchResponse]
      #
      # @see ContextDev::Models::BrandPrefetchParams
      def prefetch(params)
        parsed, options = ContextDev::BrandPrefetchParams.dump_request(params)
        @client.request(
          method: :post,
          path: "brand/prefetch",
          body: parsed,
          model: ContextDev::Models::BrandPrefetchResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandPrefetchByEmailParams} for more details.
      #
      # Signal that you may fetch brand data for a particular domain soon to improve
      # latency. This endpoint accepts an email address, extracts the domain from it,
      # validates that it's not a disposable or free email provider, and queues the
      # domain for prefetching. This endpoint does not charge credits and is available
      # for paid customers to optimize future requests. [You must be on a paid plan to
      # use this endpoint]
      #
      # @overload prefetch_by_email(email:, timeout_ms: nil, request_options: {})
      #
      # @param email [String] Email address to prefetch brand data for. The domain will be extracted from the
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandPrefetchByEmailResponse]
      #
      # @see ContextDev::Models::BrandPrefetchByEmailParams
      def prefetch_by_email(params)
        parsed, options = ContextDev::BrandPrefetchByEmailParams.dump_request(params)
        @client.request(
          method: :post,
          path: "brand/prefetch-by-email",
          body: parsed,
          model: ContextDev::Models::BrandPrefetchByEmailResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandRetrieveByEmailParams} for more details.
      #
      # Retrieve brand information using an email address while detecting disposable and
      # free email addresses. This endpoint extracts the domain from the email address
      # and returns brand data for that domain. Disposable and free email addresses
      # (like gmail.com, yahoo.com) will throw a 422 error.
      #
      # @overload retrieve_by_email(email:, force_language: nil, max_speed: nil, timeout_ms: nil, request_options: {})
      #
      # @param email [String] Email address to retrieve brand data for (e.g., 'contact@example.com'). The doma
      #
      # @param force_language [Symbol, ContextDev::Models::BrandRetrieveByEmailParams::ForceLanguage] Optional parameter to force the language of the retrieved brand data.
      #
      # @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandRetrieveByEmailResponse]
      #
      # @see ContextDev::Models::BrandRetrieveByEmailParams
      def retrieve_by_email(params)
        parsed, options = ContextDev::BrandRetrieveByEmailParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/retrieve-by-email",
          query: query.transform_keys(max_speed: "maxSpeed", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::BrandRetrieveByEmailResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandRetrieveByIsinParams} for more details.
      #
      # Retrieve brand information using an ISIN (International Securities
      # Identification Number). This endpoint looks up the company associated with the
      # ISIN and returns its brand data.
      #
      # @overload retrieve_by_isin(isin:, force_language: nil, max_speed: nil, timeout_ms: nil, request_options: {})
      #
      # @param isin [String] ISIN (International Securities Identification Number) to retrieve brand data for
      #
      # @param force_language [Symbol, ContextDev::Models::BrandRetrieveByIsinParams::ForceLanguage] Optional parameter to force the language of the retrieved brand data.
      #
      # @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandRetrieveByIsinResponse]
      #
      # @see ContextDev::Models::BrandRetrieveByIsinParams
      def retrieve_by_isin(params)
        parsed, options = ContextDev::BrandRetrieveByIsinParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/retrieve-by-isin",
          query: query.transform_keys(max_speed: "maxSpeed", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::BrandRetrieveByIsinResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandRetrieveByNameParams} for more details.
      #
      # Retrieve brand information using a company name. This endpoint searches for the
      # company by name and returns its brand data.
      #
      # @overload retrieve_by_name(name:, country_gl: nil, force_language: nil, max_speed: nil, timeout_ms: nil, request_options: {})
      #
      # @param name [String] Company name to retrieve brand data for (e.g., 'Apple Inc', 'Microsoft Corporati
      #
      # @param country_gl [Symbol, ContextDev::Models::BrandRetrieveByNameParams::CountryGl] Optional country code (GL parameter) to specify the country. This affects the ge
      #
      # @param force_language [Symbol, ContextDev::Models::BrandRetrieveByNameParams::ForceLanguage] Optional parameter to force the language of the retrieved brand data.
      #
      # @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandRetrieveByNameResponse]
      #
      # @see ContextDev::Models::BrandRetrieveByNameParams
      def retrieve_by_name(params)
        parsed, options = ContextDev::BrandRetrieveByNameParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/retrieve-by-name",
          query: query.transform_keys(max_speed: "maxSpeed", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::BrandRetrieveByNameResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandRetrieveByTickerParams} for more details.
      #
      # Retrieve brand information using a stock ticker symbol. This endpoint looks up
      # the company associated with the ticker and returns its brand data.
      #
      # @overload retrieve_by_ticker(ticker:, force_language: nil, max_speed: nil, ticker_exchange: nil, timeout_ms: nil, request_options: {})
      #
      # @param ticker [String] Stock ticker symbol to retrieve brand data for (e.g., 'AAPL', 'GOOGL', 'BRK.A').
      #
      # @param force_language [Symbol, ContextDev::Models::BrandRetrieveByTickerParams::ForceLanguage] Optional parameter to force the language of the retrieved brand data.
      #
      # @param max_speed [Boolean] Optional parameter to optimize the API call for maximum speed. When set to true,
      #
      # @param ticker_exchange [Symbol, ContextDev::Models::BrandRetrieveByTickerParams::TickerExchange] Optional stock exchange for the ticker. Defaults to NASDAQ if not specified.
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandRetrieveByTickerResponse]
      #
      # @see ContextDev::Models::BrandRetrieveByTickerParams
      def retrieve_by_ticker(params)
        parsed, options = ContextDev::BrandRetrieveByTickerParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/retrieve-by-ticker",
          query: query.transform_keys(max_speed: "maxSpeed", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::BrandRetrieveByTickerResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandRetrieveNaicsParams} for more details.
      #
      # Endpoint to classify any brand into a 2022 NAICS code.
      #
      # @overload retrieve_naics(input:, max_results: nil, min_results: nil, timeout_ms: nil, request_options: {})
      #
      # @param input [String] Brand domain or title to retrieve NAICS code for. If a valid domain is provided
      #
      # @param max_results [Integer] Maximum number of NAICS codes to return. Must be between 1 and 10. Defaults to 5
      #
      # @param min_results [Integer] Minimum number of NAICS codes to return. Must be at least 1. Defaults to 1.
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandRetrieveNaicsResponse]
      #
      # @see ContextDev::Models::BrandRetrieveNaicsParams
      def retrieve_naics(params)
        parsed, options = ContextDev::BrandRetrieveNaicsParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/naics",
          query: query.transform_keys(
            max_results: "maxResults",
            min_results: "minResults",
            timeout_ms: "timeoutMS"
          ),
          model: ContextDev::Models::BrandRetrieveNaicsResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandRetrieveSimplifiedParams} for more details.
      #
      # Returns a simplified version of brand data containing only essential
      # information: domain, title, colors, logos, and backdrops. This endpoint is
      # optimized for faster responses and reduced data transfer.
      #
      # @overload retrieve_simplified(domain:, timeout_ms: nil, request_options: {})
      #
      # @param domain [String] Domain name to retrieve simplified brand data for
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandRetrieveSimplifiedResponse]
      #
      # @see ContextDev::Models::BrandRetrieveSimplifiedParams
      def retrieve_simplified(params)
        parsed, options = ContextDev::BrandRetrieveSimplifiedParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/retrieve-simplified",
          query: query.transform_keys(timeout_ms: "timeoutMS"),
          model: ContextDev::Models::BrandRetrieveSimplifiedResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandScreenshotParams} for more details.
      #
      # Capture a screenshot of a website. Supports both viewport (standard browser
      # view) and full-page screenshots. Can also screenshot specific page types (login,
      # pricing, etc.) by using heuristics to find the appropriate URL. Returns a URL to
      # the uploaded screenshot image hosted on our CDN.
      #
      # @overload screenshot(domain:, full_screenshot: nil, page: nil, prioritize: nil, request_options: {})
      #
      # @param domain [String] Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The domai
      #
      # @param full_screenshot [Symbol, ContextDev::Models::BrandScreenshotParams::FullScreenshot] Optional parameter to determine screenshot type. If 'true', takes a full page sc
      #
      # @param page [Symbol, ContextDev::Models::BrandScreenshotParams::Page] Optional parameter to specify which page type to screenshot. If provided, the sy
      #
      # @param prioritize [Symbol, ContextDev::Models::BrandScreenshotParams::Prioritize] Optional parameter to prioritize screenshot capture. If 'speed', optimizes for f
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandScreenshotResponse]
      #
      # @see ContextDev::Models::BrandScreenshotParams
      def screenshot(params)
        parsed, options = ContextDev::BrandScreenshotParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/screenshot",
          query: query.transform_keys(full_screenshot: "fullScreenshot"),
          model: ContextDev::Models::BrandScreenshotResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandStyleguideParams} for more details.
      #
      # Automatically extract comprehensive design system information from a brand's
      # website including colors, typography, spacing, shadows, and UI components.
      # Either 'domain' or 'directUrl' must be provided as a query parameter, but not
      # both.
      #
      # @overload styleguide(direct_url: nil, domain: nil, prioritize: nil, timeout_ms: nil, request_options: {})
      #
      # @param direct_url [String] A specific URL to fetch the styleguide from directly, bypassing domain resolutio
      #
      # @param domain [String] Domain name to extract styleguide from (e.g., 'example.com', 'google.com'). The
      #
      # @param prioritize [Symbol, ContextDev::Models::BrandStyleguideParams::Prioritize] Optional parameter to prioritize screenshot capture for styleguide extraction. I
      #
      # @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandStyleguideResponse]
      #
      # @see ContextDev::Models::BrandStyleguideParams
      def styleguide(params = {})
        parsed, options = ContextDev::BrandStyleguideParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "brand/styleguide",
          query: query.transform_keys(direct_url: "directUrl", timeout_ms: "timeoutMS"),
          model: ContextDev::Models::BrandStyleguideResponse,
          options: options
        )
      end

      # Scrapes the given URL and returns the raw HTML content of the page. Uses
      # automatic proxy escalation to handle blocked sites.
      #
      # @overload web_scrape_html(url:, request_options: {})
      #
      # @param url [String] Full URL to scrape (must include http:// or https:// protocol)
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandWebScrapeHTMLResponse]
      #
      # @see ContextDev::Models::BrandWebScrapeHTMLParams
      def web_scrape_html(params)
        parsed, options = ContextDev::BrandWebScrapeHTMLParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/scrape/html",
          query: query,
          model: ContextDev::Models::BrandWebScrapeHTMLResponse,
          options: options
        )
      end

      # Scrapes all images from the given URL. Extracts images from img, svg,
      # picture/source, link, and video elements including inline SVGs, base64 data
      # URIs, and standard URLs.
      #
      # @overload web_scrape_images(url:, request_options: {})
      #
      # @param url [String] Full URL to scrape images from (must include http:// or https:// protocol)
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandWebScrapeImagesResponse]
      #
      # @see ContextDev::Models::BrandWebScrapeImagesParams
      def web_scrape_images(params)
        parsed, options = ContextDev::BrandWebScrapeImagesParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/scrape/images",
          query: query,
          model: ContextDev::Models::BrandWebScrapeImagesResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandWebScrapeMdParams} for more details.
      #
      # Scrapes the given URL, converts the HTML content to GitHub Flavored Markdown
      # (GFM), and returns the result. Uses automatic proxy escalation to handle blocked
      # sites.
      #
      # @overload web_scrape_md(url:, include_images: nil, include_links: nil, shorten_base64_images: nil, request_options: {})
      #
      # @param url [String] Full URL to scrape and convert to markdown (must include http:// or https:// pro
      #
      # @param include_images [Boolean] Include image references in Markdown output
      #
      # @param include_links [Boolean] Preserve hyperlinks in Markdown output
      #
      # @param shorten_base64_images [Boolean] Shorten base64-encoded image data in the Markdown output
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandWebScrapeMdResponse]
      #
      # @see ContextDev::Models::BrandWebScrapeMdParams
      def web_scrape_md(params)
        parsed, options = ContextDev::BrandWebScrapeMdParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/scrape/markdown",
          query: query.transform_keys(
            include_images: "includeImages",
            include_links: "includeLinks",
            shorten_base64_images: "shortenBase64Images"
          ),
          model: ContextDev::Models::BrandWebScrapeMdResponse,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {ContextDev::Models::BrandWebScrapeSitemapParams} for more details.
      #
      # Crawls the sitemap of the given domain and returns all discovered page URLs.
      # Supports sitemap index files (recursive), parallel fetching with concurrency
      # control, deduplication, and filters out non-page resources (images, PDFs, etc.).
      #
      # @overload web_scrape_sitemap(domain:, request_options: {})
      #
      # @param domain [String] Domain name to crawl sitemaps for (e.g., 'example.com'). The domain will be auto
      #
      # @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [ContextDev::Models::BrandWebScrapeSitemapResponse]
      #
      # @see ContextDev::Models::BrandWebScrapeSitemapParams
      def web_scrape_sitemap(params)
        parsed, options = ContextDev::BrandWebScrapeSitemapParams.dump_request(params)
        query = ContextDev::Internal::Util.encode_query_params(parsed)
        @client.request(
          method: :get,
          path: "web/scrape/sitemap",
          query: query,
          model: ContextDev::Models::BrandWebScrapeSitemapResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [ContextDev::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
