class User < ApplicationRecord
   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :votes, dependent: :destroy
      has_many :favorites, dependent: :destroy
       before_save { self.email = email.downcase if email.present? }
          before_save { self.role ||= :member }

 # #3
   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 # #4
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
 # #5
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

  before_save :format_name 
 # #6
   has_secure_password

      enum role: [:member, :admin, :moderator]
    def format_name
        name.capitalize 
    end 
end
