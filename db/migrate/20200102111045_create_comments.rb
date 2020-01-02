class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.timestamps
      t.string :text, null: false
      t.references :article, :user, foreign_key: true
    end
  end
end
