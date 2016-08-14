class User < ApplicationRecord
  has_many :posts
  validates: username, presence: {message: "nom d'utilisateur manquant."}, unique: {message: "nom d'utilisateur déja utilisé."}
end
