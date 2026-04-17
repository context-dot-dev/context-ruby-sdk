# typed: strong

module ContextDev
  module Models
    class WebWebScrapeSitemapParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            ContextDev::WebWebScrapeSitemapParams,
            ContextDev::Internal::AnyHash
          )
        end

      # Domain to build a sitemap for
      sig { returns(String) }
      attr_accessor :domain

      # Maximum number of links to return from the sitemap crawl. Defaults to 10,000.
      # Minimum is 1, maximum is 100,000.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_links

      sig { params(max_links: Integer).void }
      attr_writer :max_links

      sig do
        params(
          domain: String,
          max_links: Integer,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Domain to build a sitemap for
        domain:,
        # Maximum number of links to return from the sitemap crawl. Defaults to 10,000.
        # Minimum is 1, maximum is 100,000.
        max_links: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            domain: String,
            max_links: Integer,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
