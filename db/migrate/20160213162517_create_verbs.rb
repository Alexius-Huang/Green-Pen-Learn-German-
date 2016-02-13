class CreateVerbs < ActiveRecord::Migration
  def change
    create_table :verbs do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
