module TesRedmineExtensions
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        has_many :easy_settings, :class_name => 'EasySetting', :dependent => :destroy
      end
    end
  end
end
TesRedmineExtensions::PatchManager.register_model_patch 'Project', 'TesRedmineExtensions::ProjectPatch'
