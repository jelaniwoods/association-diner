class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :level_id
      t.string :text

      t.timestamps
    end
  end
end
