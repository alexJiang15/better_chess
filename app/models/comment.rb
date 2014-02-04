# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  title            :string(255)
#  content          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  author_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :title, :content
  
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  belongs_to :commentable, polymorphic: true
end
