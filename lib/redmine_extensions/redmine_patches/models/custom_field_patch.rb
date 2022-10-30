module TesRedmineExtensions
  module CustomFieldPatch

    def translated_name
      self.name
    end

  end
end

TesRedmineExtensions::PatchManager.register_model_patch 'CustomField', 'TesRedmineExtensions::CustomFieldPatch', if: -> { !Redmine::Plugin.installed?(:easy_extensions) }
