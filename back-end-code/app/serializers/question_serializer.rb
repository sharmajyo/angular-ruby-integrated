class QuestionSerializer < ActiveModel::Serializer
  attributes :description, :question_type

  has_many :survey_responses
end
