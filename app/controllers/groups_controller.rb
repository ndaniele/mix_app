class GroupsController < ApplicationController
  
  def index
    @groups = Group.all 
  end

  def new
    @group = Group.new
    @group.memberships.build
  end

  def create 
    #raise params.inspect 
    @group = Group.create(group_params)
    redirect_to group_path(@group)
  end

  def update
    #raise params.inspect 
    @group = Group.find_by(:id => params[:id])
    authorize @group
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      flash[:error] = "#{@group.errors.full_messages.join(" & ")}"
      redirect_to group_path(@group)
    end
  end

  def show
    @user = current_user
    @group = Group.find(params[:id])
    @membership = Membership.new
    @questions = GroupQuestion.where(:group_id => @group.id)
    #@questions = Question.all.where(:group_id => @group.id)
  end

  def destroy
  end

  def my_groups
    @user = current_user
  end

  private 

  def group_params
    params.require(:group).permit(:id, :name)
  end

end
