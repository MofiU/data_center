module BoGrapeApi
  class RestfulGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :version, :type => :string
    argument :resource_name, :type => :string

    def install
      template 'restful.rb', "app/controllers/api/#{version}/#{resource_name}/restful_action.rb"
    end

  end
end
