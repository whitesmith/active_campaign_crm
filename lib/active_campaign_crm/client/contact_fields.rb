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
        response = @connection.post('fields', contact_field_body(properties))
        response['field']
      end

      def add_relationship_to_field(field, rel)
        response = @connection.post('fieldRels', custom_rel_body(field, rel))
        response['fieldRel']
      end

      def custom_rel_body(field, rel)
        { 'fieldRel': {
          'field': field,
          'relid': rel
          }
        }.to_json
      end

      def contact_field_body(properties)
        { 'field': properties }.to_json
      end

      def update_contact_field(id, properties)
        response = @connection.put("fields/#{id}", contact_field_body(properties))
        response['field']
      end

      def delete_contact_field(id)
        response = @connection.delete("fields/#{id}")
      end
    end
  end
end
