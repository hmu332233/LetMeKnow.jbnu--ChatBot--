class MajorController < ApplicationController
  def create
    
     Major.create(major_params)
    
     redirect_to management_major_path
    
  end

  def update
  end

  def delete
  end
  
   
  def major_params
      return params.require(:major).permit(:name,:office,:tel,:fax)
   end
end
