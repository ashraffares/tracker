class UserController < ApplicationController
  def index
    @items = current_user.items.all
  end
end
