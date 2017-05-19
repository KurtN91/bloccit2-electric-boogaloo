Rails.application.routes.draw do

  get 'sponsored_posts/new'

  get 'sponsored_posts/show'

  get 'sponsored_posts/edit'

   resources :topics do
 # #34
     resources :posts, except: [:index]
   end

      resources :users, only: [:new, :create]

      
  resources :questions

  resources :sponsored_posts do
    resources :topics
  end
  

  get 'about' => 'welcome#about'

  get 'welcome/contact'
  
  get 'welcome/faq'
  
  root 'welcome#index'

end
