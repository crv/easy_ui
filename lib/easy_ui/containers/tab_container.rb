require 'easy_ui/builders/tab_builder'
module EasyUi
  module Containers
    class TabContainer

      attr_reader :tab_lis, :tab_panes

      def initialize(view)
        @view_context = view
        @tab_builder = EasyUi::Builders::TabBuilder.new(view)
        @tab_lis = ''
        @tab_panes = ''
      end

      def html
        tab_panel = ''
        tab = @view_context.content_tag :div, role: 'tabpanel' do
          tab_panel += @view_context.content_tag :ul, class: 'nav nav-tabs', role: 'tablist' do
            @tab_lis.html_safe
          end

          tab_panel += @view_context.content_tag :div, class: 'tab-content' do
            @tab_panes.html_safe
          end
          tab_panel.html_safe
        end
        tab
      end

      def easy_tab(name, is_active, options, &block)
        @tab_lis << @tab_builder.easy_tab_li(name, is_active)
        @tab_panes << @tab_builder.easy_tab_pane(name, is_active, &block)
      end
    end
  end

end
