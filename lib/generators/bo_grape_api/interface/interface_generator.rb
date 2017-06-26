module BoGrapeApi
  class InterfaceGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :version, :type => :string
    argument :resource_name, :type => :string
    argument :action_name, :type => :string
    argument :http_method, :type => :string, :default => :get

    def create_api_template
      template 'action.rb', "app/controllers/api/#{version}/#{resource_name}/#{action_name}_action.rb"
    end

  end
end
