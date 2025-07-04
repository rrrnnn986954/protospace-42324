class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params.merge(user_id: current_user.id))
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @prototypes = Prototype.includes(:user)
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  def set_prototype
  @prototype = Prototype.find(params[:id])
  end

  def move_to_index
    unless current_user == @prototype.user
      redirect_to root_path
    end
  end

end
