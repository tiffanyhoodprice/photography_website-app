class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
      # @category.attributes = {user_id: current_user.id}
      if @category.save
        flash[:success] = "New category created"
        redirect_to '/admin'
      else
        render :new
      end
  end

  def edit
    id = params[:id]
    @category = Category.find_by(id: id)
  end

  def destroy
    Category.find_by(id: params[:id]).destroy!
    redirect_to "/admin"
  end


private

    def category_params    
      params.require(:category).permit(:name)
    end

 

end