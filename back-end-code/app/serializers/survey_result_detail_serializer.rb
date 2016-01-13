class SurveyResultDetailSerializer < ActiveModel::Serializer
  attributes :name, :url, :participant_count, :response_rate, :submitted_response_count

  has_many :themes
end
