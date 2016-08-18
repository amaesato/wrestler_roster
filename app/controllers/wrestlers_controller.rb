class WrestlersController < ApplicationController
  before_action :wrestler, except: [:index, :new, :create]

  def index
    @wrestlers = Wrestler.all
  end

  def show
  end

  def new
    @wrestler = Wrestler.new
  end

  def create
    @wrestler = Wrestler.new(wrestler_params)
    if  @wrestler.save
      redirect_to wrestler_path(@wrestler)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @wrestler.update(wrestler_params)
      #successful update in the database
      redirect_to wrestler_path(@wrestler)
    else
      #unsuccessful updat in the database
      render :edit
    end
  end

  def destroy
    @wrestler.destroy
    redirect_to wrestlers_path
  end

  private

  def wrestler_params
    params.require(:wrestler).permit(:name, :age, :gender, :weight)
  end

  def wrestler
    @wrestler = Wrestler.find(params[:id])
  end
end
