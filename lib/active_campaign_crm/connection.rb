module ActiveCampaignCrm
  class Connection
    require 'faraday'
    require 'json'
    require 'active_campaign_crm/error'
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
      handle_response(response)
    end

    def post(url, body)
      response = @connection.post do |req|
        req.url url
        req.headers['Api-Token'] = ActiveCampaignCrm.configuration.api_key
        req.body = body
      end
      handle_response(response)
    end

    def put(url, body)
      response = @connection.put do |req|
        req.url url
        req.headers['Api-Token'] = ActiveCampaignCrm.configuration.api_key
        req.body = body
      end
      handle_response(response)
    end

    def delete(url)
      response = @connection.delete do |req|
        req.url url
        req.headers['Api-Token'] = ActiveCampaignCrm.configuration.api_key
      end
      handle_response(response)
    end

    def handle_response(response)
      return JSON.parse response.body if response.success?

      errors = JSON.parse(response.body)['errors']
      error_messages = errors.map { |error| error['title'] } unless errors.nil?
      error_message = error_messages.join('-') unless error_messages.nil?

      case response.status
      when 400
        raise ActiveCampaignCrm::BadRequest, error_message
      when 404
        raise ActiveCampaignCrm::NotFound, error_message
      when 429
        raise ActiveCampaignCrm::TooManyRequests, error_message
      when 500
        raise ActiveCampaignCrm::InternalServerError, error_message
      when 502
        raise ActiveCampaignCrm::BadGateway, error_message
      when 503
        raise ActiveCampaignCrm::ServiceUnavailable, error_message
      when 504
        raise ActiveCampaignCrm::GatewayTimeout, error_message
      else
        raise StandardError, error_message
      end
    end
  end
end
