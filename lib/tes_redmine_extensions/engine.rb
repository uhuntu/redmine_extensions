require 'active_support/dependencies'
require_relative './patch_manager'
require_relative './redmine_patches/controllers/application_controller_patch'
require_relative './redmine_patches/models/project_patch'
require_relative './redmine_patches/models/custom_field_patch'

require_relative './query_output'

module TesRedmineExtensions
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    config.autoload_paths << config.root.join('lib')
    config.eager_load_paths << config.root.join('app', 'models', 'easy_queries')

    initializer 'tes_redmine_extensions.assets' do
      if config.respond_to?(:assets)
        config.assets.precompile << 'tes_redmine_extensions/applications.js'
        config.assets.precompile << 'tes_redmine_extensions/blocking.js'
      end
    end

    # config.to_prepare goes after Reloader.to_prepare
    TesRedmineExtensions::Reloader.to_prepare do
      TesRedmineExtensions::QueryOutput.register_output TesRedmineExtensions::QueryOutputs::ListOutput
      TesRedmineExtensions::QueryOutput.register_output TesRedmineExtensions::QueryOutputs::TilesOutput
      ApplicationController.include TesRedmineExtensions::RenderingHelper
    end

    initializer 'tes_redmine_extensions.initialize' do |_app|
      ActionDispatch::Routing::RouteSet::Generator.prepend TesRedmineExtensions::RailsPatches::RouteSetGeneratorPatch
    end

    initializer 'tes_redmine_extensions.append_migrations' do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
      if true
        js_dir = app.root.join('public', 'javascripts', 'tes_redmine_extensions')
        FileUtils.mkdir(js_dir) unless File.directory?(js_dir)
        Dir.glob(root.join('app', 'assets', 'javascripts', 'tes_redmine_extensions', '*.js')) do |js_file|
          FileUtils.cp(js_file, app.root.join('public', 'javascripts', 'tes_redmine_extensions'))
        rescue StandardError
        end
      end
    end

    # include helpers
    initializer 'tes_redmine_extensions.rails_patching', before: :load_config_initializers do |_app|
      ActiveSupport.on_load(Rails::VERSION::MAJOR >= 5 ? :action_controller_base : :action_controller) do
        helper TesRedmineExtensions::ApplicationHelper
      end
      ActiveSupport.on_load(:active_record) do
        include TesRedmineExtensions::RailsPatches::ActiveRecord
      end
      ActiveSupport.on_load(:action_view) do
        default_form_builder.include TesRedmineExtensions::RailsPatches::FormBuilderPatch
      end
    end

    initializer 'tes_redmine_extensions.initialize_easy_plugins', after: :load_config_initializers do
      require 'tes_redmine_extensions/hooks/views_layouts_hook'

      ActiveSupport.run_load_hooks(:easyproject, self) unless Redmine::Plugin.installed?(:easy_extensions)

      require_relative './easy_entity_formatters/easy_entity_formatter'
    end

  end
end
