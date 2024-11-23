class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    render "dashboard/admin/index"
  end
end
