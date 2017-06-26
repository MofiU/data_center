module BoGrapeApi
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :version, :type => :string

    def create_api_root
      template "base.rb", "app/controllers/api/#{version}/base.rb"
      template "defaults.rb", "app/controllers/api/#{version}/defaults.rb"
      template "api_error.rb", "app/controllers/api/#{version}/entities/api_error.rb"
    end

    def add_gem
      gem 'grape'
      gem 'grape-entity'
      gem 'hashie-forbidden_attributes'
    end

    def add_route
      route "mount API::V1::Base => '/api'"
    end

  end
end
