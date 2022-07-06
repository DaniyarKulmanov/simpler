# frozen_string_literal: true

class TestsController < Simpler::Controller
  def index
    @time = Time.now
    # render plain: 'Plain text response'
    render 'tests/list'
  end

  def create; end
end
