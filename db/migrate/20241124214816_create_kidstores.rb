class CreateKidstores < ActiveRecord::Migration[7.1]
  def change
    create_table :kidstores do |t|
      t.string :name
      t.string :imgUrl
      t.string :price

      t.timestamps
    end
  end
end
