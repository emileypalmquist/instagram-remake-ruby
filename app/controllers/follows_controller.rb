class FollowsController < ApplicationController
    
    def create
        Follow.create(follow_params)
        redirect_to params[:to]
    end

    def destroy
        byebug
    end

    private

    def follow_params
        params.require(:follow).permit(:follower_id, :followee_id)
    end
end
