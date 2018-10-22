class GameroomsController < ApplicationController
  def index
    @gameroom = Gameroom.new
    @gamerooms = Gameroom.all
  end

  def new
    if request.referrer.split("/").last == "gamerooms"
      flash[:notice] = nil
    end
    @gameroom = Gameroom.new
  end

  def edit
    @gameroom = Gameroom.find_by(token: params[:token])
  end

  def create
    @gameroom = current_user.build_gameroom(gameroom_params)
    if @gameroom.save
      @gameroom.score_cards.create(:user_id=> current_user.id)
      redirect_to @gameroom 
    else
      respond_to do |format|
        flash[:notice] = {error: ["a gameroom with this topic already exists"]}
        format.html { redirect_to new_gameroom_path }
        format.js { render template: 'gamerooms/gameroom_error.js.erb'} 
      end
    end
  end

  def update
    gameroom = Gameroom.find_by(token: params[:token])
    gameroom.update(gameroom_params)
    redirect_to gameroom
  end

  def show
    @gameroom = Gameroom.find_by(token: params[:token])
  end

  def join
    gameroom = Gameroom.find_by(token: params[:token])
    gameroom.score_cards.create(:user_id=> current_user.id)
    redirect_to gameroom
  end

  private

    def gameroom_params
      params.require(:gameroom).permit(:topic)
    end

end
