require 'http'
require 'json'

module ApiService  
  
  def self.get_teamtailor_response(type = "users", filter_type = nil, filter_keyword = nil, page_size = nil)

    @base_url = "https://api.teamtailor.com/v1/#{type}"
    @auth = "Bearer #{Rails.application.credentials.teamtailor[:api_key]}"
    @version = {"X-Api-Version": "20161108"}
    @header = {"Authorization": "Bearer 05XAdnmqLol5tBLlGHGXLivoWeJa9nXOTPCRD_FI", "X-Api-Version": "20161108"}
    @params = {"filter[#{filter_type}]" => filter_keyword, "page[size]" => page_size} #{"filter[role]"=> "admin"} # {"page[size]" => nil} #{"include" => "location"} #{"filter[name]"=> "Robin Börjesson"}
    
    response = HTTP.auth(@auth).headers(@version).get(@base_url, params: @params)
    formatted_response = JSON.parse(response)
  end
end