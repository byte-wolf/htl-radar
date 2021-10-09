class OccurrencesController < ApplicationController
  before_action :set_occurrence, only: %i[ show edit update destroy ]

  # GET /occurrences or /occurrences.json
  def index
    if params['from'] && params['to']
      @occurrences = Occurrence.where(:start_time => params['from'].to_date.beginning_of_day..params['to'].to_date.end_of_day)
    else
      @occurrences = Occurrence.all
    end
  end

  def compact
    if params['day']
      @occurrences = Occurrence.where(:start_time => params['day'].to_date.beginning_of_day..params['day'].to_date.end_of_day)

      respond_to do |format|
        format.html { render "occurrences/compact", :layout => false }
      end
    end
  end

  # GET /occurrences/1 or /occurrences/1.json
  def show
    if @current_user
      @occurrence = Occurrence.find(params[:id])
    else
      @occurrence = Occurrence.new
    end
  end

  # GET /occurrences/new
  def new
    @occurrence = Occurrence.new
  end

  # GET /occurrences/1/edit
  def edit
    if !@current_user
      respond_to do |format|
        format.html { render 'errors/forbidden', status: :forbidden }
        format.json { render json: {status: 'forbidden'}, status: :forbidden }
      end
    end
  end

  # POST /occurrences or /occurrences.json
  def create
    if @current_user
      @occurrence = Occurrence.new(occurrence_params)

      respond_to do |format|
        if @occurrence.save
          format.html { redirect_to @occurrence, notice: "Occurrence was successfully created." }
          format.json { render :show, status: :created, location: @occurrence }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @occurrence.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render 'errors/forbidden', status: :forbidden }
        format.json { render json: {status: 'forbidden'}, status: :forbidden }
      end
    end
  end

  # PATCH/PUT /occurrences/1 or /occurrences/1.json
  def update
    if @current_user
      respond_to do |format|
        if @occurrence.update(occurrence_params)
          format.html { redirect_to @occurrence, notice: "Occurrence was successfully updated." }
          format.json { render :show, status: :ok, location: @occurrence }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @occurrence.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { render 'errors/forbidden', status: :forbidden }
        format.json { render json: {status: 'forbidden'}, status: :forbidden }
      end
    end
  end

  # DELETE /occurrences/1 or /occurrences/1.json
  def destroy
    if @current_user
      @occurrence.destroy
      respond_to do |format|
        format.html { redirect_to occurrences_url, notice: "Occurrence was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { render 'errors/forbidden', status: :forbidden }
        format.json { render json: {status: 'forbidden'}, status: :forbidden }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occurrence
      @occurrence = Occurrence.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def occurrence_params
      params.require(:occurrence).permit(:name, :start_time)
    end
end
