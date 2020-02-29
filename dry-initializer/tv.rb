require "bundler/setup"

module DryInitializer
  class TV
    extend Dry::Initializer[undefined: false]
    # or include Dry::Initializer.define -> {} when you don't need subclassing

    param :manufacturer, proc(&:to_s), reader: false
    param :model, Dry::Types['strict.string']
    param :price, proc(&:to_f)
    option :sold, optional: true, default: proc { false }, reader: :private

    attr_writer :model
  end
end
