class SurveyResultSummarySerializer < ActiveModel::Serializer
  attributes :name, :url, :participant_count, :response_rate, :submitted_response_count
end
