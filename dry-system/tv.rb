module DrySystem
  class Tv < Dry::System::Container
    configure do |config|
      config.root = Pathname(__dir__)

      config.auto_register = 'lib'
    end

    load_paths!('lib')
  end
end
