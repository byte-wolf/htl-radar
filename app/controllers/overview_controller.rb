class OverviewController < ApplicationController
  def index
    start_date = params.fetch(:start_date, Date.today).to_date
    @occurrences = Occurrence.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end
end
