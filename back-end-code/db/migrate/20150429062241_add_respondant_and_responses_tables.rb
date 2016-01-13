class AddRespondantAndResponsesTables < ActiveRecord::Migration
  def change
    create_table :respondants do |t|
      t.integer :survey_result_id
      t.string :email
      t.string :employee_id
      t.datetime :submitted_at
    end

    create_table :survey_responses do |t|
      t.integer :question_id
      t.integer :respondant_id
      t.string :response_content
    end
  end
end
