# frozen_string_literal: true

module ContextDev
  [ContextDev::Internal::Type::BaseModel, *ContextDev::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, ContextDev::Internal::AnyHash) } }
  end

  ContextDev::Internal::Util.walk_namespaces(ContextDev::Models).each do |mod|
    case mod
    in ContextDev::Internal::Type::Enum | ContextDev::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  ContextDev::Internal::Util.walk_namespaces(ContextDev::Models)
                            .lazy
                            .grep(ContextDev::Internal::Type::Union)
                            .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  AIExtractProductParams = ContextDev::Models::AIExtractProductParams

  AIExtractProductsParams = ContextDev::Models::AIExtractProductsParams

  BatchCancelParams = ContextDev::Models::BatchCancelParams

  BatchDeleteParams = ContextDev::Models::BatchDeleteParams

  BatchGetResultsParams = ContextDev::Models::BatchGetResultsParams

  BatchListParams = ContextDev::Models::BatchListParams

  BatchRetrieveParams = ContextDev::Models::BatchRetrieveParams

  BatchSubmitParams = ContextDev::Models::BatchSubmitParams

  BrandRetrieveParams = ContextDev::Models::BrandRetrieveParams

  BrandRetrieveSimplifiedParams = ContextDev::Models::BrandRetrieveSimplifiedParams

  BrandSearchParams = ContextDev::Models::BrandSearchParams

  CrawlControls = ContextDev::Models::CrawlControls

  Failure = ContextDev::Models::Failure

  IndustryRetrieveNaicsParams = ContextDev::Models::IndustryRetrieveNaicsParams

  IndustryRetrieveSicParams = ContextDev::Models::IndustryRetrieveSicParams

  Intake = ContextDev::Models::Intake

  MonitorCreateParams = ContextDev::Models::MonitorCreateParams

  MonitorDeleteParams = ContextDev::Models::MonitorDeleteParams

  MonitorGetCreditUsageParams = ContextDev::Models::MonitorGetCreditUsageParams

  MonitorGetLimitsParams = ContextDev::Models::MonitorGetLimitsParams

  MonitorListAccountChangesParams = ContextDev::Models::MonitorListAccountChangesParams

  MonitorListAccountRunsParams = ContextDev::Models::MonitorListAccountRunsParams

  MonitorListChangesParams = ContextDev::Models::MonitorListChangesParams

  MonitorListParams = ContextDev::Models::MonitorListParams

  MonitorListRunsParams = ContextDev::Models::MonitorListRunsParams

  MonitorRetrieveChangeParams = ContextDev::Models::MonitorRetrieveChangeParams

  MonitorRetrieveParams = ContextDev::Models::MonitorRetrieveParams

  MonitorRunParams = ContextDev::Models::MonitorRunParams

  MonitorUpdateParams = ContextDev::Models::MonitorUpdateParams

  PageErrorCount = ContextDev::Models::PageErrorCount

  ParseHandleParams = ContextDev::Models::ParseHandleParams

  PersonEnrichParams = ContextDev::Models::PersonEnrichParams

  UtilityPrefetchParams = ContextDev::Models::UtilityPrefetchParams

  WebExtractCompetitorsParams = ContextDev::Models::WebExtractCompetitorsParams

  WebExtractFontsParams = ContextDev::Models::WebExtractFontsParams

  WebExtractParams = ContextDev::Models::WebExtractParams

  WebExtractStyleguideParams = ContextDev::Models::WebExtractStyleguideParams

  WebhookDelivery = ContextDev::Models::WebhookDelivery

  WebScreenshotParams = ContextDev::Models::WebScreenshotParams

  WebSearchParams = ContextDev::Models::WebSearchParams

  WebWebCrawlMdParams = ContextDev::Models::WebWebCrawlMdParams

  WebWebScrapeHTMLParams = ContextDev::Models::WebWebScrapeHTMLParams

  WebWebScrapeImagesParams = ContextDev::Models::WebWebScrapeImagesParams

  WebWebScrapeMdParams = ContextDev::Models::WebWebScrapeMdParams

  WebWebScrapeSitemapParams = ContextDev::Models::WebWebScrapeSitemapParams
end
