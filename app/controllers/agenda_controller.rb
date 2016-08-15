class AgendaController < ApplicationController
  def index
    user = User.find_by username: params[:username]
    if user
      id = user.id
      post = User.joins(:posts).select('user_id', "title", "description", "date", "level").where("user_id = ?", id)
      #post = user.joins(:posts)
      if post #S'il y a des post => id = user_id
        render json: post, status: 200
      else #Sinon on renvoi l'utilisateur => id = id
        render json: user, status: 200
      end
    else
      render json: {error: "Utilisateur introuvable."}
    end
  end

  def create
    post = Post.create(user_id: params[:user_id], title: params[:title], description: params[:description], date: params[:date], level: params[:level])
    if !post.valid?
      render json: {error: post.errors.messages}
    else
      render json: {id: post.id, success: "Rendez-vous ajouté avec succès"} #IMPORTANT => Renvoi l'ID du post
    end
  end

  def update
    post = Post.find(params[:id]) #ID du post
    post.title = params[:title]
    post.description = params[:description]
    post.date = params[:date]
    post.level = params[:level]
    post = post.save
    if post == false
      render json: {error: post.errors.messages}
    else
      render json: {success: "Rendez-vous modifié avec succès !"}
    end
  end

  def destroy
    post = Post.find(params[:id]) #Recherche le post qui correspond à l'id
    post = post.destroy #On supprime le post
    if post
      render json: {success: "Rendez-vous supprimé avec succès !"}
    else #Sinon
      render json: {error: "Ce rendez-vous n'a pas pu être supprimé"}
    end
  end
end
