class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.includes(:items, :groups).all
  end
end
