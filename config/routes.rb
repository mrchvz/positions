Rails.application.routes.draw do
  get "/positions", to: "positions#index"
end
