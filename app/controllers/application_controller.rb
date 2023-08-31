class ApplicationController < ActionController::Base

    before_action :configure_devise_parameters, if: :devise_controller?
    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nom, :email, :password, :password_confirmation)}
    end

    before_action :set_render_cart
    before_action :initialize_cart
  
    def set_render_cart
      @render_cart = true
    end
  
    def initialize_cart
      @cart ||= Cart.find_by(id: session[:cart_id])
  
      if @cart.nil?
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
    end
end
