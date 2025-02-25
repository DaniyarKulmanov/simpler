# frozen_string_literal: true

require 'logger'

class AppLogger

  def initialize(app, **options)
    @logger = Logger.new(options[:logdev] || $stdout)
    @app = app
  end

  def call(env)
    env['simpler.logger'] = @logger
    @app.call(env)
  end
end
