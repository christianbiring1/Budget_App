class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.all
    # @icons = Group.icon
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      flash[:notice] = 'Group created successfully!'
      redirect_to user_groups_path(current_user.id)
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @entities = @group.entities
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to user_groups_path(current_user.id)
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end