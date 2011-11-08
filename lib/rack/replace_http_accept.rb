require 'rack'

module Rack
  class ReplaceHttpAccept
    def initialize(app, replacements = {})
      @app = app
      @replacements = replacements
    end

    def call(env)
      @replacements.each do |regex, replacement|
        if Regexp.new(regex).match(env.fetch('HTTP_ACCEPT', ''))
          env['HTTP_ACCEPT'] = replacement 
          break
        end
      end
      
      @app.call(env)
    end
  end
end