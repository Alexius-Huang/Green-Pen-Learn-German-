class CreatePasts < ActiveRecord::Migration
  def change
    create_table :pasts do |t|
      t.string :first_person
      t.string :second_person
      t.string :third_person
      t.string :plural_first_person
      t.string :plural_second_person
      t.string :plural_third_person
      t.text :description

      t.timestamps null: false
    end
  end
end
