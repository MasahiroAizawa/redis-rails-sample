RedisRailsSample::Application.routes.draw do
  root to: "user#index"
  post '/save', to: "user#save", as: "save"
end
