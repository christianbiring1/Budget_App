class EntitiesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @entities = current_user.entities
  end

  def new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = @group.entities.build(entity_params)
    @entity.user = current_user
    if @entity.save
      flash[:notice] = 'Entity created Successfully!'
      redirect_to user_group_entities_path(current_user, @group.id)
    else
      flash[:alert] = 'Ooops! Entity not created...'
      render :new
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @entity = Entity.find(params[:id])
    @entity.destroy
    flash[:alert] = 'Entity deleted successfully!'
    redirect_to user_group_entities_path(current_user, @group)
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
