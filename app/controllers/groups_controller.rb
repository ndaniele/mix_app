class GroupsController < ApplicationController

  def index
    @groups = Group.all 
  end

  def show
    @group = Group.find_by(:id => params[:id])
  end

  def update
    #raise params.inspect
    @user = User.find_by(:id => params[:group][:user_id])
      #=> returns user "2"
    @group = Group.find_by(id: params[:id])
      #=> returns group '3'
    @user.groups << @group
    @group.save
    redirect_to group_path(@group)
  end

end
