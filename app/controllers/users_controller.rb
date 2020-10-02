class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  # def show
    # rates = 0
    # unless rates == 0
    #   rates = @user.user_shops.where.not(rate: nil).average(:rate)
    #   rates = rates.*10
    #   @rates = rates.round
    # end
    # gon.labels = []
    # gon.data = []
  # end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
      flash[:success] = "プロフィールを更新しました"
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
