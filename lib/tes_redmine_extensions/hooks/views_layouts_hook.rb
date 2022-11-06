module TesRedmineExtensions
  module Hooks
    class ViewsLayoutsHook < Redmine::Hook::ViewListener
      ### JAVASCRIPTS IN REDMINE ###
      def view_layouts_base_html_head(context = {})
        ## BLOCKING ##
        javascript_include_tag('tes_redmine_extensions/blocking_namespace') +
          javascript_include_tag('tes_redmine_extensions/blocking_schedule') +
          javascript_include_tag('tes_redmine_extensions/blocking_module') +
          javascript_include_tag('tes_redmine_extensions/blocking_polyfill') +
          javascript_include_tag('tes_redmine_extensions/blocking_render') +
          javascript_include_tag('tes_redmine_extensions/blocking_utils') +
          javascript_include_tag('tes_redmine_extensions/blocking_dynamic_loading') +

          ## DEFERRED ##
          javascript_include_tag('tes_redmine_extensions/easy_togglers') +
          javascript_include_tag('tes_redmine_extensions/jquery.entityarray') +
          javascript_include_tag('tes_redmine_extensions/render_polyfill') +
          javascript_include_tag('tes_redmine_extensions/tes_redmine_extensions')
      end
    end
  end
end
