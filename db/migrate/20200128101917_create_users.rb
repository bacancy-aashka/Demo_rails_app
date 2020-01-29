class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :age
      t.string :degree
      t.integer :year
      t.string :com_name
      t.string :website
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
