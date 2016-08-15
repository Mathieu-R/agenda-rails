class RenameAgendas < ActiveRecord::Migration[5.0]
  def change
    rename_table :agendas, :posts
  end
end
