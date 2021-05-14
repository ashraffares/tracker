class UserController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = current_user.items.all
  end
end
