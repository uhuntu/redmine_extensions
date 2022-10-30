module TesRedmineExtensions
  module RailsPatches
    module RouteSetGeneratorPatch
      def use_relative_controller!
        return if current_controller && current_controller.start_with?('tes_redmine_extensions')
        super
      end
    end
  end
end
