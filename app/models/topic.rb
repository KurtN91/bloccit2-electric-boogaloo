class Topic < ApplicationRecord
   has_many :posts
   has_many :sponsored_posts, dependent: :destroy

         validates :title, length: { minimum: 5 }, presence: true
   validates :description, length: { minimum: 15 }, presence: true

end
