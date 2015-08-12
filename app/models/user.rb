class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :auth_forum_posts, :class_name => 'AuthForum::Post'

  def forem_name
    if name.present?
      name
    else
      'Anonymous'
    end
  end

  def forem_email
    email
  end
end