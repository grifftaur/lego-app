class LegopinsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

  def index
    @legopins = Legopin.all
  end

  def show
    @legopins = Legopin.find(params[:id])
  end

  def new
    @legopins = Legopin.new
  end

  def create
    @legopins = Legopin.new(lego_params)
    if @legopins.save
      flash[:success] = 'Lego set successfully created.'
      redirect_to root_path
    else
      flash[:error] = 'Lego set was not created.'
      render :new
    end
  end

  def edit
    @legopins = Legopin.find(params[:id])
  end

  def update
    @legopins = Legopin.find(params[:id])
    if @legopins.update(lego_params)
      redirect_to @legopins, notice: 'Lego set was successfully updated.'
    else
      flash[:error] = 'Lego set was not updated.'
      render :edit
    end
  end

  def destroy
    @legopins = Legopin.find(params[:id])
    @legopins.destroy
    redirect_to root_path, notice: 'Lego set successfully deleted.'
  end

private

   def lego_params
    params.require(:legopin).permit(:name,:year,:setnumber,:url,:image)
   end

end
