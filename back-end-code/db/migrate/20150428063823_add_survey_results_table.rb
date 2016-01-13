class AddSurveyResultsTable < ActiveRecord::Migration
  def change
    create_table :survey_results do |t|
      t.string :name
    end
  end
end
