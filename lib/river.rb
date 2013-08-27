require "river/version"

module River
  extend ActiveSupport::Autoload

  autoload :Streamer
  autoload :ActionController
  autoload :Responder
end

require 'river/railtie' if defined?(Rails)
