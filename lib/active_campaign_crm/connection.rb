module ActiveCampaignCrm
  class Connection
    require 'faraday'
    require 'json'
    def initialize
      # TODO: raise exception if account_url is not defined
      # TODO: raise exception if api_key is not defined
      @connection = Faraday.new(
        url: "#{ActiveCampaignCrm.configuration.account_url}/api/3"
      )
    end

    def get(url, params = {})
      response = @connection.get do |req|
        req.url url
        req.headers['Api-Token'] = ActiveCampaignCrm.configuration.api_key
        req.params = params
      end
      JSON.parse response.body
    end

    def post(url, body)
      @connection.post do |req|
        req.url url
        req.headers['Api-Token'] = ActiveCampaignCrm.configuration.api_key
        req.body = body
      end
    end

    def put(url, body)
      @connection.put do |req|
        req.url url
        req.headers['Api-Token'] = ActiveCampaignCrm.configuration.api_key
        req.body = body
      end
    end

    def delete(url)
      @connection.delete do |req|
        req.url url
        req.headers['Api-Token'] = ActiveCampaignCrm.configuration.api_key
      end
    end
  end
end
