class OverviewController < ApplicationController
  include CurrentUserConcern

  before_action :set_ui

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    if @current_user
      @occurrences = Occurrence.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    else
      @occurrences = Occurrence.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    end
  end

  private
    def set_ui
      @active_user = @current_user
      @page = 'overview'
    end
end
