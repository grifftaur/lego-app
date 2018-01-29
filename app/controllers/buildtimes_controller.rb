class BuildtimesController < ApplicationController
  before_action :find_legopin


   def new
     @buildtimes = BuildTime.new
   end



   def create
      @legopins = Legopin.find(params[:legopin_id])
      @buildtimes = BuildTime.new(build_params)
      @buildtimes.lego_pins_id = @legopins.id
      @buildtimes.user_id = current_user.id

      if @buildtimes.save
        redirect_to legopin_path @legopins
      else
        render 'new'
      end
   end

  private

   def build_params
     params.require(:buildtimes).permit(:hours, :minutes)
   end

   def find_legopin
     @legopins = Legopin.find(params[:legopin_id])
   end
end
