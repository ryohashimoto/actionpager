# frozen_string_literal: true

module ActionPager
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_pagination_helper_file
        template "app/helpers/action_pager/pagination_helper.rb"
      end

      def copy_pager_view_template_file
        template "app/views/action_pager/_pager.html.erb"
      end
    end
  end
end
