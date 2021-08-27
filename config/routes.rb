Rails.application.routes.draw do

# devise_forを先に書いていたが、これだとcustomersの編集画面の時に先にdeviseの方のviewが表示されてしまう（上から優先順位が高い）ので、devise_forを下に移した
  namespace :admin do

    get "" => "homes#top"

    resources :items, except: [:destroy]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :customers, only: [:index, :show, :edit, :update]

    resources :orders, only: [:show, :update]

    patch "admin/order_detail/:id" => "order_details#update"

  end


  scope module: :public do

    root "homes#top"
    get "homes/about" => "homes#about"

    resources :items, only: [:index, :show]

    get "customers/my_page" => "customers#my_page"
    get "customers/confirm" => "customers#confirm"
    patch "customers/unsubscribe" => "customers#unsubscribe"
    #今回は要件と少し変更して、全てをupdateアクションで行うこととした→それは無理やった
    resource :customers, only: [:edit, :update]

    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :create, :update, :destroy]

    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :orders, only: [:new, :create, :index, :show]

    resources :addresses, except: [:new, :show]
  end


  #基本的に、devise_forはnamespaceの外側に出してしまって大丈夫

  devise_for :admin, controllers: {
      sessions: 'admin/sessions',
      registrations: 'admin/registrations',
      passwords: 'admin/passwords'
    }
  #adminsになっていたので、自分のフォルダを比べてみて、adminに直した


  devise_for :customers, controllers: {
      sessions: 'public/customers/sessions',
      #ここにactionとかを設定したらうまくedit画面は飛ばないように設定できるかも
      registrations: 'public/customers/registrations',
      passwords: 'public/customers/passwords'
    }

end