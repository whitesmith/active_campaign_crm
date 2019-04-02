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

      def create_contact(fields)
        @connection.post('contacts', contact_body(fields))
      end

      def sync_contact(fields)
        @connection.post('contact/sync', contact_body(fields))
      end

      def update_contact(id, fields)
        @connection.put("contacts/#{id}", contact_body(fields))
      end

      def delete_contact(id)
        @connection.delete("contacts/#{id}")
      end

      def contact_body(fields)
        { 'contact': fields }.to_json
      end
    end
  end
end
