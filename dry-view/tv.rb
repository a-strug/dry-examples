require_relative "parts/tv.rb"

module DryView
  class Tv
    extend Dry::Initializer

    param :model, proc(&:to_s)
    param :description, optional: true, type: proc(&:to_s)
  end

  class TvView < Dry::View
    config.paths = [File.join(__dir__, "templates")]
    config.part_namespace = Parts
    config.layout = "application"
    config.template = "tvs/show"

    attr_reader :tv

    expose :tv do |model:, description:|
      @tv = Tv.new(model, description)
    end
  end
end
