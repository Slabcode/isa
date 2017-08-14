class CreateImageInRuCrs < ActiveRecord::Migration[5.1]
  def change
    create_table :image_in_ru_crs do |t|
      t.text :image
      t.references :in_ru_cr, foreign_key: true

      t.timestamps
    end
  end
end
