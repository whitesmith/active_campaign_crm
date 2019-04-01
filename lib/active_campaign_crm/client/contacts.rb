module ActiveCampaignCrm
  class Client
    module Contacts

      def contacts
        response = @connection.get 'contacts'
        response['contacts']
      end
    end
  end
end
