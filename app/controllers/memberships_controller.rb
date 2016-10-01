class MembershipsController < ApplicationController
  
  def index
    @memberships = Membership.all 
  end

  def new
    #raise params.inspect 
    @membership = Membership.new
    #@group = Group.find_by(:id => params[:id])
    #@question.answers.build
  end

  def create 
    #raise params.inspect
    @group = Group.find_by(:id => params[:group_id]) 
    @membership = Membership.create(:user_id => current_user.id, :group_id => @group.id)
    redirect_to group_path(@group)
  end

  def update
  end

  def show
    @membership = Membership.find(params[:id])
  end

  def destroy
  end

  #def my_groups
    #@user = current_user
  #end

  private 

  def membership_params
    params.require(:membership).permit(:id, :user_id, :group_id)
  end

end