module DryMatcher
  class Tv
    class << self
      def case(v)
        Dry::Matcher::Case.new do |(code, value), _|
          if code == v
            value
          else
            Dry::Matcher::Undefined
          end
        end
      end
    end

    attr_accessor :model

    def valid?
      !model.nil?
    end
  end
end
