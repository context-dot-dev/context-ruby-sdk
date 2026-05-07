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

      # @!attribute prioritize
      #   Optional parameter to prioritize screenshot capture. If 'speed', optimizes for
      #   faster capture with basic quality. If 'quality', optimizes for higher quality
      #   with longer wait times. Defaults to 'quality' if not provided.
      #
      #   @return [Symbol, ContextDev::Models::WebScreenshotParams::Prioritize, nil]
      optional :prioritize, enum: -> { ContextDev::WebScreenshotParams::Prioritize }

      # @!attribute viewport
      #   Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
      #
      #   @return [ContextDev::Models::WebScreenshotParams::Viewport, nil]
      optional :viewport, -> { ContextDev::WebScreenshotParams::Viewport }

      # @!method initialize(direct_url: nil, domain: nil, full_screenshot: nil, max_age_ms: nil, page: nil, prioritize: nil, viewport: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::WebScreenshotParams} for more details.
      #
      #   @param direct_url [String] A specific URL to screenshot directly, bypassing domain resolution (e.g., 'https
      #
      #   @param domain [String] Domain name to take screenshot of (e.g., 'example.com', 'google.com'). The domai
      #
      #   @param full_screenshot [Symbol, ContextDev::Models::WebScreenshotParams::FullScreenshot] Optional parameter to determine screenshot type. If 'true', takes a full page sc
      #
      #   @param max_age_ms [Integer] Return a cached screenshot if a prior screenshot for the same parameters exists
      #
      #   @param page [Symbol, ContextDev::Models::WebScreenshotParams::Page] Optional parameter to specify which page type to screenshot. If provided, the sy
      #
      #   @param prioritize [Symbol, ContextDev::Models::WebScreenshotParams::Prioritize] Optional parameter to prioritize screenshot capture. If 'speed', optimizes for f
      #
      #   @param viewport [ContextDev::Models::WebScreenshotParams::Viewport] Optional browser viewport dimensions for the screenshot. Defaults to 1920x1080.
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

      # Optional parameter to prioritize screenshot capture. If 'speed', optimizes for
      # faster capture with basic quality. If 'quality', optimizes for higher quality
      # with longer wait times. Defaults to 'quality' if not provided.
      module Prioritize
        extend ContextDev::Internal::Type::Enum

        SPEED = :speed
        QUALITY = :quality

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
