require 'easy_ui/containers/tab_container'

module EasyUi
  module Helpers
    module TabHelper



      # <div role="tabpanel">
      #
      #      <!-- Nav tabs -->
      #                    <ul class="nav nav-tabs" role="tablist">
      # <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
      # <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
      # <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
      # <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
      # </ul>
      #
      # <!-- Tab panes -->
      # <div class="tab-content">
      #   <div role="tabpanel" class="tab-pane active" id="home">...</div>
      # <div role="tabpanel" class="tab-pane" id="profile">...</div>
      #   <div role="tabpanel" class="tab-pane" id="messages">...</div>
      # <div role="tabpanel" class="tab-pane" id="settings">...</div>
      # </div>
      #
      # </div>



      def easy_tab_container(&block)

        if block_given?
          tab_container = EasyUi::Containers::TabContainer.new(self)
          yield(tab_container)

          return tab_container.html
        else
          raise ArgumentError, 'No block passed'
        end
      end


    end

  end
end

