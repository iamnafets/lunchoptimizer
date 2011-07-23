class GroupController < ApplicationController
  def index
    @groups = Group.all
  end

  def view
  end

  def join
    @groups = Group.all
  end
end
