class UsersController < ApplicationController
  def index
  end

  def show
    @user = OpenStruct.new(id: params[:id])
  end
end
