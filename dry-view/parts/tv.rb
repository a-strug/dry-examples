module DryView
  module Parts
    class Tv < Dry::View::Part
      def detailed_description
        "Here is detailed description: #{description}"
      end
    end
  end
end
