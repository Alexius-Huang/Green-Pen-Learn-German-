class AddVerbIdToPast < ActiveRecord::Migration
  def change
    add_column :pasts, :verb_id, :integer
  end
end
