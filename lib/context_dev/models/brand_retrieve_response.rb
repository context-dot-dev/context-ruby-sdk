# frozen_string_literal: true

module ContextDev
  module Models
    # @see ContextDev::Resources::Brand#retrieve
    class BrandRetrieveResponse < ContextDev::Internal::Type::BaseModel
      # @!attribute brand
      #   The brand's identity, visual assets, and company details.
      #
      #   @return [ContextDev::Models::BrandRetrieveResponse::Brand]
      required :brand, -> { ContextDev::Models::BrandRetrieveResponse::Brand }

      # @!attribute cache_metadata
      #   Cache status of this response.
      #
      #   @return [ContextDev::Models::BrandRetrieveResponse::CacheMetadata]
      required :cache_metadata, -> { ContextDev::Models::BrandRetrieveResponse::CacheMetadata }

      # @!attribute code
      #   HTTP status code. Always `200` on success.
      #
      #   @return [Integer]
      required :code, Integer

      # @!attribute request_id
      #   Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      #   support.
      #
      #   @return [String]
      required :request_id, String

      # @!attribute status
      #   Always `ok` on success.
      #
      #   @return [String]
      required :status, String

      # @!attribute key_metadata
      #   Credits this request used and your remaining balance.
      #
      #   @return [ContextDev::Models::BrandRetrieveResponse::KeyMetadata, nil]
      optional :key_metadata, -> { ContextDev::Models::BrandRetrieveResponse::KeyMetadata }

      # @!attribute partial
      #   `true` when the `timeoutOpts` deadline ended processing early. The response
      #   holds the data completed so far; unfinished fields are omitted.
      #
      #   @return [Boolean, nil]
      optional :partial, ContextDev::Internal::Type::Boolean

      # @!method initialize(brand:, cache_metadata:, code:, request_id:, status:, key_metadata: nil, partial: nil)
      #   Some parameter documentations has been truncated, see
      #   {ContextDev::Models::BrandRetrieveResponse} for more details.
      #
      #   @param brand [ContextDev::Models::BrandRetrieveResponse::Brand] The brand's identity, visual assets, and company details.
      #
      #   @param cache_metadata [ContextDev::Models::BrandRetrieveResponse::CacheMetadata] Cache status of this response.
      #
      #   @param code [Integer] HTTP status code. Always `200` on success.
      #
      #   @param request_id [String] Unique ID of this request, also in `X-Request-Id`. Include it when contacting su
      #
      #   @param status [String] Always `ok` on success.
      #
      #   @param key_metadata [ContextDev::Models::BrandRetrieveResponse::KeyMetadata] Credits this request used and your remaining balance.
      #
      #   @param partial [Boolean] `true` when the `timeoutOpts` deadline ended processing early. The response hold

      # @see ContextDev::Models::BrandRetrieveResponse#brand
      class Brand < ContextDev::Internal::Type::BaseModel
        # @!attribute address
        #   Physical address of the brand. Omitted when unknown.
        #
        #   @return [ContextDev::Models::BrandRetrieveResponse::Brand::Address, nil]
        optional :address, -> { ContextDev::Models::BrandRetrieveResponse::Brand::Address }

        # @!attribute backdrops
        #   Backdrop images for the brand, such as social profile banners.
        #
        #   @return [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Backdrop>, nil]
        optional :backdrops,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandRetrieveResponse::Brand::Backdrop] }

        # @!attribute colors
        #   Brand colors from the website and logos.
        #
        #   @return [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Color>, nil]
        optional :colors,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandRetrieveResponse::Brand::Color] }

        # @!attribute description
        #   Short description of the brand.
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute domain
        #   Domain of the brand.
        #
        #   @return [String, nil]
        optional :domain, String

        # @!attribute email
        #   Contact email address for the company.
        #
        #   @return [String, nil]
        optional :email, String

        # @!attribute employees
        #   Employee headcount. Omitted when unknown.
        #
        #   @return [ContextDev::Models::BrandRetrieveResponse::Brand::Employees, nil]
        optional :employees, -> { ContextDev::Models::BrandRetrieveResponse::Brand::Employees }

        # @!attribute industries
        #   Industry classification of the brand.
        #
        #   @return [ContextDev::Models::BrandRetrieveResponse::Brand::Industries, nil]
        optional :industries, -> { ContextDev::Models::BrandRetrieveResponse::Brand::Industries }

        # @!attribute is_nsfw
        #   Whether the brand's content is not safe for work (NSFW).
        #
        #   @return [Boolean, nil]
        optional :is_nsfw, ContextDev::Internal::Type::Boolean

        # @!attribute links
        #   Key pages on the brand's website.
        #
        #   @return [ContextDev::Models::BrandRetrieveResponse::Brand::Links, nil]
        optional :links, -> { ContextDev::Models::BrandRetrieveResponse::Brand::Links }

        # @!attribute logos
        #   Brand logos, most relevant first. An SVG is listed ahead of a raster logo of the
        #   same shape.
        #
        #   @return [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Logo>, nil]
        optional :logos,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandRetrieveResponse::Brand::Logo] }

        # @!attribute phone
        #   Contact phone number for the company.
        #
        #   @return [String, nil]
        optional :phone, String

        # @!attribute primary_language
        #   Lowercase language name, such as `english`.
        #
        #   @return [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::PrimaryLanguage, nil]
        optional :primary_language,
                 enum: -> { ContextDev::Models::BrandRetrieveResponse::Brand::PrimaryLanguage },
                 nil?: true

        # @!attribute slogan
        #   Brand slogan or tagline.
        #
        #   @return [String, nil]
        optional :slogan, String

        # @!attribute socials
        #   Social media profiles of the brand.
        #
        #   @return [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Social>, nil]
        optional :socials,
                 -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandRetrieveResponse::Brand::Social] }

        # @!attribute stock
        #   Stock listing. Omitted when the company is not publicly traded.
        #
        #   @return [ContextDev::Models::BrandRetrieveResponse::Brand::Stock, nil]
        optional :stock, -> { ContextDev::Models::BrandRetrieveResponse::Brand::Stock }

        # @!attribute title
        #   Brand name.
        #
        #   @return [String, nil]
        optional :title, String

        # @!method initialize(address: nil, backdrops: nil, colors: nil, description: nil, domain: nil, email: nil, employees: nil, industries: nil, is_nsfw: nil, links: nil, logos: nil, phone: nil, primary_language: nil, slogan: nil, socials: nil, stock: nil, title: nil)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BrandRetrieveResponse::Brand} for more details.
        #
        #   The brand's identity, visual assets, and company details.
        #
        #   @param address [ContextDev::Models::BrandRetrieveResponse::Brand::Address] Physical address of the brand. Omitted when unknown.
        #
        #   @param backdrops [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Backdrop>] Backdrop images for the brand, such as social profile banners.
        #
        #   @param colors [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Color>] Brand colors from the website and logos.
        #
        #   @param description [String] Short description of the brand.
        #
        #   @param domain [String] Domain of the brand.
        #
        #   @param email [String] Contact email address for the company.
        #
        #   @param employees [ContextDev::Models::BrandRetrieveResponse::Brand::Employees] Employee headcount. Omitted when unknown.
        #
        #   @param industries [ContextDev::Models::BrandRetrieveResponse::Brand::Industries] Industry classification of the brand.
        #
        #   @param is_nsfw [Boolean] Whether the brand's content is not safe for work (NSFW).
        #
        #   @param links [ContextDev::Models::BrandRetrieveResponse::Brand::Links] Key pages on the brand's website.
        #
        #   @param logos [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Logo>] Brand logos, most relevant first. An SVG is listed ahead of a raster logo of the
        #
        #   @param phone [String] Contact phone number for the company.
        #
        #   @param primary_language [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::PrimaryLanguage, nil] Lowercase language name, such as `english`.
        #
        #   @param slogan [String] Brand slogan or tagline.
        #
        #   @param socials [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Social>] Social media profiles of the brand.
        #
        #   @param stock [ContextDev::Models::BrandRetrieveResponse::Brand::Stock] Stock listing. Omitted when the company is not publicly traded.
        #
        #   @param title [String] Brand name.

        # @see ContextDev::Models::BrandRetrieveResponse::Brand#address
        class Address < ContextDev::Internal::Type::BaseModel
          # @!attribute city
          #   City.
          #
          #   @return [String, nil]
          optional :city, String

          # @!attribute country
          #   Country name.
          #
          #   @return [String, nil]
          optional :country, String

          # @!attribute country_code
          #   Country code, such as `US`.
          #
          #   @return [String, nil]
          optional :country_code, String

          # @!attribute postal_code
          #   Postal or ZIP code.
          #
          #   @return [String, nil]
          optional :postal_code, String

          # @!attribute state_code
          #   State or province code.
          #
          #   @return [String, nil]
          optional :state_code, String

          # @!attribute state_province
          #   State or province name.
          #
          #   @return [String, nil]
          optional :state_province, String

          # @!attribute street
          #   Street address.
          #
          #   @return [String, nil]
          optional :street, String

          # @!method initialize(city: nil, country: nil, country_code: nil, postal_code: nil, state_code: nil, state_province: nil, street: nil)
          #   Physical address of the brand. Omitted when unknown.
          #
          #   @param city [String] City.
          #
          #   @param country [String] Country name.
          #
          #   @param country_code [String] Country code, such as `US`.
          #
          #   @param postal_code [String] Postal or ZIP code.
          #
          #   @param state_code [String] State or province code.
          #
          #   @param state_province [String] State or province name.
          #
          #   @param street [String] Street address.
        end

        class Backdrop < ContextDev::Internal::Type::BaseModel
          # @!attribute colors
          #   Colors in the backdrop image.
          #
          #   @return [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Backdrop::Color>, nil]
          optional :colors,
                   -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandRetrieveResponse::Brand::Backdrop::Color] }

          # @!attribute resolution
          #   Size of the backdrop image.
          #
          #   @return [ContextDev::Models::BrandRetrieveResponse::Brand::Backdrop::Resolution, nil]
          optional :resolution, -> { ContextDev::Models::BrandRetrieveResponse::Brand::Backdrop::Resolution }

          # @!attribute url
          #   URL of the backdrop image.
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(colors: nil, resolution: nil, url: nil)
          #   @param colors [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Backdrop::Color>] Colors in the backdrop image.
          #
          #   @param resolution [ContextDev::Models::BrandRetrieveResponse::Brand::Backdrop::Resolution] Size of the backdrop image.
          #
          #   @param url [String] URL of the backdrop image.

          class Color < ContextDev::Internal::Type::BaseModel
            # @!attribute hex
            #   Hex color code, such as `#635BFF`.
            #
            #   @return [String, nil]
            optional :hex, String

            # @!attribute name
            #   Human-readable color name.
            #
            #   @return [String, nil]
            optional :name, String

            # @!method initialize(hex: nil, name: nil)
            #   @param hex [String] Hex color code, such as `#635BFF`.
            #
            #   @param name [String] Human-readable color name.
          end

          # @see ContextDev::Models::BrandRetrieveResponse::Brand::Backdrop#resolution
          class Resolution < ContextDev::Internal::Type::BaseModel
            # @!attribute aspect_ratio
            #   Aspect ratio, as width divided by height.
            #
            #   @return [Float, nil]
            optional :aspect_ratio, Float

            # @!attribute height
            #   Height, in pixels.
            #
            #   @return [Integer, nil]
            optional :height, Integer

            # @!attribute width
            #   Width, in pixels.
            #
            #   @return [Integer, nil]
            optional :width, Integer

            # @!method initialize(aspect_ratio: nil, height: nil, width: nil)
            #   Size of the backdrop image.
            #
            #   @param aspect_ratio [Float] Aspect ratio, as width divided by height.
            #
            #   @param height [Integer] Height, in pixels.
            #
            #   @param width [Integer] Width, in pixels.
          end
        end

        class Color < ContextDev::Internal::Type::BaseModel
          # @!attribute hex
          #   Hex color code, such as `#635BFF`.
          #
          #   @return [String, nil]
          optional :hex, String

          # @!attribute name
          #   Human-readable color name.
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute source
          #   `site` colors come from the website's own theme (rendered page colors, web app
          #   manifest, `theme-color` meta tag); `logo` colors come from logo pixels.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Color::Source, nil]
          optional :source, enum: -> { ContextDev::Models::BrandRetrieveResponse::Brand::Color::Source }

          # @!method initialize(hex: nil, name: nil, source: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveResponse::Brand::Color} for more details.
          #
          #   @param hex [String] Hex color code, such as `#635BFF`.
          #
          #   @param name [String] Human-readable color name.
          #
          #   @param source [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Color::Source] `site` colors come from the website's own theme (rendered page colors, web app m

          # `site` colors come from the website's own theme (rendered page colors, web app
          # manifest, `theme-color` meta tag); `logo` colors come from logo pixels.
          #
          # @see ContextDev::Models::BrandRetrieveResponse::Brand::Color#source
          module Source
            extend ContextDev::Internal::Type::Enum

            SITE = :site
            LOGO = :logo

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see ContextDev::Models::BrandRetrieveResponse::Brand#employees
        class Employees < ContextDev::Internal::Type::BaseModel
          # @!attribute exact
          #   Exact employee count, when known.
          #
          #   @return [Integer, nil]
          optional :exact, Integer

          # @!attribute range
          #   Headcount range, such as `11 to 50`.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Employees::Range, nil]
          optional :range, enum: -> { ContextDev::Models::BrandRetrieveResponse::Brand::Employees::Range }

          # @!method initialize(exact: nil, range: nil)
          #   Employee headcount. Omitted when unknown.
          #
          #   @param exact [Integer] Exact employee count, when known.
          #
          #   @param range [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Employees::Range] Headcount range, such as `11 to 50`.

          # Headcount range, such as `11 to 50`.
          #
          # @see ContextDev::Models::BrandRetrieveResponse::Brand::Employees#range
          module Range
            extend ContextDev::Internal::Type::Enum

            RANGE_1_TO_10 = :"1 to 10"
            RANGE_11_TO_50 = :"11 to 50"
            RANGE_51_TO_200 = :"51 to 200"
            RANGE_201_TO_500 = :"201 to 500"
            RANGE_501_TO_1000 = :"501 to 1000"
            RANGE_1001_TO_5000 = :"1001 to 5000"
            RANGE_5001_TO_10000 = :"5001 to 10000"
            RANGE_10001 = :"10001+"

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see ContextDev::Models::BrandRetrieveResponse::Brand#industries
        class Industries < ContextDev::Internal::Type::BaseModel
          # @!attribute eic
          #   Industry and subindustry pairs from Context.dev's Easy Industry Classification
          #   (EIC).
          #
          #   @return [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic>, nil]
          optional :eic,
                   -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic] }

          # @!method initialize(eic: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveResponse::Brand::Industries} for more details.
          #
          #   Industry classification of the brand.
          #
          #   @param eic [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic>] Industry and subindustry pairs from Context.dev's Easy Industry Classification (

          class Eic < ContextDev::Internal::Type::BaseModel
            # @!attribute industry
            #   Top-level industry in the Easy Industry Classification (EIC).
            #
            #   @return [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic::Industry]
            required :industry,
                     enum: -> { ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic::Industry }

            # @!attribute subindustry
            #   Subindustry in the Easy Industry Classification (EIC).
            #
            #   @return [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic::Subindustry]
            required :subindustry,
                     enum: -> { ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic::Subindustry }

            # @!method initialize(industry:, subindustry:)
            #   @param industry [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic::Industry] Top-level industry in the Easy Industry Classification (EIC).
            #
            #   @param subindustry [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic::Subindustry] Subindustry in the Easy Industry Classification (EIC).

            # Top-level industry in the Easy Industry Classification (EIC).
            #
            # @see ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic#industry
            module Industry
              extend ContextDev::Internal::Type::Enum

              AEROSPACE_DEFENSE = :"Aerospace & Defense"
              TECHNOLOGY = :Technology
              FINANCE = :Finance
              HEALTHCARE = :Healthcare
              RETAIL_E_COMMERCE = :"Retail & E-commerce"
              ENTERTAINMENT = :Entertainment
              EDUCATION = :Education
              GOVERNMENT_NONPROFIT = :"Government & Nonprofit"
              INDUSTRIAL_ENERGY = :"Industrial & Energy"
              AUTOMOTIVE_TRANSPORTATION = :"Automotive & Transportation"
              LIFESTYLE_LEISURE = :"Lifestyle & Leisure"
              LUXURY_FASHION = :"Luxury & Fashion"
              NEWS_MEDIA = :"News & Media"
              SPORTS = :Sports
              REAL_ESTATE_PROP_TECH = :"Real Estate & PropTech"
              LEGAL_COMPLIANCE = :"Legal & Compliance"
              TELECOMMUNICATIONS = :Telecommunications
              AGRICULTURE_FOOD = :"Agriculture & Food"
              PROFESSIONAL_SERVICES_AGENCIES = :"Professional Services & Agencies"
              CHEMICALS_MATERIALS = :"Chemicals & Materials"
              LOGISTICS_SUPPLY_CHAIN = :"Logistics & Supply Chain"
              HOSPITALITY_TOURISM = :"Hospitality & Tourism"
              CONSTRUCTION_BUILT_ENVIRONMENT = :"Construction & Built Environment"
              CONSUMER_PACKAGED_GOODS_CPG = :"Consumer Packaged Goods (CPG)"

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Subindustry in the Easy Industry Classification (EIC).
            #
            # @see ContextDev::Models::BrandRetrieveResponse::Brand::Industries::Eic#subindustry
            module Subindustry
              extend ContextDev::Internal::Type::Enum

              DEFENSE_SYSTEMS_MILITARY_HARDWARE = :"Defense Systems & Military Hardware"
              AEROSPACE_MANUFACTURING = :"Aerospace Manufacturing"
              AVIONICS_NAVIGATION_TECHNOLOGY = :"Avionics & Navigation Technology"
              SUBSEA_NAVAL_DEFENSE_SYSTEMS = :"Subsea & Naval Defense Systems"
              SPACE_SATELLITE_TECHNOLOGY = :"Space & Satellite Technology"
              DEFENSE_IT_SYSTEMS_INTEGRATION = :"Defense IT & Systems Integration"
              SOFTWARE_B2_B = :"Software (B2B)"
              SOFTWARE_B2_C = :"Software (B2C)"
              CLOUD_INFRASTRUCTURE_DEV_OPS = :"Cloud Infrastructure & DevOps"
              CYBERSECURITY = :Cybersecurity
              ARTIFICIAL_INTELLIGENCE_MACHINE_LEARNING = :"Artificial Intelligence & Machine Learning"
              DATA_INFRASTRUCTURE_ANALYTICS = :"Data Infrastructure & Analytics"
              HARDWARE_SEMICONDUCTORS = :"Hardware & Semiconductors"
              FINTECH_INFRASTRUCTURE = :"Fintech Infrastructure"
              E_COMMERCE_MARKETPLACE_PLATFORMS = :"eCommerce & Marketplace Platforms"
              DEVELOPER_TOOLS_APIS = :"Developer Tools & APIs"
              WEB3_BLOCKCHAIN = :"Web3 & Blockchain"
              XR_SPATIAL_COMPUTING = :"XR & Spatial Computing"
              BANKING_LENDING = :"Banking & Lending"
              INVESTMENT_MANAGEMENT_WEALTH_TECH = :"Investment Management & WealthTech"
              INSURANCE_INSUR_TECH = :"Insurance & InsurTech"
              PAYMENTS_MONEY_MOVEMENT = :"Payments & Money Movement"
              ACCOUNTING_TAX_FINANCIAL_PLANNING_TOOLS = :"Accounting, Tax & Financial Planning Tools"
              CAPITAL_MARKETS_TRADING_PLATFORMS = :"Capital Markets & Trading Platforms"
              FINANCIAL_INFRASTRUCTURE_APIS = :"Financial Infrastructure & APIs"
              CREDIT_SCORING_RISK_MANAGEMENT = :"Credit Scoring & Risk Management"
              CRYPTOCURRENCY_DIGITAL_ASSETS = :"Cryptocurrency & Digital Assets"
              BNPL_ALTERNATIVE_FINANCING = :"BNPL & Alternative Financing"
              HEALTHCARE_PROVIDERS_SERVICES = :"Healthcare Providers & Services"
              PHARMACEUTICALS_DRUG_DEVELOPMENT = :"Pharmaceuticals & Drug Development"
              MEDICAL_DEVICES_DIAGNOSTICS = :"Medical Devices & Diagnostics"
              BIOTECHNOLOGY_GENOMICS = :"Biotechnology & Genomics"
              DIGITAL_HEALTH_TELEMEDICINE = :"Digital Health & Telemedicine"
              HEALTH_INSURANCE_BENEFITS_TECH = :"Health Insurance & Benefits Tech"
              CLINICAL_TRIALS_RESEARCH_PLATFORMS = :"Clinical Trials & Research Platforms"
              MENTAL_HEALTH_WELLNESS = :"Mental Health & Wellness"
              HEALTHCARE_IT_EHR_SYSTEMS = :"Healthcare IT & EHR Systems"
              CONSUMER_HEALTH_WELLNESS_PRODUCTS = :"Consumer Health & Wellness Products"
              ONLINE_MARKETPLACES = :"Online Marketplaces"
              DIRECT_TO_CONSUMER_DTC_BRANDS = :"Direct-to-Consumer (DTC) Brands"
              RETAIL_TECH_POINT_OF_SALE_SYSTEMS = :"Retail Tech & Point-of-Sale Systems"
              OMNICHANNEL_IN_STORE_RETAIL = :"Omnichannel & In-Store Retail"
              E_COMMERCE_ENABLEMENT_INFRASTRUCTURE = :"E-commerce Enablement & Infrastructure"
              SUBSCRIPTION_MEMBERSHIP_COMMERCE = :"Subscription & Membership Commerce"
              SOCIAL_COMMERCE_INFLUENCER_PLATFORMS = :"Social Commerce & Influencer Platforms"
              FASHION_APPAREL_RETAIL = :"Fashion & Apparel Retail"
              FOOD_BEVERAGE_GROCERY_E_COMMERCE = :"Food, Beverage & Grocery E-commerce"
              STREAMING_PLATFORMS_VIDEO_MUSIC_AUDIO = :"Streaming Platforms (Video, Music, Audio)"
              GAMING_INTERACTIVE_ENTERTAINMENT = :"Gaming & Interactive Entertainment"
              CREATOR_ECONOMY_INFLUENCER_PLATFORMS = :"Creator Economy & Influencer Platforms"
              FILM_TV_PRODUCTION_STUDIOS = :"Film, TV & Production Studios"
              EVENTS_VENUES_LIVE_ENTERTAINMENT = :"Events, Venues & Live Entertainment"
              VIRTUAL_WORLDS_METAVERSE_EXPERIENCES = :"Virtual Worlds & Metaverse Experiences"
              K_12_EDUCATION_PLATFORMS_TOOLS = :"K-12 Education Platforms & Tools"
              HIGHER_EDUCATION_UNIVERSITY_TECH = :"Higher Education & University Tech"
              ONLINE_LEARNING_MOO_CS = :"Online Learning & MOOCs"
              TEST_PREP_CERTIFICATION = :"Test Prep & Certification"
              CORPORATE_TRAINING_UPSKILLING = :"Corporate Training & Upskilling"
              TUTORING_SUPPLEMENTAL_LEARNING = :"Tutoring & Supplemental Learning"
              EDUCATION_MANAGEMENT_SYSTEMS_LMS_SIS = :"Education Management Systems (LMS/SIS)"
              LANGUAGE_LEARNING = :"Language Learning"
              CREATOR_LED_COHORT_BASED_COURSES = :"Creator-Led & Cohort-Based Courses"
              SPECIAL_EDUCATION_ACCESSIBILITY_TOOLS = :"Special Education & Accessibility Tools"
              GOVERNMENT_TECHNOLOGY_DIGITAL_SERVICES = :"Government Technology & Digital Services"
              CIVIC_ENGAGEMENT_POLICY_PLATFORMS = :"Civic Engagement & Policy Platforms"
              INTERNATIONAL_DEVELOPMENT_HUMANITARIAN_AID = :"International Development & Humanitarian Aid"
              PHILANTHROPY_GRANTMAKING = :"Philanthropy & Grantmaking"
              NONPROFIT_OPERATIONS_FUNDRAISING_TOOLS = :"Nonprofit Operations & Fundraising Tools"
              PUBLIC_HEALTH_SOCIAL_SERVICES = :"Public Health & Social Services"
              EDUCATION_YOUTH_DEVELOPMENT_PROGRAMS = :"Education & Youth Development Programs"
              ENVIRONMENTAL_CLIMATE_ACTION_ORGANIZATIONS = :"Environmental & Climate Action Organizations"
              LEGAL_AID_SOCIAL_JUSTICE_ADVOCACY = :"Legal Aid & Social Justice Advocacy"
              MUNICIPAL_INFRASTRUCTURE_SERVICES = :"Municipal & Infrastructure Services"
              MANUFACTURING_INDUSTRIAL_AUTOMATION = :"Manufacturing & Industrial Automation"
              ENERGY_PRODUCTION_OIL_GAS_NUCLEAR = :"Energy Production (Oil, Gas, Nuclear)"
              RENEWABLE_ENERGY_CLEANTECH = :"Renewable Energy & Cleantech"
              UTILITIES_GRID_INFRASTRUCTURE = :"Utilities & Grid Infrastructure"
              INDUSTRIAL_IO_T_MONITORING_SYSTEMS = :"Industrial IoT & Monitoring Systems"
              CONSTRUCTION_HEAVY_EQUIPMENT = :"Construction & Heavy Equipment"
              MINING_NATURAL_RESOURCES = :"Mining & Natural Resources"
              ENVIRONMENTAL_ENGINEERING_SUSTAINABILITY = :"Environmental Engineering & Sustainability"
              ENERGY_STORAGE_BATTERY_TECHNOLOGY = :"Energy Storage & Battery Technology"
              AUTOMOTIVE_OE_MS_VEHICLE_MANUFACTURING = :"Automotive OEMs & Vehicle Manufacturing"
              ELECTRIC_VEHICLES_E_VS_CHARGING_INFRASTRUCTURE = :"Electric Vehicles (EVs) & Charging Infrastructure"
              MOBILITY_AS_A_SERVICE_MAA_S = :"Mobility-as-a-Service (MaaS)"
              FLEET_MANAGEMENT = :"Fleet Management"
              PUBLIC_TRANSIT_URBAN_MOBILITY = :"Public Transit & Urban Mobility"
              AUTONOMOUS_VEHICLES_ADAS = :"Autonomous Vehicles & ADAS"
              AFTERMARKET_PARTS_SERVICES = :"Aftermarket Parts & Services"
              TELEMATICS_VEHICLE_CONNECTIVITY = :"Telematics & Vehicle Connectivity"
              AVIATION_AEROSPACE_TRANSPORT = :"Aviation & Aerospace Transport"
              MARITIME_SHIPPING = :"Maritime Shipping"
              FITNESS_WELLNESS = :"Fitness & Wellness"
              BEAUTY_PERSONAL_CARE = :"Beauty & Personal Care"
              HOME_LIVING = :"Home & Living"
              DATING_RELATIONSHIPS = :"Dating & Relationships"
              HOBBIES_CRAFTS_DIY = :"Hobbies, Crafts & DIY"
              OUTDOOR_RECREATIONAL_GEAR = :"Outdoor & Recreational Gear"
              EVENTS_EXPERIENCES_TICKETING_PLATFORMS = :"Events, Experiences & Ticketing Platforms"
              DESIGNER_LUXURY_APPAREL = :"Designer & Luxury Apparel"
              ACCESSORIES_JEWELRY_WATCHES = :"Accessories, Jewelry & Watches"
              FOOTWEAR_LEATHER_GOODS = :"Footwear & Leather Goods"
              BEAUTY_FRAGRANCE_SKINCARE = :"Beauty, Fragrance & Skincare"
              FASHION_MARKETPLACES_RETAIL_PLATFORMS = :"Fashion Marketplaces & Retail Platforms"
              SUSTAINABLE_ETHICAL_FASHION = :"Sustainable & Ethical Fashion"
              RESALE_VINTAGE_CIRCULAR_FASHION = :"Resale, Vintage & Circular Fashion"
              FASHION_TECH_VIRTUAL_TRY_ONS = :"Fashion Tech & Virtual Try-Ons"
              STREETWEAR_EMERGING_LUXURY = :"Streetwear & Emerging Luxury"
              COUTURE_MADE_TO_MEASURE = :"Couture & Made-to-Measure"
              NEWS_PUBLISHING_JOURNALISM = :"News Publishing & Journalism"
              ADVERTISING_ADTECH_MEDIA_BUYING = :"Advertising, Adtech & Media Buying"
              DIGITAL_MEDIA_CONTENT_PLATFORMS = :"Digital Media & Content Platforms"
              BROADCASTING_TV_RADIO = :"Broadcasting (TV & Radio)"
              PODCASTING_AUDIO_MEDIA = :"Podcasting & Audio Media"
              NEWS_AGGREGATORS_CURATION_TOOLS = :"News Aggregators & Curation Tools"
              INDEPENDENT_CREATOR_LED_MEDIA = :"Independent & Creator-Led Media"
              NEWSLETTERS_SUBSTACK_STYLE_PLATFORMS = :"Newsletters & Substack-Style Platforms"
              POLITICAL_INVESTIGATIVE_MEDIA = :"Political & Investigative Media"
              TRADE_NICHE_PUBLICATIONS = :"Trade & Niche Publications"
              MEDIA_MONITORING_ANALYTICS = :"Media Monitoring & Analytics"
              PROFESSIONAL_TEAMS_LEAGUES = :"Professional Teams & Leagues"
              SPORTS_MEDIA_BROADCASTING = :"Sports Media & Broadcasting"
              SPORTS_BETTING_FANTASY_SPORTS = :"Sports Betting & Fantasy Sports"
              FITNESS_ATHLETIC_TRAINING_PLATFORMS = :"Fitness & Athletic Training Platforms"
              SPORTSWEAR_EQUIPMENT = :"Sportswear & Equipment"
              ESPORTS_COMPETITIVE_GAMING = :"Esports & Competitive Gaming"
              SPORTS_VENUES_EVENT_MANAGEMENT = :"Sports Venues & Event Management"
              ATHLETE_MANAGEMENT_TALENT_AGENCIES = :"Athlete Management & Talent Agencies"
              SPORTS_TECH_PERFORMANCE_ANALYTICS = :"Sports Tech & Performance Analytics"
              YOUTH_AMATEUR_COLLEGIATE_SPORTS = :"Youth, Amateur & Collegiate Sports"
              REAL_ESTATE_MARKETPLACES = :"Real Estate Marketplaces"
              PROPERTY_MANAGEMENT_SOFTWARE = :"Property Management Software"
              RENTAL_PLATFORMS = :"Rental Platforms"
              MORTGAGE_LENDING_TECH = :"Mortgage & Lending Tech"
              REAL_ESTATE_INVESTMENT_PLATFORMS = :"Real Estate Investment Platforms"
              LAW_FIRMS_LEGAL_SERVICES = :"Law Firms & Legal Services"
              LEGAL_TECH_AUTOMATION = :"Legal Tech & Automation"
              REGULATORY_COMPLIANCE = :"Regulatory Compliance"
              E_DISCOVERY_LITIGATION_TOOLS = :"E-Discovery & Litigation Tools"
              CONTRACT_MANAGEMENT = :"Contract Management"
              GOVERNANCE_RISK_COMPLIANCE_GRC = :"Governance, Risk & Compliance (GRC)"
              IP_TRADEMARK_MANAGEMENT = :"IP & Trademark Management"
              LEGAL_RESEARCH_INTELLIGENCE = :"Legal Research & Intelligence"
              COMPLIANCE_TRAINING_CERTIFICATION = :"Compliance Training & Certification"
              WHISTLEBLOWER_ETHICS_REPORTING = :"Whistleblower & Ethics Reporting"
              MOBILE_WIRELESS_NETWORKS_3_G_4_G_5_G = :"Mobile & Wireless Networks (3G/4G/5G)"
              BROADBAND_FIBER_INTERNET = :"Broadband & Fiber Internet"
              SATELLITE_SPACE_BASED_COMMUNICATIONS = :"Satellite & Space-Based Communications"
              NETWORK_EQUIPMENT_INFRASTRUCTURE = :"Network Equipment & Infrastructure"
              TELECOM_BILLING_OSS_BSS_SYSTEMS = :"Telecom Billing & OSS/BSS Systems"
              VO_IP_UNIFIED_COMMUNICATIONS = :"VoIP & Unified Communications"
              INTERNET_SERVICE_PROVIDERS_IS_PS = :"Internet Service Providers (ISPs)"
              EDGE_COMPUTING_NETWORK_VIRTUALIZATION = :"Edge Computing & Network Virtualization"
              IO_T_CONNECTIVITY_PLATFORMS = :"IoT Connectivity Platforms"
              PRECISION_AGRICULTURE_AG_TECH = :"Precision Agriculture & AgTech"
              CROP_LIVESTOCK_PRODUCTION = :"Crop & Livestock Production"
              FOOD_BEVERAGE_MANUFACTURING_PROCESSING = :"Food & Beverage Manufacturing & Processing"
              FOOD_DISTRIBUTION = :"Food Distribution"
              RESTAURANTS_FOOD_SERVICE = :"Restaurants & Food Service"
              AGRICULTURAL_INPUTS_EQUIPMENT = :"Agricultural Inputs & Equipment"
              SUSTAINABLE_REGENERATIVE_AGRICULTURE = :"Sustainable & Regenerative Agriculture"
              SEAFOOD_AQUACULTURE = :"Seafood & Aquaculture"
              MANAGEMENT_CONSULTING = :"Management Consulting"
              MARKETING_ADVERTISING_AGENCIES = :"Marketing & Advertising Agencies"
              DESIGN_BRANDING_CREATIVE_STUDIOS = :"Design, Branding & Creative Studios"
              IT_SERVICES_MANAGED_SERVICES = :"IT Services & Managed Services"
              STAFFING_RECRUITING_TALENT = :"Staffing, Recruiting & Talent"
              ACCOUNTING_TAX_FIRMS = :"Accounting & Tax Firms"
              PUBLIC_RELATIONS_COMMUNICATIONS = :"Public Relations & Communications"
              BUSINESS_PROCESS_OUTSOURCING_BPO = :"Business Process Outsourcing (BPO)"
              PROFESSIONAL_TRAINING_COACHING = :"Professional Training & Coaching"
              SPECIALTY_CHEMICALS = :"Specialty Chemicals"
              COMMODITY_PETROCHEMICALS = :"Commodity & Petrochemicals"
              POLYMERS_PLASTICS_RUBBER = :"Polymers, Plastics & Rubber"
              COATINGS_ADHESIVES_SEALANTS = :"Coatings, Adhesives & Sealants"
              INDUSTRIAL_GASES = :"Industrial Gases"
              ADVANCED_MATERIALS_COMPOSITES = :"Advanced Materials & Composites"
              BATTERY_MATERIALS_ENERGY_STORAGE = :"Battery Materials & Energy Storage"
              ELECTRONIC_MATERIALS_SEMICONDUCTOR_CHEMICALS = :"Electronic Materials & Semiconductor Chemicals"
              AGROCHEMICALS_FERTILIZERS = :"Agrochemicals & Fertilizers"
              FREIGHT_TRANSPORTATION_TECH = :"Freight & Transportation Tech"
              LAST_MILE_DELIVERY = :"Last-Mile Delivery"
              WAREHOUSE_AUTOMATION = :"Warehouse Automation"
              SUPPLY_CHAIN_VISIBILITY_PLATFORMS = :"Supply Chain Visibility Platforms"
              LOGISTICS_MARKETPLACES = :"Logistics Marketplaces"
              SHIPPING_FREIGHT_FORWARDING = :"Shipping & Freight Forwarding"
              COLD_CHAIN_LOGISTICS = :"Cold Chain Logistics"
              REVERSE_LOGISTICS_RETURNS = :"Reverse Logistics & Returns"
              CROSS_BORDER_TRADE_TECH = :"Cross-Border Trade Tech"
              TRANSPORTATION_MANAGEMENT_SYSTEMS_TMS = :"Transportation Management Systems (TMS)"
              HOTELS_ACCOMMODATION = :"Hotels & Accommodation"
              VACATION_RENTALS_SHORT_TERM_STAYS = :"Vacation Rentals & Short-Term Stays"
              RESTAURANT_TECH_MANAGEMENT = :"Restaurant Tech & Management"
              TRAVEL_BOOKING_PLATFORMS = :"Travel Booking Platforms"
              TOURISM_EXPERIENCES_ACTIVITIES = :"Tourism Experiences & Activities"
              CRUISE_LINES_MARINE_TOURISM = :"Cruise Lines & Marine Tourism"
              HOSPITALITY_MANAGEMENT_SYSTEMS = :"Hospitality Management Systems"
              EVENT_VENUE_MANAGEMENT = :"Event & Venue Management"
              CORPORATE_TRAVEL_MANAGEMENT = :"Corporate Travel Management"
              TRAVEL_INSURANCE_PROTECTION = :"Travel Insurance & Protection"
              CONSTRUCTION_MANAGEMENT_SOFTWARE = :"Construction Management Software"
              BIM_CAD_DESIGN_TOOLS = :"BIM/CAD & Design Tools"
              CONSTRUCTION_MARKETPLACES = :"Construction Marketplaces"
              EQUIPMENT_RENTAL_MANAGEMENT = :"Equipment Rental & Management"
              BUILDING_MATERIALS_PROCUREMENT = :"Building Materials & Procurement"
              CONSTRUCTION_WORKFORCE_MANAGEMENT = :"Construction Workforce Management"
              PROJECT_ESTIMATION_BIDDING = :"Project Estimation & Bidding"
              MODULAR_PREFAB_CONSTRUCTION = :"Modular & Prefab Construction"
              CONSTRUCTION_SAFETY_COMPLIANCE = :"Construction Safety & Compliance"
              SMART_BUILDING_TECHNOLOGY = :"Smart Building Technology"
              FOOD_BEVERAGE_CPG = :"Food & Beverage CPG"
              HOME_PERSONAL_CARE_CPG = :"Home & Personal Care CPG"
              CPG_ANALYTICS_INSIGHTS = :"CPG Analytics & Insights"
              DIRECT_TO_CONSUMER_CPG_BRANDS = :"Direct-to-Consumer CPG Brands"
              CPG_SUPPLY_CHAIN_DISTRIBUTION = :"CPG Supply Chain & Distribution"
              PRIVATE_LABEL_MANUFACTURING = :"Private Label Manufacturing"
              CPG_RETAIL_INTELLIGENCE = :"CPG Retail Intelligence"
              SUSTAINABLE_CPG_PACKAGING = :"Sustainable CPG & Packaging"
              BEAUTY_COSMETICS_CPG = :"Beauty & Cosmetics CPG"
              HEALTH_WELLNESS_CPG = :"Health & Wellness CPG"

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end

        # @see ContextDev::Models::BrandRetrieveResponse::Brand#links
        class Links < ContextDev::Internal::Type::BaseModel
          # @!attribute blog
          #   URL of the blog or newsroom. `null` when not found.
          #
          #   @return [String, nil]
          optional :blog, String, nil?: true

          # @!attribute careers
          #   URL of the careers page. `null` when not found.
          #
          #   @return [String, nil]
          optional :careers, String, nil?: true

          # @!attribute contact
          #   URL of the contact page. `null` when not found.
          #
          #   @return [String, nil]
          optional :contact, String, nil?: true

          # @!attribute pricing
          #   URL of the pricing page. `null` when not found.
          #
          #   @return [String, nil]
          optional :pricing, String, nil?: true

          # @!attribute privacy
          #   URL of the privacy policy. `null` when not found.
          #
          #   @return [String, nil]
          optional :privacy, String, nil?: true

          # @!attribute terms
          #   URL of the terms of service. `null` when not found.
          #
          #   @return [String, nil]
          optional :terms, String, nil?: true

          # @!method initialize(blog: nil, careers: nil, contact: nil, pricing: nil, privacy: nil, terms: nil)
          #   Key pages on the brand's website.
          #
          #   @param blog [String, nil] URL of the blog or newsroom. `null` when not found.
          #
          #   @param careers [String, nil] URL of the careers page. `null` when not found.
          #
          #   @param contact [String, nil] URL of the contact page. `null` when not found.
          #
          #   @param pricing [String, nil] URL of the pricing page. `null` when not found.
          #
          #   @param privacy [String, nil] URL of the privacy policy. `null` when not found.
          #
          #   @param terms [String, nil] URL of the terms of service. `null` when not found.
        end

        class Logo < ContextDev::Internal::Type::BaseModel
          # @!attribute colors
          #   Colors in the logo.
          #
          #   @return [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Color>, nil]
          optional :colors,
                   -> { ContextDev::Internal::Type::ArrayOf[ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Color] }

          # @!attribute mode
          #   `light` works best in light mode, `dark` works best in dark mode, and
          #   `has_opaque_background` works in either because the image has its own
          #   background.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Mode, nil]
          optional :mode, enum: -> { ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Mode }

          # @!attribute resolution
          #   Size of the logo image.
          #
          #   @return [ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Resolution, nil]
          optional :resolution, -> { ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Resolution }

          # @!attribute type
          #   Whether the image is an `icon` or a full `logo`, based on its dimensions.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Type, nil]
          optional :type, enum: -> { ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Type }

          # @!attribute url
          #   URL of the hosted logo image.
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(colors: nil, mode: nil, resolution: nil, type: nil, url: nil)
          #   Some parameter documentations has been truncated, see
          #   {ContextDev::Models::BrandRetrieveResponse::Brand::Logo} for more details.
          #
          #   @param colors [Array<ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Color>] Colors in the logo.
          #
          #   @param mode [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Mode] `light` works best in light mode, `dark` works best in dark mode, and `has_opaqu
          #
          #   @param resolution [ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Resolution] Size of the logo image.
          #
          #   @param type [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Logo::Type] Whether the image is an `icon` or a full `logo`, based on its dimensions.
          #
          #   @param url [String] URL of the hosted logo image.

          class Color < ContextDev::Internal::Type::BaseModel
            # @!attribute hex
            #   Hex color code, such as `#635BFF`.
            #
            #   @return [String, nil]
            optional :hex, String

            # @!attribute name
            #   Human-readable color name.
            #
            #   @return [String, nil]
            optional :name, String

            # @!method initialize(hex: nil, name: nil)
            #   @param hex [String] Hex color code, such as `#635BFF`.
            #
            #   @param name [String] Human-readable color name.
          end

          # `light` works best in light mode, `dark` works best in dark mode, and
          # `has_opaque_background` works in either because the image has its own
          # background.
          #
          # @see ContextDev::Models::BrandRetrieveResponse::Brand::Logo#mode
          module Mode
            extend ContextDev::Internal::Type::Enum

            LIGHT = :light
            DARK = :dark
            HAS_OPAQUE_BACKGROUND = :has_opaque_background

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see ContextDev::Models::BrandRetrieveResponse::Brand::Logo#resolution
          class Resolution < ContextDev::Internal::Type::BaseModel
            # @!attribute aspect_ratio
            #   Aspect ratio, as width divided by height.
            #
            #   @return [Float, nil]
            optional :aspect_ratio, Float

            # @!attribute height
            #   Height, in pixels.
            #
            #   @return [Integer, nil]
            optional :height, Integer

            # @!attribute width
            #   Width, in pixels.
            #
            #   @return [Integer, nil]
            optional :width, Integer

            # @!method initialize(aspect_ratio: nil, height: nil, width: nil)
            #   Size of the logo image.
            #
            #   @param aspect_ratio [Float] Aspect ratio, as width divided by height.
            #
            #   @param height [Integer] Height, in pixels.
            #
            #   @param width [Integer] Width, in pixels.
          end

          # Whether the image is an `icon` or a full `logo`, based on its dimensions.
          #
          # @see ContextDev::Models::BrandRetrieveResponse::Brand::Logo#type
          module Type
            extend ContextDev::Internal::Type::Enum

            ICON = :icon
            LOGO = :logo

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # Lowercase language name, such as `english`.
        #
        # @see ContextDev::Models::BrandRetrieveResponse::Brand#primary_language
        module PrimaryLanguage
          extend ContextDev::Internal::Type::Enum

          AFRIKAANS = :afrikaans
          ALBANIAN = :albanian
          AMHARIC = :amharic
          ARABIC = :arabic
          ARMENIAN = :armenian
          ASSAMESE = :assamese
          AYMARA = :aymara
          AZERI = :azeri
          BASQUE = :basque
          BELARUSIAN = :belarusian
          BENGALI = :bengali
          BOSNIAN = :bosnian
          BULGARIAN = :bulgarian
          BURMESE = :burmese
          CANTONESE = :cantonese
          CATALAN = :catalan
          CEBUANO = :cebuano
          CHINESE = :chinese
          CORSICAN = :corsican
          CROATIAN = :croatian
          CZECH = :czech
          DANISH = :danish
          DUTCH = :dutch
          ENGLISH = :english
          ESPERANTO = :esperanto
          ESTONIAN = :estonian
          FARSI = :farsi
          FIJIAN = :fijian
          FINNISH = :finnish
          FRENCH = :french
          GALICIAN = :galician
          GEORGIAN = :georgian
          GERMAN = :german
          GREEK = :greek
          GUARANI = :guarani
          GUJARATI = :gujarati
          HAITIAN_CREOLE = :"haitian-creole"
          HAUSA = :hausa
          HAWAIIAN = :hawaiian
          HEBREW = :hebrew
          HINDI = :hindi
          HMONG = :hmong
          HUNGARIAN = :hungarian
          ICELANDIC = :icelandic
          IGBO = :igbo
          INDONESIAN = :indonesian
          IRISH = :irish
          ITALIAN = :italian
          JAPANESE = :japanese
          JAVANESE = :javanese
          KANNADA = :kannada
          KAZAKH = :kazakh
          KHMER = :khmer
          KINYARWANDA = :kinyarwanda
          KOREAN = :korean
          KURDISH = :kurdish
          KYRGYZ = :kyrgyz
          LAO = :lao
          LATIN = :latin
          LATVIAN = :latvian
          LINGALA = :lingala
          LITHUANIAN = :lithuanian
          LUXEMBOURGISH = :luxembourgish
          MACEDONIAN = :macedonian
          MALAGASY = :malagasy
          MALAY = :malay
          MALAYALAM = :malayalam
          MALTESE = :maltese
          MAORI = :maori
          MARATHI = :marathi
          MONGOLIAN = :mongolian
          NEPALI = :nepali
          NORWEGIAN = :norwegian
          ODIA = :odia
          OROMO = :oromo
          PASHTO = :pashto
          PIDGIN = :pidgin
          POLISH = :polish
          PORTUGUESE = :portuguese
          PUNJABI = :punjabi
          QUECHUA = :quechua
          ROMANIAN = :romanian
          RUSSIAN = :russian
          SAMOAN = :samoan
          SCOTTISH_GAELIC = :"scottish-gaelic"
          SERBIAN = :serbian
          SESOTHO = :sesotho
          SHONA = :shona
          SINDHI = :sindhi
          SINHALA = :sinhala
          SLOVAK = :slovak
          SLOVENE = :slovene
          SOMALI = :somali
          SPANISH = :spanish
          SUNDANESE = :sundanese
          SWAHILI = :swahili
          SWEDISH = :swedish
          TAGALOG = :tagalog
          TAJIK = :tajik
          TAMIL = :tamil
          TATAR = :tatar
          TELUGU = :telugu
          THAI = :thai
          TIBETAN = :tibetan
          TIGRINYA = :tigrinya
          TONGAN = :tongan
          TSWANA = :tswana
          TURKISH = :turkish
          TURKMEN = :turkmen
          UKRAINIAN = :ukrainian
          URDU = :urdu
          UYGHUR = :uyghur
          UZBEK = :uzbek
          VIETNAMESE = :vietnamese
          WELSH = :welsh
          WOLOF = :wolof
          XHOSA = :xhosa
          YIDDISH = :yiddish
          YORUBA = :yoruba
          ZULU = :zulu

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class Social < ContextDev::Internal::Type::BaseModel
          # @!attribute type
          #   Social platform.
          #
          #   @return [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Social::Type, nil]
          optional :type, enum: -> { ContextDev::Models::BrandRetrieveResponse::Brand::Social::Type }

          # @!attribute url
          #   URL of the brand's profile on that platform.
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(type: nil, url: nil)
          #   @param type [Symbol, ContextDev::Models::BrandRetrieveResponse::Brand::Social::Type] Social platform.
          #
          #   @param url [String] URL of the brand's profile on that platform.

          # Social platform.
          #
          # @see ContextDev::Models::BrandRetrieveResponse::Brand::Social#type
          module Type
            extend ContextDev::Internal::Type::Enum

            X = :x
            FACEBOOK = :facebook
            INSTAGRAM = :instagram
            LINKEDIN = :linkedin
            YOUTUBE = :youtube
            PINTEREST = :pinterest
            TIKTOK = :tiktok
            DRIBBBLE = :dribbble
            GITHUB = :github
            BEHANCE = :behance
            SNAPCHAT = :snapchat
            WHATSAPP = :whatsapp
            TELEGRAM = :telegram
            LINE = :line
            DISCORD = :discord
            TWITCH = :twitch
            VIMEO = :vimeo
            IMDB = :imdb
            TUMBLR = :tumblr
            FLICKR = :flickr
            GIPHY = :giphy
            MEDIUM = :medium
            SPOTIFY = :spotify
            SOUNDCLOUD = :soundcloud
            TRIPADVISOR = :tripadvisor
            YELP = :yelp
            PRODUCTHUNT = :producthunt
            REDDIT = :reddit
            CRUNCHBASE = :crunchbase
            APPSTORE = :appstore
            PLAYSTORE = :playstore

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see ContextDev::Models::BrandRetrieveResponse::Brand#stock
        class Stock < ContextDev::Internal::Type::BaseModel
          # @!attribute exchange
          #   Exchange the stock trades on.
          #
          #   @return [String, nil]
          optional :exchange, String

          # @!attribute ticker
          #   Stock ticker symbol.
          #
          #   @return [String, nil]
          optional :ticker, String

          # @!method initialize(exchange: nil, ticker: nil)
          #   Stock listing. Omitted when the company is not publicly traded.
          #
          #   @param exchange [String] Exchange the stock trades on.
          #
          #   @param ticker [String] Stock ticker symbol.
        end
      end

      # @see ContextDev::Models::BrandRetrieveResponse#cache_metadata
      class CacheMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute age_ms
        #   Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        #
        #   @return [Integer]
        required :age_ms, Integer

        # @!attribute status
        #   `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        #   retention bypassed the cache.
        #
        #   @return [Symbol, ContextDev::Models::BrandRetrieveResponse::CacheMetadata::Status]
        required :status, enum: -> { ContextDev::Models::BrandRetrieveResponse::CacheMetadata::Status }

        # @!method initialize(age_ms:, status:)
        #   Some parameter documentations has been truncated, see
        #   {ContextDev::Models::BrandRetrieveResponse::CacheMetadata} for more details.
        #
        #   Cache status of this response.
        #
        #   @param age_ms [Integer] Age of the cached data, in milliseconds. `0` for `miss` and `zdr`.
        #
        #   @param status [Symbol, ContextDev::Models::BrandRetrieveResponse::CacheMetadata::Status] `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data re

        # `hit` when served from cache, `miss` when fetched fresh, `zdr` when zero data
        # retention bypassed the cache.
        #
        # @see ContextDev::Models::BrandRetrieveResponse::CacheMetadata#status
        module Status
          extend ContextDev::Internal::Type::Enum

          HIT = :hit
          MISS = :miss
          ZDR = :zdr

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see ContextDev::Models::BrandRetrieveResponse#key_metadata
      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        # @!attribute credits_consumed
        #   Credits charged for this request.
        #
        #   @return [Integer]
        required :credits_consumed, Integer

        # @!attribute credits_remaining
        #   Credits your organization has left after this request.
        #
        #   @return [Integer]
        required :credits_remaining, Integer

        # @!method initialize(credits_consumed:, credits_remaining:)
        #   Credits this request used and your remaining balance.
        #
        #   @param credits_consumed [Integer] Credits charged for this request.
        #
        #   @param credits_remaining [Integer] Credits your organization has left after this request.
      end
    end
  end
end
