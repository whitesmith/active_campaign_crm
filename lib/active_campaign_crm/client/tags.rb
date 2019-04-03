module ActiveCampaignCrm
  class Client
    module Tags
      def tags(params = {})
        response = @connection.get('tags', params)
        response['tags']
      end

      def tag(id)
        response = @connection.get("tags/#{id}")
        response['tag']
      end

      def create_tag(fields)
        @connection.post('tags', tag_body(fields))
      end

      def update_tag(id, fields)
        @connection.put("tags/#{id}", tag_body(fields))
      end

      def delete_tag(id)
        @connection.delete("tags/#{id}")
      end

      def tag_body(fields)
        { 'tag': fields }.to_json
      end
    end
  end
end
