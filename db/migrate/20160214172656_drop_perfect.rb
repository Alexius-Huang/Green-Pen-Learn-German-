class DropPerfect < ActiveRecord::Migration
  def change
  	drop_table :perfects do |t|
  		t.string   :first_person
	    t.string   :second_person
	    t.string   :third_person
	    t.string   :plural_first_person
	    t.string   :plural_second_person
	    t.string   :plural_third_person
	    t.timestamps null: false
	    t.integer  :verb_id
	    t.text     :description
  	end
  end
end
