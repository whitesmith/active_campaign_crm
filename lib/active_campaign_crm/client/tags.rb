module ActiveCampaignCrm
  class Client
    # Tag Interface
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
        response = @connection.post('tags', tag_body(fields))
        tag_name = response['tag']['tag']
        ActiveCampaignCrm.cache[:tags][tag_name] = response['tag']['id']
        response['tag']
      end

      def cached_tag_id(tag)
        ActiveCampaignCrm.cache.dig(:tags, tag)
      end

      def sync_tag(tag, type, description)
        query = { 'filters[tag]': tag }
        tags = tags(query)
        if tags.any?
          ActiveCampaignCrm.cache[:tags][tag] = tags[0]['id']
          return tags[0]
        end

        create_tag(tag: tag, tagType: type, description: description)
      end

      def add_tag_to_contact(contact, tag)
        response = @connection.post('contactTags',
                                    contact_link_tag_body(contact, tag))
        response['contactTag']
      end

      def update_tag(id, fields)
        response = @connection.put("tags/#{id}", tag_body(fields))
        response['tag']
      end

      def delete_tag(id)
        @connection.delete("tags/#{id}")
      end

      def contact_link_tag_body(contact, tag)
        {
          'contactTag': {
            'contact': contact,
            'tag': tag
          }
        }.to_json
      end

      def tag_body(fields)
        { 'tag': fields }.to_json
      end
    end
  end
end
