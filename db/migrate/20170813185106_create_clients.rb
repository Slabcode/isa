class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :description
      t.string :discount

      t.timestamps
    end
  end
end
