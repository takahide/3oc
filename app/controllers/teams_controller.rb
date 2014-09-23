class TeamsController < ApplicationController
  before_action :set_team, only: [:update]

  def all
    @teams=Team.all
    if signed_in?
      @team = Team.find_by_user_id current_user.id
    end
  end

  def show
    @team=Team.find_by_url params[:id]
  end

  def myteam
    authenticate_user!
    @new_player = Player.new
    @players = Player.all
    @new_post = Post.new
    @posts = Post.all
    @team = Team.find_by_user_id current_user.id
  end

  def create
    authenticate_user!
    @team = Team.new({ user_id: current_user.id, url: current_user.username })
    respond_to do |format|
      if @team.save
        format.html { redirect_to '/my/team'}
      else
        format.html { redirect_to '/my/team'}
      end
    end
  end

  def update
    authenticate_user!
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to "/my/team"  }
      else
        format.html { render action: "/my/team" } 
      end
    end
  end

  private
    def set_team
      @team=Team.find_by_user_id current_user.id
    end
    def team_params
      params.require(:team).permit(:name, :url)
    end
end
