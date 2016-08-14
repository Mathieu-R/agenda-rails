class UserController < ApplicationController
  def create
    user = User.create(username: params[:username]) #JSON {username: params[:username]} => Crée l'utilisateur
    if user
      render json: {success: "Utilisateur créé avec succès !"}, status 200
    else
      render json: {error: user.errors.messages}
    end
  end
end
