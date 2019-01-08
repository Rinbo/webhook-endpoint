require 'rest-client'
require 'json'

module ApiService  
  
  def self.get_teamtailor_response(id)
    base_url = "https://api.teamtailor.com/v1/answers"
    headers = {Authorization: "Token #{Rails.application.credentials.teamtailor[:api_key]}",
              "X-Api-Version": "20161108"}

    url = "#{base_url}/#{id}"
              
    response = RestClient::Request.execute(method: :get, url: url,
                      headers: headers)

    #response = RestClient.get(url, { params: id, headers: headers})
    formatted_response = JSON.parse(response)    
  end
end