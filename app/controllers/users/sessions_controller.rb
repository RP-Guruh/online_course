# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :set_layout_variables

  # GET /resource/sign_in
  def new
    #super
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?

    render "users/sessions/new"
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    # yield resource if block_given?

    redirect_to "/test/index"
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private

  def set_layout_variables
    @no_sidebar = true if action_name == "new"
    @no_navbar = true if action_name == "new"
    @no_footer = true if action_name == "new"
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
