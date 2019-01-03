class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :created_by_user
      t.text :question_text
      t.timestamps
    end
  end
end
