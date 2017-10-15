class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render new_group_path
    end
  end

  def edit
  end

  private
  def group_params
    params.require(:group).permit(:name, user_id: [])
  end
end
