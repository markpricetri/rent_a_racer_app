class AddPricePerDayToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :price_per_day, :integer
  end
end
