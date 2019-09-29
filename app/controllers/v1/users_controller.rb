# frozen_string_literal: true

class V1::UsersController < ApplicationController
  ###
  # @description:  Get list of users
  # @param {any}:none
  # @return {any}: list of users
  ###

  def index
    @users = User.all
    render json: @users || [], status: :ok
  end

  ###
  # @description: get user by id
  # @param {id}: User Id
  # @return {any}: user associated with that id
  ###

  def show
    @user = User.where(id: params[:id]).first
    render json: @user || [], status: :ok
  end

  ###
  # @description: Handle create new user
  # @param {any}: user params
  # @return {any}: newly created user
  ###

  def create
    @user = User.new(user_params)
    @user.save
    render json: @user || [], status: :created
  end
  
  ###
  # @description:
  # @param {any}:
  # @return {any}:
  ###

  def destroy
    @user = User.where(id: params[:id]).first
    if @user
      @user.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  # private methods goes here
  private

  # @description:Validate user params
  # @param {any}: Name,email,source
  # @return {any}: returns required user params
  ###

  def user_params
    params.require(:user).permit(:name, :email, :service_provider)
  end
end
