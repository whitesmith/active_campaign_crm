require 'active_campaign_crm/version'
require 'active_campaign_crm/client'
require 'active_campaign_crm/configuration'

module ActiveCampaignCrm

  def self.client
    ActiveCampaignCrm::Client.new(options)
  end
end
