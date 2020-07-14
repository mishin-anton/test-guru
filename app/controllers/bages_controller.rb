class BagesController < ApplicationController

  before_action :authenticate_user!

  def index
    @bages = Bage.all
  end

end
