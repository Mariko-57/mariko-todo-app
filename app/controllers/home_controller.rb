class HomeController < ApplicationController
  def index
    @board = Board.first
  end
end