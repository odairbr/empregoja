class AddLocationToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :location, :string
  end
end
