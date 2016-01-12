class PagesController < ApplicationController

  def index
    @albums = Album.all
  end

  def about
  end

  def contact
  end

end
