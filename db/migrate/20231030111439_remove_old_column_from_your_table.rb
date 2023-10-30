class RemoveOldColumnFromYourTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :cars, :image
  end
end
