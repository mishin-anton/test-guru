class Admin::BagesController < Admin::BaseController

  before_action :find_bage, only: [:show]

  def index
    @bages = Bage.all
  end

  def new
    @bage = Bage.new()
  end

  def show

  end

  def create
    @bage = Bage.new(bage_params)
    @bage.img_filename = 'bage'

    if @bage.save
      redirect_to admin_bages_path, notice: 'success'
    else
      render :new
    end
  end

  private

  def find_bage
    @bage = Bage.find(params[:id])
  end

  def bage_params
    params.require(:bage).permit(:name, :img_filename, :rule_id)
  end
end
