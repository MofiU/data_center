module API
  module <%= version.camelize %>
    module Entities
      class ApiError < Grape::Entity
        expose :error_code, documentation: { type: Integer, desc: 'error code' }
        expose :message, documentation: { type: String, desc: 'error message' }
      end
    end
  end
end