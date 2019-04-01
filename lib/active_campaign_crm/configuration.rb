module ActiveCampaignCrm
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :account_url
    attr_accessor :api_key

    def initialize
      @account_url = nil
      @api_key = nil
    end
  end
end
