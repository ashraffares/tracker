class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[edit destroy update]

  # GET /groups or /groups.json
  def index
    @groups = Group.includes(:user, :icon_attachment).order(:name)
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group_items = Item.where(group_id: params[:id]).all
  end

  # GET /groups/new
  def new
    @group = current_user.groups.build
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path, notice: 'Group was successfully created.'
    else
      render :new, notice: 'Something went wrong try again'
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: 'Group was successfully updated.'
    else
      render :edit, notice: 'Something went wrong try again'
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy
    redirect_to groups_url, notice: 'Group was successfully destroyed.'
  end

  def correct_user
    @group = current_user.groups.find_by(id: params[:id])
    redirect_to groups_path, notice: 'Your Are Not Authorized To Edit or Delete This group' if @group.nil?
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
