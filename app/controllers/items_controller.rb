class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[edit update destroy]
  # GET /items or /items.json
  def index
    @items = current_user.items.where.not(group_id: nil).includes(:group, :user).all.order('created_at DESC')
  end

  def external
    @items = current_user.items.where(group_id: nil).includes(:group, :user).order('created_at DESC')
    render :index
  end

  # GET /items/1 or /items/1.json
  def show; end

  # GET /items/new
  def new
    @item = current_user.items.build
  end

  # GET /items/1/edit
  def edit; end

  # POST /items or /items.json
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render :new, notice: 'Something went wrong try again.'
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    if @item.update(item_params)
      redirect_to items_path, notice: 'Item was successfully updated.'
    else
      render :edit, notice: 'Something went wrong try again.'
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  def correct_user
    @items = current_user.items.find_by(id: params[:id])
    redirect_to items_path, notice: 'Your Are Not Authorized To Edit or Delete This Item' if @items.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :amount, :user_id, :group_id)
  end
end
