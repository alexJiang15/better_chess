# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  karma           :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  first           :string(255)      default(""), not null
#  last            :string(255)      default(""), not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :first, :last, :password, :password_confirmation, :karma
  
  before_save { |user| user.email = email.downcase }
  
  has_many :solutions
  has_many :exercises, :through => :solutions
  has_many :comments
  
  has_secure_password
  
  validates :first, :last, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, :length => {:minimum => 5}
  validates :password_confirmation, presence: true
  
  scope :enough_karma?, ->(k) { where('karma >= ?', k).uniq.order('karma ASC') }

end
