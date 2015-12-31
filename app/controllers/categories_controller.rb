class CategoriesController < ApplicationController
end

def create
  @category = Category.new(name: params[:name])
    # @category.attributes = {user_id: current_user.id}
    if @category.save
      flash[:success] = "New category created"
      redirect_to "/categories/#{@category.id}"
    else
      render :new
    end
end