class MembershipsController < ApplicationController
  
  def index
    @memberships = Membership.all 
  end

  def new
    @membership = Membership.new
  end

  def create 
    #raise params.inspect 
    @membership = Membership.create(membership_params)
    redirect_to membership_path(@membership)
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