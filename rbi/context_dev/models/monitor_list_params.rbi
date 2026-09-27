# typed: strong

module ContextDev
  module Models
    class MonitorListParams < ContextDev::Internal::Type::BaseModel
      extend ContextDev::Internal::Type::RequestParameters::Converter
      include ContextDev::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(ContextDev::MonitorListParams, ContextDev::Internal::AnyHash)
        end

      # Filter by change detection type.
      sig do
        returns(
          T.nilable(
            ContextDev::MonitorListParams::ChangeDetectionType::OrSymbol
          )
        )
      end
      attr_reader :change_detection_type

      sig do
        params(
          change_detection_type:
            ContextDev::MonitorListParams::ChangeDetectionType::OrSymbol
        ).void
      end
      attr_writer :change_detection_type

      # Opaque pagination cursor from a previous response.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of items to return per page (1-100). Defaults to 25.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Free-text search term, matched against the fields named in `search_by`.
      sig { returns(T.nilable(String)) }
      attr_reader :q

      sig { params(q: String).void }
      attr_writer :q

      # Fields to search with `q`. Defaults to all fields; page and extract targets can
      # have instructions.
      sig do
        returns(
          T.nilable(T::Array[ContextDev::MonitorListParams::SearchBy::OrSymbol])
        )
      end
      attr_accessor :search_by

      # `prefix` for as-you-type prefix matching (default), `exact` for full-token
      # matching.
      sig do
        returns(T.nilable(ContextDev::MonitorListParams::SearchType::OrSymbol))
      end
      attr_reader :search_type

      sig do
        params(
          search_type: ContextDev::MonitorListParams::SearchType::OrSymbol
        ).void
      end
      attr_writer :search_type

      # Filter monitors by lifecycle status.
      sig do
        returns(T.nilable(ContextDev::MonitorListParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: ContextDev::MonitorListParams::Status::OrSymbol).void
      end
      attr_writer :status

      # Filter to items that have this tag.
      sig { returns(T.nilable(String)) }
      attr_reader :tag

      sig { params(tag: String).void }
      attr_writer :tag

      # Comma-separated list of tags to filter by (matches monitors having any of them).
      sig { returns(T.nilable(T::Array[String])) }
      attr_accessor :tags

      # Filter by target type.
      sig do
        returns(T.nilable(ContextDev::MonitorListParams::TargetType::OrSymbol))
      end
      attr_reader :target_type

      sig do
        params(
          target_type: ContextDev::MonitorListParams::TargetType::OrSymbol
        ).void
      end
      attr_writer :target_type

      sig do
        params(
          change_detection_type:
            ContextDev::MonitorListParams::ChangeDetectionType::OrSymbol,
          cursor: String,
          limit: Integer,
          q: String,
          search_by:
            T.nilable(
              T::Array[ContextDev::MonitorListParams::SearchBy::OrSymbol]
            ),
          search_type: ContextDev::MonitorListParams::SearchType::OrSymbol,
          status: ContextDev::MonitorListParams::Status::OrSymbol,
          tag: String,
          tags: T.nilable(T::Array[String]),
          target_type: ContextDev::MonitorListParams::TargetType::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter by change detection type.
        change_detection_type: nil,
        # Opaque pagination cursor from a previous response.
        cursor: nil,
        # Maximum number of items to return per page (1-100). Defaults to 25.
        limit: nil,
        # Free-text search term, matched against the fields named in `search_by`.
        q: nil,
        # Fields to search with `q`. Defaults to all fields; page and extract targets can
        # have instructions.
        search_by: nil,
        # `prefix` for as-you-type prefix matching (default), `exact` for full-token
        # matching.
        search_type: nil,
        # Filter monitors by lifecycle status.
        status: nil,
        # Filter to items that have this tag.
        tag: nil,
        # Comma-separated list of tags to filter by (matches monitors having any of them).
        tags: nil,
        # Filter by target type.
        target_type: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            change_detection_type:
              ContextDev::MonitorListParams::ChangeDetectionType::OrSymbol,
            cursor: String,
            limit: Integer,
            q: String,
            search_by:
              T.nilable(
                T::Array[ContextDev::MonitorListParams::SearchBy::OrSymbol]
              ),
            search_type: ContextDev::MonitorListParams::SearchType::OrSymbol,
            status: ContextDev::MonitorListParams::Status::OrSymbol,
            tag: String,
            tags: T.nilable(T::Array[String]),
            target_type: ContextDev::MonitorListParams::TargetType::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Filter by change detection type.
      module ChangeDetectionType
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::MonitorListParams::ChangeDetectionType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXACT =
          T.let(
            :exact,
            ContextDev::MonitorListParams::ChangeDetectionType::TaggedSymbol
          )
        SEMANTIC =
          T.let(
            :semantic,
            ContextDev::MonitorListParams::ChangeDetectionType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              ContextDev::MonitorListParams::ChangeDetectionType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      module SearchBy
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::MonitorListParams::SearchBy)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NAME =
          T.let(:name, ContextDev::MonitorListParams::SearchBy::TaggedSymbol)
        URL = T.let(:url, ContextDev::MonitorListParams::SearchBy::TaggedSymbol)
        INSTRUCTIONS =
          T.let(
            :instructions,
            ContextDev::MonitorListParams::SearchBy::TaggedSymbol
          )
        TAGS =
          T.let(:tags, ContextDev::MonitorListParams::SearchBy::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::MonitorListParams::SearchBy::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # `prefix` for as-you-type prefix matching (default), `exact` for full-token
      # matching.
      module SearchType
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::MonitorListParams::SearchType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EXACT =
          T.let(:exact, ContextDev::MonitorListParams::SearchType::TaggedSymbol)
        PREFIX =
          T.let(
            :prefix,
            ContextDev::MonitorListParams::SearchType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::MonitorListParams::SearchType::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Filter monitors by lifecycle status.
      module Status
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, ContextDev::MonitorListParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACTIVE =
          T.let(:active, ContextDev::MonitorListParams::Status::TaggedSymbol)
        PAUSED =
          T.let(:paused, ContextDev::MonitorListParams::Status::TaggedSymbol)
        FAILED =
          T.let(:failed, ContextDev::MonitorListParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[ContextDev::MonitorListParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Filter by target type.
      module TargetType
        extend ContextDev::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, ContextDev::MonitorListParams::TargetType)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PAGE =
          T.let(:page, ContextDev::MonitorListParams::TargetType::TaggedSymbol)
        SITEMAP =
          T.let(
            :sitemap,
            ContextDev::MonitorListParams::TargetType::TaggedSymbol
          )
        EXTRACT =
          T.let(
            :extract,
            ContextDev::MonitorListParams::TargetType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[ContextDev::MonitorListParams::TargetType::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
