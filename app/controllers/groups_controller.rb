class GroupsController < ApplicationController
  before_action :set_group_find, only: [:show, :edit]
  before_action :set_current_user

  def index
    @groups = Group.all
  end

  def show
    @administrator = User.find(@group.administrator)
    @new_question = Question.new(group_id: @group.id)
    @new_question.choices.build
    @new_vote = Vote.new(user_id: @current_user.id)
  end

  def new
    @group = Group.new(administrator: @current_user.id)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "グループを新規作成しました。"
      @group.users << @current_user
      redirect_to @group
    else
      flash[:notice] = "グループを作成できませんでした。"
      render "new"
    end
  end

  def add
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group][:id])
    @group.users << @user 
    flash[:notice] = "#{@group.name}に#{@user.name}を追加しました。"
    redirect_to :groups
  end

  private
  def group_params
    attrs = [
      :name,
      :administrator
    ]

    params.require(:group).permit(attrs)
  end

  def set_group_find
    @group = Group.find(params[:id])
  end

  def set_current_user
    @user = @current_user
  end
end
