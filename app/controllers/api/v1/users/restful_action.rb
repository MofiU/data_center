module API
  module V1
    module Users
      class RestfulAction < Grape::API
        resources :users do

          desc "find all users"
          get  do
            User.all
          end

          desc 'find a user by id'
          params do
            requires :id,     type: Integer, desc: 'id'
          end
          get ':id' do
            User.find params[:id]
          end

          desc 'create a user'
          params do
            #   requires :name,     type: String, desc: 'name'
            #   optional :description,     type: String,  desc: 'description'
          end
          post 'create' do
            User.create(params)
          end

          desc 'update a user by id'
          params do
            requires :id,     type: Integer, desc: 'id'
            #   optional :description,     type: String,  desc: 'description'
          end
          put ':id' do
            User.find(params[:id]).update!(params)
          end

          desc 'destroy a user'
          params do
            requires :id,     type: Integer, desc: 'id'
          end
          delete ':id' do
            User.find(params[:id]).destroy!
          end

        end
      end
    end
  end
end