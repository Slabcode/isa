class CreateAvaluoImages < ActiveRecord::Migration[5.1]
  def change
    create_table :avaluo_images do |t|
      t.references :avaluo, foreign_key: true
      t.text :image

      t.timestamps
    end
  end
end
