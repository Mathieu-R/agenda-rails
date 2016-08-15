class CreateAgendas < ActiveRecord::Migration[5.0]
  def change
    create_table :agendas do |t|
      t.string :name
      t.string :title
      t.text :description
      t.datetime :date
    end
  end
end
