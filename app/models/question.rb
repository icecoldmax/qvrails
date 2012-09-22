# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  content    :text
#  quiz_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Question < ActiveRecord::Base
  attr_accessible :content, :quiz_id

  belongs_to :quiz
  has_many :answers
end
