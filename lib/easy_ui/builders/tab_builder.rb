module EasyUi
  module Builders

    class TabBuilder

      attr_accessor :is_active

      def initialize(view, name, options={}, &block)
        @view_context = view
        @name = name
        @options = options
        @content = block if block_given?
      end

      def active_class
        !!(@options[:active] || false) ? 'active' : ''
      end

      def identifier
        @options[:id] || @name
      end

      def label
        @name.capitalize
      end

      def li_html
        @view_context.content_tag :li, role: 'presentation', class: active_class do
          @view_context.link_to(label, "##{identifier}", 'aria-controls' => @name, role: 'tab', data: {toggle: 'tab'})
        end
      end

      def pane_html
        @view_context.content_tag :div, role: 'tabpanel', class: "tab-pane #{active_class}", id: identifier do
          @content.call if @content.present?
        end
      end

    end

  end
end
