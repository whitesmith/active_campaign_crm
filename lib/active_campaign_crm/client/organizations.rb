module ActiveCampaignCrm
  class Client
    module Organization
      def organizations(params = {})
        response = @connection.get('organizations', params)
        response['organizations']
      end

      def organization(id)
        response = @connection.get("organizations/#{id}")
        response['organization']
      end

      def create_organization(fields)
        @connection.post('organizations', organization_body(fields))
      end

      def update_organization(id, fields)
        @connection.put("organizations/#{id}", organization_body(fields))
      end

      def delete_organization(id)
        @connection.delete("organizations/#{id}")
      end

      def organization_body(fields)
        { 'organization': fields }.to_json
      end
    end
  end
end