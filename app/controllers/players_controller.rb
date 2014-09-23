class PlayersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to "/my/team"  }
      else
        format.html { render action: "/my/team" } 
      end
    end
  end

  def update 
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to "/my/team"  }
      else
        format.html { render action: "/my/team" } 
      end
    end
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:name, :number)
    end
end
