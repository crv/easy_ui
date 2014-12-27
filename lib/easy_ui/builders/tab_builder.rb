module EasyUi
  module Builders

    class TabBuilder
      def initialize(view)
        @view_context = view
      end

      def active_class(is_active)
        !!is_active ? 'active' : ''
      end

      def easy_tab_li(name, is_active)
        @view_context.content_tag :li, role: 'presentation', class: active_class(is_active) do
          @view_context.link_to(name, "##{name}", 'aria-controls' => name, role: 'tab', data: {toggle: 'tab'})
        end
      end

      def easy_tab_pane(name, is_active, &block)
        @view_context.content_tag :div, role: 'tabpanel', class: "tab-pane #{active_class(is_active)}", id: name do
          yield
        end
      end
    end

  end
end
