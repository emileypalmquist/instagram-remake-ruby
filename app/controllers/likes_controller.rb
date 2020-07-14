class LikesController < ApplicationController
   def create  
    Like.create(like_params)
    redirect_to params[:to]
   end
   
   private

   def like_params
        params.require(:like).permit(:user_id, :post_id)
   end
end
