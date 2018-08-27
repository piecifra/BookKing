class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :ProposedBook
  has_many :DesideredBook
  
	def self.search(search)
	  if search
	    find(:all, :conditions => ['username LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
end
