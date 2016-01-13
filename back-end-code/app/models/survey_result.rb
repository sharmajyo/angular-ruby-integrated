class SurveyResult < ActiveRecord::Base
  has_many :themes, dependent: :destroy
  has_many :respondants, dependent: :destroy
  has_many :questions, through: :themes

  def find_question(question_description)
    questions.find_by_description(question_description)
  end

  def participant_count
    respondants.size
  end

  def response_rate
    return 0 unless participant_count > 0
    submitted_response_count.to_f / participant_count.to_f
  end

  def url
     Rails.application.routes.url_helpers.survey_result_path(id: self.id)
  end

  def submitted_response_count
    respondants.submitted.size
  end
end
