class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/assets/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :ProposedBook
  has_many :DesideredBook
  has_many :Proposal
  has_many :Exchange
  has_many :UserReviews
  
	def self.search(search)
	  if search
	    find(:all, :conditions => ['username LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end

  def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      #Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(username: data['name'],
             email: data['email'],
             password: Devise.friendly_token[0,20],
          )
      end
      user
  end

end
