class AddVerbIdToPresent < ActiveRecord::Migration
  def change
    add_column :presents, :verb_id, :integer
  end
end
