# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end
    # def index
    #   unless current_user.admin?
    #     redirect_to :back, :alert => "Access denied."
    #   end
    #   @users = User.all
    # end


    def index
      @users = User.all
      if current_user.admin?
        can :manage, :all
      else
        can :mana

      end
      
    end

    # POST /resource/sign_in
    def create
      super do |user|
        sign_out unless user.userStatus?
      end
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
