class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: {message: "ID manquant."}, numericality: true
  validates :title, presence: {message: "Titre manquant."}, length: {minimum: 3}
  validates :description, presence: {message: "Description manquante."}, length: {minimum: 3}
  validates :date, presence: {message: "Date manquante."}
  validates :level, presence: {message: "Niveau d'importance manquant."}, numericality: true
end
