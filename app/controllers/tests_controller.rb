# frozen_string_literal: true

require_relative '../models/test'

class TestsController < Simpler::Controller
  def index
    @time = Time.now
    # render plain: 'Plain text response'
    # render 'tests/list'
    # status 201
    # headers 'Content-Type', 'text/plain'
  end

  def create; end

  def show
    @test = Test[params[:id]]
  end
end
