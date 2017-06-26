module API
  module V1
    module Entities
      class ApiError < Grape::Entity
        expose :error_code, documentation: { type: Integer, desc: '状态码' }
        expose :message, documentation: { type: String, desc: '状态信息' }
      end
    end
  end
end