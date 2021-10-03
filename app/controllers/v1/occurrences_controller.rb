class V1::OccurrencesController < V1::BaseController
  include CurrentUserConcern

  before_action :set_occurrence, only: [:show, :update, :destroy]

  def index
    if params['from'] and params['to']
      @occurrences = Occurrence.where(:start_time => params['from'].to_date.beginning_of_day..params['to'].to_date.end_of_day)

    else
      @occurrences = Occurrence.all
    end

    render json: @occurrences
  end

  def show
    if @current_user
      render json: @occurrence
    else
      render 'errors/forbidden', :status => 403
    end
  end

  def create
    if @current_user
      @occurrence = Test.new(occurrence_params)

      if @occurrence.save
        render json: @occurrence, status: :created, location: @occurrence
      else
        render json: @occurrence.errors, status: :unprocessable_entity
      end
    else
      render json: {
        status: 403
      }
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
