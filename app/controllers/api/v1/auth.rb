module API
  module V1
    class Auth < Grape::API
      format :json

        desc 'get_token'
        params do
          requires :name, type: String, desc: 'username'
          requires :password, type: String, desc: 'password'
        end

        post 'get_token' do
          user = User.find_by_name(params[:name])
          if user && user.authenticate(params[:password])
            token = TokenAuthenticate::ApiToken.issue_token({name: user.name, passwrod: user.password_digest})
            user.update!(token: token)
            { error_message: 'success', token: token }
          else
            { error_message: 'invalid username or password', error_code: 404 }
          end
        end

    end
  end
end