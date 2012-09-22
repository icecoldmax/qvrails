class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.boolean :is_correct
      t.text :content

      t.timestamps
    end
  end
end
