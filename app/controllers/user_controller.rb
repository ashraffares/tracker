class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.where(id: current_user.id).includes(:items, :groups).all
  end
end
