# == Schema Information
#
# Table name: quizzes
#
#  id             :integer         not null, primary key
#  title          :string(255)
#  creator        :string(255)
#  question_count :integer
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Quiz < ActiveRecord::Base
  attr_accessible :creator, :question_count, :title

  has_many :questions

  before_save { |quiz| quiz.question_count = quiz.questions.count }
end
