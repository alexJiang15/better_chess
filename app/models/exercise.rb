# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  difficulty :integer
#  score      :integer
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Exercise < ActiveRecord::Base
  attr_accessible :name, :fen_position, :difficulty, :score
  
  has_many :solutions
  has_many :users, :as => :solvers, :class_name => 'User', :foreign_key => 'solver_id', :through => :solutions #necessary??
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  has_many :comments, as: :commentable
end
