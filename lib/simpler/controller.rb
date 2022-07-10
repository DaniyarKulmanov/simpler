# frozen_string_literal: true

require_relative 'view'

module Simpler
  class Controller
    attr_reader :name, :request, :response, :params

    def initialize(env)
      @name = extract_name
      @request = Rack::Request.new(env)
      @response = Rack::Response.new
      @params = extract_params
    end

    def make_response(action)
      @request.env['simpler.controller'] = self
      @request.env['simpler.action'] = action

      set_default_headers
      send(action)
      write_response if @response['Content-Type'] == 'text/html'

      @response.finish
    end

    private

    def extract_params
      id = @request.env['REQUEST_PATH'].split('/')[-1]
      @params = id =~ /\d/ ? { id: id } : {}
      @request.params.merge(@params)
    end

    def extract_name
      self.class.name.match('(?<name>.+)Controller')[:name].downcase
    end

    def set_default_headers
      headers 'Content-Type', 'text/html'
    end

    def write_response
      body = render_body

      @response.write(body)
    end

    def render_body
      View.new(@request.env).render(binding)
    end

    def render(template)

      if plain?(template)
        headers 'Content-Type', 'text/pain'
        @response.write(template[:plain])
      else
        @request.env['simpler.template'] = template
      end
    end

    def plain?(template)
      template.is_a?(Hash) && template.key?(:plain)
    end

    def status(number)
      @response.status = number
    end

    def headers(header, value)
      @response[header] = value
    end
  end
end
