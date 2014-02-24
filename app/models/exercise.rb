# == Schema Information
#
# Table name: exercises
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  fen_position :string(255)
#  difficulty   :integer
#  score        :integer
#  author_id    :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Exercise < ActiveRecord::Base
  attr_accessible :name, :fen_position#, :score, :author_id  **** DANGEROUS!!!!
  
  has_many :solutions
  has_many :solvers, :source => :user, :foreign_key => 'user_id', :through => :solutions
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  has_many :comments, as: :commentable
  
  validates :name, presence: true
end
