class User < ApplicationRecord
  validates: username, presence: {message: "nom d'utilisateur manquant."}, unique: {message: "nom d'utilisateur déja utilisé."}
end
