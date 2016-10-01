class GroupsController < ApplicationController
  
  def index
    @groups = Group.all 
  end

  def new
    @group = Group.new
  end

  def create 
    #raise params.inspect 
    @group = Group.create(group_params)
    redirect_to group_path(@group)
  end

  def update
  end

  def show
    @group = Group.find(params[:id])
  end

  def destroy
  end

  private 

  def group_params
    params.require(:group).permit(:id, :name)
  end

end
