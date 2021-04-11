class OpalColorsController < ApplicationController
  def create
    opal_color = OpalColor.new(opal_color_params)
    opal_color.save
    redirect_to root_path
  end

  def destroy
    opal_color = OpalColor.find(params[:id])
    opal_color.destroy
    redirect_to root_path
  end

  def move_higher
    OpalColor.find(params[:id]).move_higher
    redirect_to root_path
  end
  
  def move_lower
    OpalColor.find(params[:id]).move_lower
    redirect_to root_path
  end

  
  private

  def opal_color_params
    params.require(:opal_color).permit(:color)
  end
end