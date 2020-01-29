class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show, :destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to users_path, notice: 'User Updated Successfully' }
            else
                format.html { render :new }
            end
        end
    end

    def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to users_path, notice: 'User was destroyed.' }
        end
      end


    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                format.html { redirect_to users_path	, notice: 'User Created Successfully' }
            else
                format.html { render :new }
            end
        end
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
    def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :age, :degree, :year, :com_name, :website, :username, :password,:password_confirmation)
    end
end