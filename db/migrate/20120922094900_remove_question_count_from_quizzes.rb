class RemoveQuestionCountFromQuizzes < ActiveRecord::Migration
  def up
    remove_column :quizzes, :question_count
  end

  def down
    add_column :quizzes, :question_count, :integer
  end
end
