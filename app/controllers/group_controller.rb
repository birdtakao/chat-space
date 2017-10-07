class GroupController < ApplicationController
  def index
  end

  def new
    @group = current_user
  end

  def edit
  end
end
