class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        # byebug
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "No account found"
            @user = User.new
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end