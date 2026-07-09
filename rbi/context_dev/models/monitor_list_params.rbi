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

      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Free-text search term, matched against the fields named in `search_by`.
      sig { returns(T.nilable(String)) }
      attr_reader :q

      sig { params(q: String).void }
      attr_writer :q

      # Comma-separated fields to search with `q`. Defaults to all of them. Note
      # `instructions` only exists on extract monitors.
      sig do
        returns(
          T.nilable(T::Array[ContextDev::MonitorListParams::SearchBy::OrSymbol])
        )
      end
      attr_reader :search_by

      sig do
        params(
          search_by: T::Array[ContextDev::MonitorListParams::SearchBy::OrSymbol]
        ).void
      end
      attr_writer :search_by

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

      # Monitor lifecycle status. `failed` means the most recent run failed (see the
      # monitor's `last_error`); failed monitors keep running on schedule and flip back
      # to `active` on the next successful run. Monitors are auto-`paused` after
      # repeated consecutive failures or insufficient-credit skips; resume by PATCHing
      # status to `active`.
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
      attr_reader :tags

      sig { params(tags: T::Array[String]).void }
      attr_writer :tags

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
            T::Array[ContextDev::MonitorListParams::SearchBy::OrSymbol],
          search_type: ContextDev::MonitorListParams::SearchType::OrSymbol,
          status: ContextDev::MonitorListParams::Status::OrSymbol,
          tag: String,
          tags: T::Array[String],
          target_type: ContextDev::MonitorListParams::TargetType::OrSymbol,
          request_options: ContextDev::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        change_detection_type: nil,
        cursor: nil,
        limit: nil,
        # Free-text search term, matched against the fields named in `search_by`.
        q: nil,
        # Comma-separated fields to search with `q`. Defaults to all of them. Note
        # `instructions` only exists on extract monitors.
        search_by: nil,
        # `prefix` for as-you-type prefix matching (default), `exact` for full-token
        # matching.
        search_type: nil,
        # Monitor lifecycle status. `failed` means the most recent run failed (see the
        # monitor's `last_error`); failed monitors keep running on schedule and flip back
        # to `active` on the next successful run. Monitors are auto-`paused` after
        # repeated consecutive failures or insufficient-credit skips; resume by PATCHing
        # status to `active`.
        status: nil,
        # Filter to items that have this tag.
        tag: nil,
        # Comma-separated list of tags to filter by (matches monitors having any of them).
        tags: nil,
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
              T::Array[ContextDev::MonitorListParams::SearchBy::OrSymbol],
            search_type: ContextDev::MonitorListParams::SearchType::OrSymbol,
            status: ContextDev::MonitorListParams::Status::OrSymbol,
            tag: String,
            tags: T::Array[String],
            target_type: ContextDev::MonitorListParams::TargetType::OrSymbol,
            request_options: ContextDev::RequestOptions
          }
        )
      end
      def to_hash
      end

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

      # Monitor lifecycle status. `failed` means the most recent run failed (see the
      # monitor's `last_error`); failed monitors keep running on schedule and flip back
      # to `active` on the next successful run. Monitors are auto-`paused` after
      # repeated consecutive failures or insufficient-credit skips; resume by PATCHing
      # status to `active`.
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
