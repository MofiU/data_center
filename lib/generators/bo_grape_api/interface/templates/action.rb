module API
  module <%= version.camelize %>
    module <%= resource_name.camelize %>
      class <%= action_name.camelize %>Action < Grape::API
        resources :<%= resource_name %> do
          desc "<%= action_name %>"
          params do
            # TODO write params here
            # eg:
            #   requires :id,     type: Integer, desc: 'id'
            #   optional :name,   type: String,  desc: 'name'
          end
          <%= http_method %> '<%= action_name %>' do
            # TODO
            # Something here...
            # eg
            #   Article.all
          end
        end
      end
    end
  end
end