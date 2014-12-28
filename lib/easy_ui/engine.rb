# encoding: UTF-8
module EasyUi

  class Engine < ::Rails::Engine
    initializer 'easy_ui.assets.precompile' do |app|
      %w(stylesheets).each do |sub|
        app.config.assets.paths << root.join('assets', sub).to_s
      end
    end
  end

end
