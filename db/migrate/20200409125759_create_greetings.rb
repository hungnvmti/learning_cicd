class CreateGreetings < ActiveRecord::Migration[6.0]
  def change
    create_table :greetings do |t|
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
