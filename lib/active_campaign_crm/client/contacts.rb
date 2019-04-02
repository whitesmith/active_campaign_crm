module ActiveCampaignCrm
  class Client
    module Contacts

      def contacts(params = {})
        response = @connection.get('contacts', params)
        response['contacts']
      end

      def contact(id)
        response = @connection.get("contacts/#{id}")
        response['contact']
      end
    end
  end
end
