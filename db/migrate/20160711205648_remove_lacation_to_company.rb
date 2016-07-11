class RemoveLacationToCompany < ActiveRecord::Migration[5.0]
  def change
    remove_column :companies, :lacation, :string
  end
end
