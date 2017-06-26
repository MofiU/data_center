module API
  module <%= version.camelize %>
    class Base < Grape::API
      format :json

      def self.set_mounts
        Dir::foreach(__dir__) do |f|
          next unless File.directory?("#{__dir__}/#{f}") && f != 'entities' && f.first != '.'
          resource_class = f.camelize
          Dir::foreach("#{__dir__}/#{f}") do |action_file|
            next if action_file.exclude? '_action.rb'
            action_class = action_file.remove('.rb').camelize
            mount "#{parent.name}::#{resource_class}::#{action_class}".constantize
          end
        end
      end
      set_mounts

      before do
        header['Access-Control-Allow-Origin'] = '*'
        header['Access-Control-Request-Method'] = '*'
      end

    end
  end
end