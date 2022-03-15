class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy ]
  before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show
    @user = User.find_by(id: @report.user_id)
  end

  def new
    @report = Report.new
  end

  def edit
  end

  def create
    @report = current_user.reports.create(report_params)

    @report.save
    redirect_to @report, notice: "Report was successfully created."
  end

  def update
    @report.update(report_params)
    redirect_to @report, notice: "Report was successfully updated."
  end

  def destroy
    @report.destroy
    redirect_to reports_url, notice: "Report was successfully destroyed."
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:title, :content)
    end

    def ensure_user
      @reports = current_user.reports
      @report = @reports.find_by(id: params[:id])
      redirect_to new_report_path unless @report
    end
end

