require "river/version"

module River
  extend ActiveSupport::Autoload

  autoload :Streamer
  autoload :ActionController
end

require 'river/railtie' if defined?(Rails)
