class AddFieldsToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :name, :string
    add_column :vehicles, :description, :string
    add_column :vehicles, :price, :decimal
    add_column :vehicles, :year, :integer
    add_column :vehicles, :color, :string
    add_column :vehicles, :transmition, :string
  end
end
