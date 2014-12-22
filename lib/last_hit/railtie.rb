require 'rails'

module LastHit
  class Railtie < Rails::Railtie
    rake_tasks do
      Dir.glob("#{File.dirname(__FILE__)}/../tasks/*.rake", &method(:load))
    end
  end
end
