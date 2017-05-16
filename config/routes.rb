Rails.application.routes.draw do

   resources :topics do
 # #34
     resources :posts, except: [:index]
   end
  resources :questions

  get 'about' => 'welcome#about'

  get 'welcome/contact'
  
  get 'welcome/faq'
  
  root 'welcome#index'

end
