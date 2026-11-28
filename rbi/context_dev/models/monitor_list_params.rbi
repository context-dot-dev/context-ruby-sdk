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

      # Cursor from the previous page's `next_cursor`. Omit for the first page.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Maximum number of monitors to return per page. Defaults to 25.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Text to search for in the fields listed in `search_by`.
      sig { returns(T.nilable(String)) }
      attr_reader :q

      sig { params(q: String).void }
      attr_writer :q

      # Comma-separated fields to search with `q`. Defaults to all fields. For search
      # targets, `url` matches the target's `query`.
      sig do
        returns(
          T.nilable(T::Array[ContextDev::MonitorListParams::SearchBy::OrSymbol])
        )
      end
      attr_accessor :search_by

      # How `q` matches. `prefix` matches the start of words and tolerates one typo, for
      # search as you type; `exact` matches whole words only. Defaults to `prefix`.
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

      # Filter by monitor status.
      sig do
        returns(T.nilable(ContextDev::MonitorListParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: ContextDev::MonitorListParams::Status::OrSymbol).void
      end
      attr_writer :status

      # Comma-separated tags. Returns monitors that have any of them.
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
          tags: T.nilable(T::Array[String]),
          target_type: ContextDev::MonitorListParams::TargetType::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter by change detection type.
        change_detection_type: nil,
        # Cursor from the previous page's `next_cursor`. Omit for the first page.
        cursor: nil,
        # Maximum number of monitors to return per page. Defaults to 25.
        limit: nil,
        # Text to search for in the fields listed in `search_by`.
        q: nil,
        # Comma-separated fields to search with `q`. Defaults to all fields. For search
        # targets, `url` matches the target's `query`.
        search_by: nil,
        # How `q` matches. `prefix` matches the start of words and tolerates one typo, for
        # search as you type; `exact` matches whole words only. Defaults to `prefix`.
        search_type: nil,
        # Filter by monitor status.
        status: nil,
        # Comma-separated tags. Returns monitors that have any of them.
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

      # How `q` matches. `prefix` matches the start of words and tolerates one typo, for
      # search as you type; `exact` matches whole words only. Defaults to `prefix`.
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

      # Filter by monitor status.
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
        SEARCH =
          T.let(
            :search,
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
