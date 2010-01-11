class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end

    add_column :books, :author_id, :string
  end

  def self.down
    remove_column :books, :author_id
    drop_table :authors
  end
end
