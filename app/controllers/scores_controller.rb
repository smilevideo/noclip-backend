class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :update, :destroy]

  # GET /scores
  def index
    @scores = Score.all

    render json: @scores, include: [:user]
  end

  # GET /scores/1
  def show
    render json: @score
  end

  # POST /scores
  def create
    @score = Score.create(score_params)


      render json: @score, status: :created, location: @score

  end





  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def score_params
      params.require(:score).permit(:user_id, :score)
    end
end
