require 'easy_ui/themes/tabs/default'
require 'easy_ui/themes/tabs/bordered'

module EasyUi
  module Themes
    class ThemeResolver
      DEFAULT_THEME = {
          tab_container: EasyUi::Themes::Tabs::Default
      }

      def initialize(theme_name)
        @theme_name = theme_name
      end

      def tab_container
        if @theme_name.present?
          "EasyUi::Themes::Tabs::#{@theme_name.capitalize}".constantize.new
        else
          DEFAULT_THEME[:tab_container].new
        end
      end

    end
  end
end