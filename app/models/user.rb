class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
  validates_uniqueness_of :username

end
