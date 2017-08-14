class CreateInUrApUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :in_ur_ap_users do |t|
      t.references :in_ur_ap, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
