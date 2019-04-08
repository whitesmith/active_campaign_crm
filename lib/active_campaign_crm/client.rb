module ActiveCampaignCrm
  class Client
    require 'active_campaign_crm/connection'

    Dir[File.expand_path('../client/*.rb', __FILE__)].each { |f| require f }

    def initialize
      @connection = ActiveCampaignCrm::Connection.new
    end

    include ActiveCampaignCrm::Client::Contacts
    include ActiveCampaignCrm::Client::ContactFields
    include ActiveCampaignCrm::Client::CustomFieldValues
    include ActiveCampaignCrm::Client::Tags
    include ActiveCampaignCrm::Client::Organization
  end
end
