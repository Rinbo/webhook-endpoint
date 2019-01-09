class RequestController < ApplicationController
  require 'json'
  require 'yaml'

  def index
    webhook = YAML.load_file('./webhook.yaml') 
    store = YAML.load_file('./store.yaml')
    @response = store
    @webhook = webhook
  end

  def new
  end

  def show
  end

  def create

    params[:type] == "" ? type = "users" : type = params[:type]
    params[:filter_type] == "" ? ftype = nil : ftype = params[:filter_type]
    params[:filter_keyword] == "" ? fkw = nil : fkw = params[:filter_keyword]
    params[:page_size] == "" ? psize = nil : psize = params[:page_size]

    @response = ApiService.get_teamtailor_response(type, ftype, fkw, psize)
    File.open("./store.yaml", "w") { |file| file.write(@response.to_yaml) }
    redirect_to root_path
  end
   
end
