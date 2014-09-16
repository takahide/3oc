class TeamsController < ApplicationController
  def all
    @teams=User.all
  end
  def index
    @teams=User.where "username=?", params[:id]
  end
end
