require 'faker'

FactoryGirl.define do
  factory :survey_result

  factory :survey_result_with_question, parent: :survey_result do
    after(:create) do |survey_result|
      theme = create(:theme, survey_result: survey_result)
      create(:question, theme: theme)
    end
  end

  factory :question do
    theme
    description { Faker::Lorem.sentence }
  end

  factory :theme do
    survey_result
  end

  factory :respondant do
    survey_result
    submitted_at Time.now
  end

  factory :survey_response do
    question
    response_content 2
    respondant
  end
end
