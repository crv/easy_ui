module EasyUi
end

require 'easy_ui/version'
require 'sprockets'
require 'bootstrap-sass'
require 'font-awesome-rails'
require 'jquery-rails'
require 'easy_ui/helpers/tab_helper'
require 'easy_ui/engine'

ActiveSupport.on_load(:action_view) do
  include EasyUi::Helpers::TabHelper
end if defined? ActiveSupport