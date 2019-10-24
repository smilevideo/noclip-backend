class GamesController < ApplicationController
  def index
    @games = Game.all
    render json: @games, include: [:user]
  end

  def show
    render json: @game
  end

  def create
    Game.create(user_id: params[:game][:user_id], score: params[:game][:score])
  end

  private

    def game_params
      params.require(:game).permit(:user_id, :score)
    end
end
