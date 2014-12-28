require 'easy_ui/builders/tab_builder'
require 'easy_ui/themes/theme_resolver'

module EasyUi
  module Containers
    class TabContainer

      attr_reader :tab_lis, :tab_panes

      def initialize(view, options = {}, &block)
        @view_context = view
        @any_active = false
        @tabs = []
        @theme = EasyUi::Themes::ThemeResolver.new(options[:theme]).tab_container
        if block_given?
          block.call(self)
        end
      end

      def tab_list_html
        @view_context.content_tag :ul, class: 'nav nav-tabs', role: 'tablist' do
          tab_list = ''
          @tabs.each {|t| tab_list += t.li_html.html_safe }
          tab_list.html_safe
        end
      end

      def tab_content_html
        @view_context.content_tag :div, class: @theme.tab_content_class do
          tab_content = ''
          @tabs.each {|t| tab_content += t.pane_html.html_safe }
          tab_content.html_safe
        end
      end

      def tab_panel_html
        tab_panel_html = ''
        tab_panel_html += tab_list_html
        tab_panel_html += tab_content_html
        tab_panel_html.html_safe
      end

      def html
        set_active_tab
        @view_context.content_tag :div, role: 'tabpanel' do
          tab_panel_html.html_safe
        end
      end

      def set_active_tab
        @tabs.first.is_active = true if @any_active == false
      end

      def validate_options(name, options)
        raise ArgumentError.new('Tab must have a name') if name.blank?
        raise ArgumentError.new('Two tabs cannot be active at the same time') if @any_active == true && options[:active] == true
      end

      def easy_tab(name, options= {}, &block)
        validate_options(name, options)
        @any_active = @any_active || (options[:active] || false)
        tab_builder = EasyUi::Builders::TabBuilder.new(@view_context, name, options[:active], &block)
        @tabs << tab_builder
      end
    end
  end

end
