Rails.application.routes.draw do
  # フロントエンド用ルート
  root 'home#index'  # 例として HomeController#index を Vue アプリのエントリーポイントとする

  # API 用ルート
  namespace :api, defaults: { format: :json } do
    resources :tasks, only: [:index, :create, :show, :update, :destroy]
  end

  # キャッチオールルートで Vue SPA にルーティングを渡す
  get '*path', to: 'home#index', constraints: ->(request) { !request.xhr? && request.format.html? }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
