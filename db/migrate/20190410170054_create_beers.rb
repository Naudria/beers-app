class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.integer :abv
      t.integer :user_id
      t.text :review
    end
  end
end
