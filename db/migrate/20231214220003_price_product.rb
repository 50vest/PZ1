class PriceProduct < ActiveRecord::Migration[7.0]
  def change
    reversible do |direction|
      change_table :products do |t|
        direction.up { t.change :price, :integer }
      end
    end
  end

end
