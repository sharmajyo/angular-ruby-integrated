class AddThemesTable < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.integer :survey_result_id
    end
  end
end
