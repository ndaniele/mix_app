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
    @membership = Membership.new(:user_id => current_user.id, :group_id => @group.id)
     if 
      @membership.save
      redirect_to group_path(@group) #=> goes to answers#show
    else
      flash[:error] = "#{@membership.errors.full_messages.join(" & ")}"
      redirect_to group_path(@group)
    end
  end

  def update
  end

  def show
    @membership = Membership.find(params[:id])
  end

  def destroy
  end

  #def my_memberships
    #raise params.inspect
    #@user = User.find(params[:id])
 #   @memberships = Membership.where(:user_id => params[:id])
  #    @memberships.each do |membership|
   
   #     @membership = membership
        #@group = Group.find_by(:id => membership.group_id)
      #end
    # respond_to do |format|
     
     # format.html { render :show }
      #format.json { render json: @membership}
   # end
   # end
  #end

  private 

  def membership_params
    params.require(:membership).permit(:id, :user_id, :group_id)
  end

end