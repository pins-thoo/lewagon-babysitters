class BabysittersController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]

  def index
    @babysitters = policy_scope(Babysitter)
  end

  def show
    @reservation = Reservation.new
    @babysitter = Babysitter.find(params[:id])
    authorize @babysitter
  end

  def new

  end

  def create
    @babysitter = Babysitter.new
    @user = current_user
  end
end
