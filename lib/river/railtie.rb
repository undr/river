module River
  class Railtie < Rails::Railtie
    initializer 'river.extend_action_controller' do
      ActiveSupport.on_load(:action_controller) do
        include River::ActionController
        self.responder = River::Responder
      end
    end
  end
end
