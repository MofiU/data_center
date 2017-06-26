module API
  module <%= version.camelize %>
    module <%= resource_name.camelize %>
      class RestfulAction < Grape::API
        resources :<%= resource_name %> do

          desc "find all <%= resource_name %>"
          get  do
            <%= resource_name.singularize.camelize %>.all
          end

          desc 'find a <%= resource_name.singularize %> by id'
          params do
            requires :id,     type: Integer, desc: 'id'
          end
          get ':id' do
            <%= resource_name.singularize.camelize %>.find params[:id]
          end

          desc 'create a <%= resource_name.singularize %>'
          params do
            #   requires :name,     type: String, desc: 'name'
            #   optional :description,     type: String,  desc: 'description'
          end
          post 'create' do
            <%= resource_name.singularize.camelize %>.create(params)
          end

          desc 'update a <%= resource_name.singularize %> by id'
          params do
            requires :id,     type: Integer, desc: 'id'
            #   optional :description,     type: String,  desc: 'description'
          end
          put ':id' do
            <%= resource_name.singularize.camelize %>.find(params[:id]).update!(params)
          end

          desc 'destroy a <%= resource_name.singularize %>'
          params do
            requires :id,     type: Integer, desc: 'id'
          end
          delete ':id' do
            <%= resource_name.singularize.camelize %>.find(params[:id]).destroy!
          end

        end
      end
    end
  end
end