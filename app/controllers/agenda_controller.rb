class AgendaController < ApplicationController
  def index
    post = Post.find_by_name(params[:name])
    render json: post, status: 200
  end

  def create
    post = Post.create(name: params[:name], title: params[:title], description: params[:description], date: params[:date])
    if !post.valid?
      render json: {error: post.errors.messages}
    else
      render json: {id: post.id, success: "Rendez-vous ajouté avec succès"}
    end
  end

  def update
    post = Post.find(params[:id])
    post.title = params[:title]
    post.description = params[:description]
    post.date = params[:date]
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
