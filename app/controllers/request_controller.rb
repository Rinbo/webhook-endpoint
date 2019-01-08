class RequestController < ApplicationController
  require 'json'
  before_action :create

  def index
    @response
  end

  def new
   

  end

  def show
  end

  def create
    @response = ApiService.get_teamtailor_response(params[:job])
  end

  private
    
end
