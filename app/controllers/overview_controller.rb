class OverviewController < ApplicationController
  include CurrentUserConcern

  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    if @current_user
      @occurrences = Occurrence.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
      @display_user = @current_user
    else
      @occurrences = Occurrence.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    end
  end
end
