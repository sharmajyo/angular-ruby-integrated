class SurveyResultsController < ApplicationController
  def index
    @all_results = SurveyResult.all
    render json: @all_results, each_serializer: SurveyResultSummarySerializer
  end

  def show
    @survey_result = SurveyResult.find(params[:id])
    render json: @survey_result, serializer: SurveyResultDetailSerializer
  end
end
