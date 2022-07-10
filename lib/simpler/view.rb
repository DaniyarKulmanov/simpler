# frozen_string_literal: true

require 'erb'

module Simpler
  class View
    VIEW_BASE_PATH = 'app/views'

    def initialize(env)
      @env = env
    end

    def render(binding)
      template = File.read(template_path)

      ERB.new(template).result(binding)
    end

    private

    def controller
      @env['simpler.controller']
    end

    def action
      @env['simpler.action']
    end

    def template
      @env['simpler.template']
    end

    def template_path
      path = template || [controller.name, action].join('/')
      view = "#{path}.html.erb"

      @env['simpler.logger'].info('Response') { "#{controller.response.status} #{[controller.response.headers]} #{view}" }

      Simpler.root.join(VIEW_BASE_PATH, view)
    end
  end
end
