class ErrorsController < ApplicationController
  before_action :set_layout_variables

  def not_found
    render status: 404
  end

  def internal_server_error
    render status: 500
  end

  private

  def set_layout_variables
    @no_sidebar = true if action_name == "not_found"
    @no_navbar = true if action_name == "not_found"
    @no_footer = true if action_name == "not_found"
  end
end
