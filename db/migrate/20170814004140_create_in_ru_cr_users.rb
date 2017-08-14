class CreateInRuCrUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :in_ru_cr_users do |t|
      t.references :in_ru_cr, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
