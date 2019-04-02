module ActiveCampaignCrm
  class Client
    module ContactFields
      def contact_fields(params = {})
        response = @connection.get('fields', params)
        response['fields']
      end

      def contact_field(id)
        response = @connection.get("fields/#{id}")
        response['field']
      end

      def create_contact_field(properties)
        @connection.post('fields', contact_field_body(properties))
      end

      def contact_field_body(properties)
        { 'field': properties }.to_json
      end

      def update_contact_field(id, properties)
        @connection.put("fields/#{id}", contact_field_body(properties))
      end

      def delete_contact_field(id)
        @connection.delete("fields/#{id}")
      end
    end
  end
end
