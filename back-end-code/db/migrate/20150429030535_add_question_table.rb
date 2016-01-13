class AddQuestionTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :description
      t.string :question_type
      t.integer :theme_id
    end
  end
end
