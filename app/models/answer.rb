# == Schema Information
#
# Table name: answers
#
#  id          :integer         not null, primary key
#  question_id :integer
#  is_correct  :boolean
#  content     :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Answer < ActiveRecord::Base
  attr_accessible :content, :is_correct, :question_id

  belongs_to :question
end
