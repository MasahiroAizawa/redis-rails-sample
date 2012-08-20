class UserController < ApplicationController
  def index
    @user = User.new

    key = $redis.get("key")
    value = $redis.get("value")

    $redis.del("key")
    $redis.del("value")

    redis_host = $redis.client.host
    redis_port = $redis.client.port

    if key || value
      @redis = "key:#{key}, value:#{value}"
      @redis += ", host:#{redis_host}, port:#{redis_port}"
    end

    render :index
  end

  def save
    $redis.set("key", params[:user][:key])
    $redis.set("value", params[:user][:value])

    redirect_to :index
  end
end
