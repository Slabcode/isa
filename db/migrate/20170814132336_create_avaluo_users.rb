class CreateAvaluoUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :avaluo_users do |t|
      t.references :avaluo, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
