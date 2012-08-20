class UserController < ApplicationController
  def index
    @user = User.new

    if flash[:save]
      @user.key = flash[:save][:key]
      @user.value = flash[:save][:value]

      @redis = "key:#{@user.key}, value:#{@user.value}"
    end

    render :index
  end

  def save
    flash[:save] = params[:user]
    redirect_to :index
  end
end
