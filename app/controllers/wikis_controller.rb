class WikisController < ApplicationController
  #before_action :require_sign_in, except: :show
    #before_action :authorize_user, only: [:update, :destroy]
  #  before_action :authorize_moderator, only: :update

  def index
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = wikis.build(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to [@wiki]
    else

      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    #require("pry-rails"); binding.pry
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    if @wiki.save
      flash[:notice] = "wiki was updated."
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end
  # remember to add private methods to the bottom of the file. Any method defined below private, will be private.
  private

  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

  def authorize_user
    wiki = Wiki.find(params[:id])

    unless current_user == wiki.user || current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to [@wiki]
    end
  end

  def authorize_moderator
    wiki = Wiki.find(params[:id])

    unless current_user == wiki.user || current_user.admin? || current_user.moderator?
      flash[:alert] = "You must be an admin or moderator to do that."
      redirect_to [@wiki]
    end
  end
end
