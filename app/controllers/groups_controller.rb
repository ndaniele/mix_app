class GroupsController < ApplicationController
  
  def index
    @groups = Group.all 
  end

  def new
    @group = Group.new
  end

  def create 
    @group = Group.build(group_params)
  end

  def update
  end

  def show
  end

  def destroy
  end

  private 

  def group_params
    params.require(:group).permit(:id, :name)
  end

end
