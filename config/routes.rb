Rails.application.routes.draw do

  get 'sponsored_posts/new'

  get 'sponsored_posts/show'

  get 'sponsored_posts/edit'

   resources :topics do
 # #34
     resources :posts, except: [:index]
   end

    
 # #4
   resources :posts, only: [] do
 # #5
     resources :comments, only: [:create, :destroy]
     resources :favorites, only: [:create, :destroy]
     post '/up-vote' => 'votes#up_vote', as: :up_vote
     post '/down-vote' => 'votes#down_vote', as: :down_vote
   end

      resources :users, only: [:new, :create]
      post 'users/confirm' => 'userser#confirm'

         resources :sessions, only: [:new, :create, :destroy]

      
  resources :questions

  resources :sponsored_posts do
    resources :topics
  end
  

  get 'about' => 'welcome#about'

  get 'welcome/contact'
  
  get 'welcome/faq'
  
  root 'welcome#index'

end
