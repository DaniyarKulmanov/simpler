# frozen_string_literal: true

module Simpler
  class Router
    class Route
      attr_reader :controller, :action

      def initialize(method, path, controller, action)
        @method = method
        @path = path
        @controller = controller
        @action = action
      end

      def match?(method, path)
        if match_format?(path)
          @method == method && @path.include?(':id')
        else
          @method == method && path.match(@path)
        end
      end

      def match_format?(path)
        format = /\W#{path.split('/')[1]}\W\d+/
        format.match?(path)
      end
    end
  end
end
