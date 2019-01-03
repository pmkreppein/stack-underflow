class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.belongs_to :user
      t.belongs_to :question
      t.text :answer_text
      t.timestamps
    end
  end
end
