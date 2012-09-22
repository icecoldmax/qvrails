class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :creator
      t.integer :question_count

      t.timestamps
    end
  end
end
