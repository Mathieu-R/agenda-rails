class User < ApplicationRecord
  has_many :posts
  validates :username, presence: {message: "nom d'utilisateur manquant."}, uniqueness: {message: "nom d'utilisateur déja utilisé."}
end
