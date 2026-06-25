# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Web#screenshot
    class WebScreenshotParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      # @!attribute direct_url
      #   A specific URL to screenshot directly, bypassing domain resolution (e.g.,
      #   'https://example.com/pricing'). When provided, the screenshot is taken of this
      #   exact URL. You must provide either 'domain' or 'directUrl', but not both.
      #
      #   @return [String, nil]
      optional :direct_url, String

      # @!attribute domain
      #   Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The
      #   domain will be automatically normalized and validated. You must provide either
      #   'domain' or 'directUrl', but not both.
      #
      #   @return [String, nil]
      optional :domain, String

      # @!attribute full_screenshot
      #   Optional parameter to determine screenshot type. If 'true', takes a full page
      #   screenshot capturing all content. If 'false' or not provided, takes a viewport
      #   screenshot (standard browser view).
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotParams::FullScreenshot, nil]
      optional :full_screenshot, enum: -> { ContextDev::WebScreenshotParams::FullScreenshot }

      # @!attribute handle_cookie_popup
      #   Optional parameter to control cookie/consent popup handling. If 'true', we
      #   dismiss cookie banner before capture. If 'false' or not provided, captures the
      #   page without that step.
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotParams::HandleCookiePopup, nil]
      optional :handle_cookie_popup, enum: -> { ContextDev::WebScreenshotParams::HandleCookiePopup }

      # @!attribute max_age_ms
      #   Return a cached screenshot if a prior screenshot for the same parameters exists
      #   and is younger than this many milliseconds. Defaults to 1 day (86400000 ms) when
      #   omitted. Max is 30 days (2592000000 ms). Set to 0 to always capture fresh.
      #
      #   @return [Integer, nil]
      optional :max_age_ms, Integer

      # @!attribute page
      #   Optional parameter to specify which page type to screenshot. If provided, the
      #   system will scrape the domain's links and use heuristics to find the most
      #   appropriate URL for the specified page type (30 supported languages). If not
      #   provided, screenshots the main domain landing page. Only applicable when using
      #   'domain', not 'directUrl'.
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotParams::Page, nil]
      optional :page, enum: -> { ContextDev::WebScreenshotParams::Page }

      # @!attribute scroll_offset
      #   Optional vertical scroll offset in pixels for capturing a long page in
      #   viewport-sized chunks. When provided, the full page is captured once and the
      #   returned image is the viewport-sized slice that begins at this Y offset (e.g.
      #   request scrollOffset=0, then 1080, then 2160 to walk a 1920x1080 landing page
      #   top to bottom). The final slice may be shorter than the viewport height. Takes
      #   precedence over fullScreenshot. Max: 100000.
      #
      #   @return [Integer, nil]
      optional :scroll_offset, Integer

      # @!attribute timeout_ms
      #   Optional timeout in milliseconds for the request. If the request takes longer
      #   than this value, it will be aborted with a 408 status code. Maximum allowed
      #   value is 300000ms (5 minutes).
      #
      #   @return [Integer, nil]
      optional :timeout_ms, Integer

      # @!attribute viewport
      #   Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
      #
      #   @return [ContextDev::Models::WebScreenshotParams::Viewport, nil]
      optional :viewport, -> { ContextDev::WebScreenshotParams::Viewport }

      # @!attribute wait_for_ms
      #   Optional browser wait time in milliseconds after initial page load before taking
      #   the screenshot. Min: 0. Max: 30000 (30 seconds). Defaults to 3000 ms when
      #   omitted.
      #
      #   @return [Integer, nil]
      optional :wait_for_ms, Integer

      # @!method initialize(direct_url: nil, domain: nil, full_screenshot: nil, handle_cookie_popup: nil, max_age_ms: nil, page: nil, scroll_offset: nil, timeout_ms: nil, viewport: nil, wait_for_ms: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebScreenshotParams} for more details.
      #
      #   @param direct_url [String] A specific URL to screenshot directly, bypassing domain resolution (e.g., 'https
      #
      #   @param domain [String] Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The domai
      #
      #   @param full_screenshot [Symbol, ContextDev::Models::WebScreenshotParams::FullScreenshot] Optional parameter to determine screenshot type. If 'true', takes a full page sc
      #
      #   @param handle_cookie_popup [Symbol, ContextDev::Models::WebScreenshotParams::HandleCookiePopup] Optional parameter to control cookie/consent popup handling. If 'true', we dismi
      #
      #   @param max_age_ms [Integer] Return a cached screenshot if a prior screenshot for the same parameters exists
      #
      #   @param page [Symbol, ContextDev::Models::WebScreenshotParams::Page] Optional parameter to specify which page type to screenshot. If provided, the sy
      #
      #   @param scroll_offset [Integer] Optional vertical scroll offset in pixels for capturing a long page in viewport-
      #
      #   @param timeout_ms [Integer] Optional timeout in milliseconds for the request. If the request takes longer th
      #
      #   @param viewport [ContextDev::Models::WebScreenshotParams::Viewport] Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
      #
      #   @param wait_for_ms [Integer] Optional browser wait time in milliseconds after initial page load before taking
      #
      #   @param request_options [ContextDev::RequestOptions, Hash{Symbol=>Object}]

      # Optional parameter to determine screenshot type. If 'true', takes a full page
      # screenshot capturing all content. If 'false' or not provided, takes a viewport
      # screenshot (standard browser view).
      module FullScreenshot
        extend ContextDev::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Optional parameter to control cookie/consent popup handling. If 'true', we
      # dismiss cookie banner before capture. If 'false' or not provided, captures the
      # page without that step.
      module HandleCookiePopup
        extend ContextDev::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Optional parameter to specify which page type to screenshot. If provided, the
      # system will scrape the domain's links and use heuristics to find the most
      # appropriate URL for the specified page type (30 supported languages). If not
      # provided, screenshots the main domain landing page. Only applicable when using
      # 'domain', not 'directUrl'.
      module Page
        extend ContextDev::Internal::Type::Enum

        LOGIN = :login
        SIGNUP = :signup
        BLOG = :blog
        CAREERS = :careers
        PRICING = :pricing
        TERMS = :terms
        PRIVACY = :privacy
        CONTACT = :contact

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Viewport < ContextDev::Internal::Type::BaseModel
        # @!attribute height
        #   Viewport height in pixels.
        #
        #   @return [Integer, nil]
        optional :height, Integer

        # @!attribute width
        #   Viewport width in pixels.
        #
        #   @return [Integer, nil]
        optional :width, Integer

        # @!method initialize(height: nil, width: nil)
        #   Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
        #
        #   @param height [Integer] Viewport height in pixels.
        #
        #   @param width [Integer] Viewport width in pixels.
      end
    end
  end
end
