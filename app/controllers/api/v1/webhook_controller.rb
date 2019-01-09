class Api::V1::WebhookController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    render json: {data: 'Listening...'}
  end

  def create
    params[:type] == "" ? type = "users" : type = params[:type]
    params[:filter_type] == "" ? ftype = nil : ftype = params[:filter_type]
    params[:filter_keyword] == "" ? fkw = nil : fkw = params[:filter_keyword]
    params[:page_size] == "" ? psize = nil : psize = params[:page_size]
    
    @webhook = ApiService.get_teamtailor_response(type, ftype, fkw, psize)
    File.open("./webhook.yaml", "w") { |file| file.write(@webhook.to_yaml) }

    render json: {data: 'All good.'}
  end

end
