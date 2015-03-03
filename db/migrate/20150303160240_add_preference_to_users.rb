class AddPreferenceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :preference, :string
  end
end
