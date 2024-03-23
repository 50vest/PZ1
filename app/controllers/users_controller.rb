class UsersController < ApplicationController
    def index
        @users = User.all
      end
      def show
        @user = User.find(params[:id])
      end
    def change_role_to_seller
        @user = User.find(params[:id])
        authorize @user, :change_role_to_seller?
        @user.update(role: "seller")
        redirect_to @user, notice: "User role changed to seller"
      end
      before_action :set_product, only: [:show, :edit, :update, :destroy]
      before_action :authenticate_user! 
      
      def new
        @user = User.new
      end
            