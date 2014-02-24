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
#  admin           :boolean          default(FALSE)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
