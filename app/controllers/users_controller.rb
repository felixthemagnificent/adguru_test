class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :switch_status, :process_status]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def switch_status
    respond_to do |format|
      format.js 
    end
  end

  def process_status
    respond_to do |format|
      if @user.update(user_params)
        format.js
      else
        format.js { render 'switch_status' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:status, :block_reason)
    end
end
