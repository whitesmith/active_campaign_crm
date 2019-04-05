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
        response = @connection.post('contacts', contact_body(fields))
        response['contact']
      end

      def sync_contact(fields)
        response = @connection.post('contact/sync', contact_body(fields))
        response['contact']
      end

      def update_contact(id, fields)
        response = @connection.put("contacts/#{id}", contact_body(fields))
        response['contact']
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
