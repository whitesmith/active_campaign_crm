module ActiveCampaignCrm
  class Client
    module CustomFieldValues
      def custom_field_values(params = {})
        response = @connection.get('fieldValues', params)
        response['fieldValues']
      end

      def custom_field_value(id)
        response = @connection.get("fieldValues/#{id}")
        response['fieldValue']
      end

      def create_custom_field_value(properties)
        response = @connection.post('fieldValues', custom_field_value_body(properties))
        response['fieldValue']
      end

      def update_custom_field_value(id, properties)
        response = @connection.put("fieldValues/#{id}", custom_field_value_body(properties))
        response['fieldValue']
      end

      def delete_custom_field_value(id)
        @connection.delete("fieldValues/#{id}")
      end

      def custom_field_value_body(properties)
        { 'fieldValue': properties }.to_json
      end
    end
  end
end
