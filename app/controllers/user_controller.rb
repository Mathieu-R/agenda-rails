class UserController < ApplicationController
  def create
    user = User.create(username: params[:username]) #JSON {username: params[:username]} => Crée l'utilisateur /user/:username
    if user
      render json: {success: "Utilisateur créé avec succès !"}
    else
      render json: {error: user.errors.messages}
    end
  end
end
