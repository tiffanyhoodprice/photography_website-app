class CategoriesController < ApplicationController


  def create
    @category = Category.new(name: params[:category][:name])
      # @category.attributes = {user_id: current_user.id}
      if @category.save
        flash[:success] = "New category created"
        redirect_to root_path
      else
        render :new
      end
  end

  def new
    @category = Category.new
  end

end