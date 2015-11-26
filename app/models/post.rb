class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_attached_file :image, :styles => { :large => "500x500", :medium => "400x400>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
                    # :storage        => :s3,
                    # :s3_credentials => {:bucket => ENV['BUCKET_NAME'],
                    #                     :access_key_id => ENV['S3_KEY'],
                    #                     :secret_access_key => ENV['S3_SECRET']},
                    # :s3_protocol    => "https",
                    # :s3_host_name   => "s3-eu-west-1.amazonaws.com"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
