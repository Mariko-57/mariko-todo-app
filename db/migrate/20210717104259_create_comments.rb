class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :task, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
