class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :amount, null: false
      t.references :user, null: false, foreign_key: true, index: true
      t.references :group, foreign_key: true, index:true

      t.timestamps
    end
  end
end
