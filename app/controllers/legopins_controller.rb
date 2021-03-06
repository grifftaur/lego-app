class LegopinsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

=begin
  def search
    if params[:query].present?
      @legopins = Legopin.search(params[:query])
    else
      @legopins = Legopin.all
    end
  end
=end

  def index
      @q = Legopin.ransack(params[:q])
      @legopins = @q.result
      #@legopins = Legopin.all
  end

  def show
    @legopins = Legopin.find(params[:id])
    @avg_buildtime = BuildTime.where(legopins_id: @legopins.id).average(:completetime)

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
