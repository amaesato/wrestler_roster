class TournamentsController < ApplicationController
  before_action :wrestler
  before_action :tournament, except: [:index, :new, :create]

  def index
    @tournaments = Tournament.all
  end

  def show
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = @wrestler.tournaments.new(tournament_params)
    if @tournament.save
      redirect_to wrestler_tournament_path(@wrestler, @tournament)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tournament.update(tournament_params)
      redirect_to wrestler_tournament_path(@wrestler, @tournament)
    else
      redirect_to :edit
    end
  end

  def destroy
    @tournament.destroy
    redirect_to wrestler_tournaments_path(@wrestler)
  end

  private

    def tournament_params
      params.require(:tournament).permit(:name, :win, :loss, :grade, :place)
    end

    def wrestler
      @wrestler = Wrestler.find(params[:wrestler_id])
    end

    def tournament
      @tournament = @wrestler.tournaments.find(params[:id])
    end
end
