class V1::OccurrencesController < V1::BaseController
  before_action :set_occurrence, only: [:show, :update, :destroy]

  def index
    @occurrences = Occurrence.all

    render json: @occurrences
  end

  def show
    render json: @occurrence
  end

  def create
    @occurrence = Test.new(occurrence_params)

    if @occurrence.save
      render json: @occurrence, status: :created, location: @occurrence
    else
      render json: @occurrence.errors, status: :unprocessable_entity
    end
  end

  private
    def set_occurrence
      @occurrence = Occurrence.find(params[:id])
    end

    def occurrence_params
      params.require(:occurrence).permit(:name, :start_time)
    end
end
