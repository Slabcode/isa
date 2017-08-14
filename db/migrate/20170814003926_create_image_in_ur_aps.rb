class CreateImageInUrAps < ActiveRecord::Migration[5.1]
  def change
    create_table :image_in_ur_aps do |t|
      t.text :image
      t.references :in_ur_ap, foreign_key: true

      t.timestamps
    end
  end
end
