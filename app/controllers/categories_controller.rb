class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def show
    @category = Category.find_by(id: params[:id])
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
    flash[:success] = "Category has been edited."
  end

  def update
    @category = Category.find_by(id: params[:id])
    if @category.update(category_params)
      redirect_to "/category/#{@category.id}"
      flash[:success] = "Category has been updated."
    else
      render :index
    end
  end


  def destroy
    Category.find_by(id: params[:id]).destroy!
    redirect_to "/admin"
    flash[:success] = "Category has been deleted."
  end


private

    def category_params    
      params.require(:category).permit(:name)
    end

 

end