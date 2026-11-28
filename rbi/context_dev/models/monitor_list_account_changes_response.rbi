# typed: strong

module ContextDev
  module Models
    class MonitorListAccountChangesResponse < ContextDev::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            ContextDev::Models::MonitorListAccountChangesResponse,
            ContextDev::Internal::AnyHash
          )
        end

      # Changes on this page.
      sig do
        returns(
          T::Array[ContextDev::Models::MonitorListAccountChangesResponse::Data]
        )
      end
      attr_accessor :data

      # Whether more results are available after this page.
      sig { returns(T::Boolean) }
      attr_accessor :has_more

      # Pass as `cursor` to fetch the next page. `null` on the last page.
      sig { returns(T.nilable(String)) }
      attr_accessor :next_cursor

      # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
      # support.
      sig { returns(String) }
      attr_accessor :request_id

      # Credits this request used and your remaining balance.
      sig do
        returns(
          T.nilable(
            ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata
          )
        )
      end
      attr_reader :key_metadata

      sig do
        params(
          key_metadata:
            ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata::OrHash
        ).void
      end
      attr_writer :key_metadata

      sig do
        params(
          data:
            T::Array[
              ContextDev::Models::MonitorListAccountChangesResponse::Data::OrHash
            ],
          has_more: T::Boolean,
          next_cursor: T.nilable(String),
          request_id: String,
          key_metadata:
            ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Changes on this page.
        data:,
        # Whether more results are available after this page.
        has_more:,
        # Pass as `cursor` to fetch the next page. `null` on the last page.
        next_cursor:,
        # Unique ID of this request, also in `X-Request-Id`. Include it when contacting
        # support.
        request_id:,
        # Credits this request used and your remaining balance.
        key_metadata: nil
      )
      end

      sig do
        override.returns(
          {
            data:
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data
              ],
            has_more: T::Boolean,
            next_cursor: T.nilable(String),
            request_id: String,
            key_metadata:
              ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata
          }
        )
      end
      def to_hash
      end

      class Data < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListAccountChangesResponse::Data,
              ContextDev::Internal::AnyHash
            )
          end

        # Unique ID of the change.
        sig { returns(String) }
        attr_accessor :id

        # Change detection type the monitor uses.
        sig do
          returns(
            ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::TaggedSymbol
          )
        end
        attr_accessor :change_detection_type

        # When the change was detected.
        sig { returns(Time) }
        attr_accessor :detected_at

        # Monitor category. Always `web`.
        sig do
          returns(
            ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode::TaggedSymbol
          )
        end
        attr_accessor :mode

        # ID of the monitor that detected the change.
        sig { returns(String) }
        attr_accessor :monitor_id

        # ID of the run that detected the change.
        sig { returns(String) }
        attr_accessor :run_id

        # Plain-language summary of what changed.
        sig { returns(String) }
        attr_accessor :summary

        # Tags the monitor had when the change was detected.
        sig { returns(T::Array[String]) }
        attr_accessor :tags

        # Type of target the monitor watches.
        sig do
          returns(
            ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
          )
        end
        attr_accessor :target_type

        # Short headline for the change.
        sig { returns(String) }
        attr_accessor :title

        # Monitored URL. For search targets, the first new result.
        sig { returns(String) }
        attr_accessor :url

        # Total number of URLs added.
        sig { returns(T.nilable(Integer)) }
        attr_reader :added_url_count

        sig { params(added_url_count: Integer).void }
        attr_writer :added_url_count

        # URLs added to the sitemap, up to 500. `added_url_count` has the full count.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :added_urls

        sig { params(added_urls: T::Array[String]).void }
        attr_writer :added_urls

        # Excerpt of the page text after the change. Page targets only.
        sig { returns(T.nilable(String)) }
        attr_reader :after_text_excerpt

        sig { params(after_text_excerpt: String).void }
        attr_writer :after_text_excerpt

        # Excerpt of the page text before the change. Page targets only.
        sig { returns(T.nilable(String)) }
        attr_reader :before_text_excerpt

        sig { params(before_text_excerpt: String).void }
        attr_writer :before_text_excerpt

        # Confidence that the change matters, from 0 to 1. Set by `semantic` detection
        # only.
        sig { returns(T.nilable(Float)) }
        attr_reader :confidence

        sig { params(confidence: Float).void }
        attr_writer :confidence

        # Text diff of the change, for page and extract targets. Extract diffs have one
        # section per changed page.
        sig { returns(T.nilable(String)) }
        attr_reader :diff

        sig { params(diff: String).void }
        attr_writer :diff

        # Before and after excerpts that support the change.
        sig do
          returns(
            T.nilable(
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence
              ]
            )
          )
        end
        attr_reader :evidence

        sig do
          params(
            evidence:
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence::OrHash
              ]
          ).void
        end
        attr_writer :evidence

        # How important the change is. Set by `semantic` detection only.
        sig do
          returns(
            T.nilable(
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol
            )
          )
        end
        attr_reader :importance

        sig do
          params(
            importance:
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::OrSymbol
          ).void
        end
        attr_writer :importance

        # Total number of matched URLs.
        sig { returns(T.nilable(Integer)) }
        attr_reader :matched_url_count

        sig { params(matched_url_count: Integer).void }
        attr_writer :matched_url_count

        # URLs where the change was found: the changed pages for page and extract targets,
        # or the new results for search targets. Up to 500; `matched_url_count` has the
        # full count.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :matched_urls

        sig { params(matched_urls: T::Array[String]).void }
        attr_writer :matched_urls

        # Total number of URLs removed.
        sig { returns(T.nilable(Integer)) }
        attr_reader :removed_url_count

        sig { params(removed_url_count: Integer).void }
        attr_writer :removed_url_count

        # URLs removed from the sitemap, or pages no longer found for extract targets, up
        # to 500. `removed_url_count` has the full count.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :removed_urls

        sig { params(removed_urls: T::Array[String]).void }
        attr_writer :removed_urls

        # A change detected by a monitor run, with a summary and, depending on the target,
        # a text diff, added or removed URLs, matched results, and evidence.
        sig do
          params(
            id: String,
            change_detection_type:
              ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::OrSymbol,
            detected_at: Time,
            mode:
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode::OrSymbol,
            monitor_id: String,
            run_id: String,
            summary: String,
            tags: T::Array[String],
            target_type:
              ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::OrSymbol,
            title: String,
            url: String,
            added_url_count: Integer,
            added_urls: T::Array[String],
            after_text_excerpt: String,
            before_text_excerpt: String,
            confidence: Float,
            diff: String,
            evidence:
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence::OrHash
              ],
            importance:
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::OrSymbol,
            matched_url_count: Integer,
            matched_urls: T::Array[String],
            removed_url_count: Integer,
            removed_urls: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Unique ID of the change.
          id:,
          # Change detection type the monitor uses.
          change_detection_type:,
          # When the change was detected.
          detected_at:,
          # Monitor category. Always `web`.
          mode:,
          # ID of the monitor that detected the change.
          monitor_id:,
          # ID of the run that detected the change.
          run_id:,
          # Plain-language summary of what changed.
          summary:,
          # Tags the monitor had when the change was detected.
          tags:,
          # Type of target the monitor watches.
          target_type:,
          # Short headline for the change.
          title:,
          # Monitored URL. For search targets, the first new result.
          url:,
          # Total number of URLs added.
          added_url_count: nil,
          # URLs added to the sitemap, up to 500. `added_url_count` has the full count.
          added_urls: nil,
          # Excerpt of the page text after the change. Page targets only.
          after_text_excerpt: nil,
          # Excerpt of the page text before the change. Page targets only.
          before_text_excerpt: nil,
          # Confidence that the change matters, from 0 to 1. Set by `semantic` detection
          # only.
          confidence: nil,
          # Text diff of the change, for page and extract targets. Extract diffs have one
          # section per changed page.
          diff: nil,
          # Before and after excerpts that support the change.
          evidence: nil,
          # How important the change is. Set by `semantic` detection only.
          importance: nil,
          # Total number of matched URLs.
          matched_url_count: nil,
          # URLs where the change was found: the changed pages for page and extract targets,
          # or the new results for search targets. Up to 500; `matched_url_count` has the
          # full count.
          matched_urls: nil,
          # Total number of URLs removed.
          removed_url_count: nil,
          # URLs removed from the sitemap, or pages no longer found for extract targets, up
          # to 500. `removed_url_count` has the full count.
          removed_urls: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              change_detection_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::TaggedSymbol,
              detected_at: Time,
              mode:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode::TaggedSymbol,
              monitor_id: String,
              run_id: String,
              summary: String,
              tags: T::Array[String],
              target_type:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol,
              title: String,
              url: String,
              added_url_count: Integer,
              added_urls: T::Array[String],
              after_text_excerpt: String,
              before_text_excerpt: String,
              confidence: Float,
              diff: String,
              evidence:
                T::Array[
                  ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence
                ],
              importance:
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol,
              matched_url_count: Integer,
              matched_urls: T::Array[String],
              removed_url_count: Integer,
              removed_urls: T::Array[String]
            }
          )
        end
        def to_hash
        end

        # Change detection type the monitor uses.
        module ChangeDetectionType
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          EXACT =
            T.let(
              :exact,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::TaggedSymbol
            )
          SEMANTIC =
            T.let(
              :semantic,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::ChangeDetectionType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Monitor category. Always `web`.
        module Mode
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WEB =
            T.let(
              :web,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Mode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Type of target the monitor watches.
        module TargetType
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PAGE =
            T.let(
              :page,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
            )
          SITEMAP =
            T.let(
              :sitemap,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
            )
          EXTRACT =
            T.let(
              :extract,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
            )
          SEARCH =
            T.let(
              :search,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::TargetType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Evidence < ContextDev::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Evidence,
                ContextDev::Internal::AnyHash
              )
            end

          # Content after the change.
          sig { returns(String) }
          attr_accessor :after

          # Content before the change. Empty for new search results.
          sig { returns(String) }
          attr_accessor :before

          # Page the evidence comes from. Omitted when the evidence covers the whole target.
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          # Before and after excerpts that support a change.
          sig do
            params(after: String, before: String, url: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Content after the change.
            after:,
            # Content before the change. Empty for new search results.
            before:,
            # Page the evidence comes from. Omitted when the evidence covers the whole target.
            url: nil
          )
          end

          sig do
            override.returns({ after: String, before: String, url: String })
          end
          def to_hash
          end
        end

        # How important the change is. Set by `semantic` detection only.
        module Importance
          extend ContextDev::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOW =
            T.let(
              :low,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol
            )
          MEDIUM =
            T.let(
              :medium,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol
            )
          HIGH =
            T.let(
              :high,
              ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                ContextDev::Models::MonitorListAccountChangesResponse::Data::Importance::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class KeyMetadata < ContextDev::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              ContextDev::Models::MonitorListAccountChangesResponse::KeyMetadata,
              ContextDev::Internal::AnyHash
            )
          end

        # Credits charged for this request.
        sig { returns(Integer) }
        attr_accessor :credits_consumed

        # Credits your organization has left after this request.
        sig { returns(Integer) }
        attr_accessor :credits_remaining

        # Credits this request used and your remaining balance.
        sig do
          params(credits_consumed: Integer, credits_remaining: Integer).returns(
            T.attached_class
          )
        end
        def self.new(
          # Credits charged for this request.
          credits_consumed:,
          # Credits your organization has left after this request.
          credits_remaining:
        )
        end

        sig do
          override.returns(
            { credits_consumed: Integer, credits_remaining: Integer }
          )
        end
        def to_hash
        end
      end
    end
  end
end
