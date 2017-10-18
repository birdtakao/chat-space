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
      render new_group_path, alert: 'グループ作成に失敗しました'
    end
  end

  def edit
    @group = Group.find(1)
  end

  def update
    @group = Group.find(1)
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループが編集されました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end

  private
  def find_group

  end
end
