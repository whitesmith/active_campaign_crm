module ActiveCampaignCrm
  class Client
    module Contacts

      def contacts(params = {})
        response = @connection.get('contacts', params)
        response['contacts']
      end
    end
  end
end
