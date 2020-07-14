class BagePassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_bage_passage, only: %i[show update]

  def index
    @bage_passages = current_user.bage_passages
  end

  def update

  end

  private

  def set_bage_passage
    @bage_passage = BagePassage.find(params[:id])
  end

end
