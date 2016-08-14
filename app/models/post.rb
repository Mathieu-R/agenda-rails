class Post < ApplicationRecord
  belgons_to :user
  validates :user_id, presence: {message: "Nom manquant"}, length: {minimum: 3}
  validates :title, presence: {message: "Titre manquant"}, length: {minimum: 3}
  validates :description, presence: {message: "Description manquante"}, length: {minimum: 3}
  validates :date, presence: {message: "Date manquante"}
end
