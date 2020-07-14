class UsersController < ApplicationController
    before_action :require_logged_in
    skip_before_action :require_logged_in, only: [:new, :create]

    def index
        
    end

    def show
        @user = User.find(params[:id])
    end
    
    def new
    end

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user
        else
            byebug
            flash[:error] = @user.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
        params[:user].delete(:password) && params[:user].delete(:password_confirmation) if params[:user][:password].blank?
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash[:error] = @user.errors.full_messages
            render :edit
        end
    end

    def destroy
        byebug
        @user.destroy
        redirect_to logout_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :bio, :username, :password, :password_confirmation, :profile_photo)
    end
end
