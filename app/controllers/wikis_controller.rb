class WikisController < ApplicationController
  def index
    @user = current_user
    if @user.admin?
      @wikis = Wiki.all
    elsif @user.premium?
      @wikis = Wiki.where(private: false) | @user.wiki_collaborations | @user.wikis
    elsif @user.standard?
      @wikis = Wiki.where(private: false) | @user.wiki_collaborations
    else
      @wikis = Wiki.where(private: false)
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @user = current_user
    @wiki = Wiki.find(params[:id])
    @user_emails = User.where.not(id: current_user.id || @wiki.users.pluck(:id)).map(&:email)
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.update(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki page. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki page."
      render :show
    end
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
