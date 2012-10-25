# == Schema Information
#
# Table name: quizzes
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  creator    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Quiz < ActiveRecord::Base
  attr_accessible :creator, :question_count, :title

  has_many :questions

end
