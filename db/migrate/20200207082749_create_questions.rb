class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :detail
      t.date :deadline
      t.boolean :finished
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
