class StaticPagesController < ApplicationController
  def home
    @vehicles = Vehicle.limit(4)
  end
end
