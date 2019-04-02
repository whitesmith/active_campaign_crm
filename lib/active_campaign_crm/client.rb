module ActiveCampaignCrm
  class Client
    require 'active_campaign_crm/connection'

    Dir[File.expand_path('../client/*.rb', __FILE__)].each{ |f| require f }

    def initialize
      @connection = ActiveCampaignCrm::Connection.new
    end

    include ActiveCampaignCrm::Client::Contacts
    include ActiveCampaignCrm::Client::ContactFields
  end
end
