# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  email          :string(255)      not null
#  name           :string(255)
#  password       :string(255)      not null
#  karma          :integer          default(0), not null
#  last_logged_in :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :karma, :last_logged_in
  
  has_many :solutions
  has_many :exercises, :through => :solutions
  has_many :comments
  
  scope :enough_karma?, ->(k) { where('karma >= ?', k).uniq.order('karma ASC') }
end
