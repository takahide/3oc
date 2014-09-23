class TeamsController < ApplicationController
  def all
    @teams=User.all
  end
  def index
    @team=User.find_by_username params[:id]
  end
end
