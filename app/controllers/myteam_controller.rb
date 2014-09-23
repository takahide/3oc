class MyteamController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_myteam, only: [:update]

  def update
    respond_to do |format|
      logger.debug "myteam_params: #{myteam_params}"
      if @myteam.update({ name: myteam_params })
        format.html { redirect_to "/posts"  }
      else
        format.html { render action: "/posts" } 
      end
    end
  end

  private
    def set_myteam
      @myteam=User.find_by_username current_user.username
    end
    def myteam_params
      params.require(:name)
    end
end
