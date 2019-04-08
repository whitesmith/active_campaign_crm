module ActiveCampaignCrm
  class Client
    # Organization Interface
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
        response = @connection.post('organizations', organization_body(fields))
        response['organization']
      end

      def find_or_create_organization(name)
        organizations = organizations("filters[name]": name)
        return organization[0] if organizations.any?

        create_organization(name: name)
      end

      def update_organization(id, fields)
        response = @connection.put("organizations/#{id}",
                                   organization_body(fields))
        response['organization']
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
