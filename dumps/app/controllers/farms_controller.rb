class FarmsController < ApplicationController
  def index
@farms = Farm.all

  end
  def show
    @farm = Farm.find(params[:id])
  end
  def new
  @farm  = Farm.new

  end
  def create
  	@farm = Farm.create(farm_params)
  	if @farm.save
  		redirect_to farms_path , :notice => "your farm is set"
  	else
  		render :new
  	end
  end
  def farm_params
  params.require(:farm).permit(:title, :content)
  end

  def edit
  	@farm = Farm.find(params[:id])
  end
 def update
  @farm = Farm.find(params[:id])
    if @farm.update_attributes(farm_params)
  	redirect_to farms_path, :notice => "your farm is updated"
    else
  	render "edit"
    end


 end
 
 def destroy
  @farm = Farm.find(params[:id])
  @farm.destroy
  flash[:notice] = "deleted your farm"
  redirect_to action: "index"
  
 end
def farm_params
	params.require(:farm).permit(:title,  :content)


end
end