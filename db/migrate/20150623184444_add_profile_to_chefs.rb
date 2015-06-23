class AddProfileToChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :profile, :string
  end
end
