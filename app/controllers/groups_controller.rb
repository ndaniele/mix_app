class GroupsController < ApplicationController

  def index
    @groups = Group.all 
  end

  def show
    @group = Group.find_by(:id => params[:id])
    @question = Question.new
    @question.answers.build
  end

  def new
    @group = Group.new
  end

  def create
    #raise params.inspect
    @group = Group.create(:name => params[:group][:name])
    @user = User.find_by(:id => params[:group][:user_id])
    @group.add(@user, as: 'manager')
    #@group.save
    redirect_to groups_path
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

  def destroy
   @group = Group.find_by(:id => params[:id])
   @group.destroy
   redirect_to root_path
  end

end
