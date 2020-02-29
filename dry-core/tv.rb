require "bundler/setup"
require "dry/core/cache"
require "dry/core/constants"
require 'dry/core/class_attributes'
require 'dry/core/class_builder'
require 'dry/core/deprecations'
require 'dry/core/extensions'

module DryCore
  builder = Dry::Core::ClassBuilder.new(name: 'DryCore::TV')

  tv = builder.call

  tv.class_eval do
    extend Dry::Core::Cache
    extend Dry::Core::ClassAttributes
    extend Dry::Core::Deprecations[:WARN]
    extend Dry::Core::Extensions

    defines :clear_cache

    clear_cache instance_variable_set(:@__cache__, Concurrent::Map.new)

    def initialize(name = Dry::Core::Constants::EMPTY_STRING)
      @name = name
    end

    attr_reader :name

    register_extension(:display_calculations) do
      def calculate_display_size_in_centimeters(pixel_length:, pixel_width:)
        perform_calculations(pixel_length, pixel_width)
      end

      def display_in_centimeters(pixel_length:, pixel_width:)
        perform_calculations(pixel_length, pixel_width)
      end

      deprecate :calculate_display_size_in_centimeters, :display_in_centimeters

      def perform_calculations(pixel_length, pixel_width)
        fetch_or_store(name, pixel_length, pixel_width) do
          {
            name: name,
            length: pixel_length * 0.02635872298,
            width: pixel_width * 0.02635872298
          }
        end
      end
    end
  end

  TV = tv
end
