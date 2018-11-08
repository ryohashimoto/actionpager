# frozen_string_literal: true

module ActionPager
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def copy_pagination_helper_file
        helper_file = "app/helpers/action_pager/pagination_helper.rb"
        copy_file helper_file, helper_file
      end

      def copy_pager_view_template_file
        erb_file = "app/views/action_pager/_pager.html.erb"
        copy_file erb_file, erb_file
      end
    end
  end
end
