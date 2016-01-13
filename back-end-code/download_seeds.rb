puts '# Survey Results'
SurveyResult.all.each do |survey_result|
  puts "SurveyResult.create({ id: #{survey_result.id}, name: '#{survey_result.name}'})"
end

puts '# Themes'
Theme.all.each do |theme|
  puts "Theme.create({ id: #{theme.id}, name: '#{theme.name}', survey_result_id: #{theme.survey_result.id} })"
end

puts '# Questions'
Question.where(question_type: 'ratingquestion').each do |question|
  puts "Question.create({ id: #{question.id}, description: \"#{question.description}\", question_type: '#{question.question_type}', theme_id: #{question.theme.id} })"
end

puts '# Respondants'
Respondant.all.each do |respondant|
  puts "Respondant.create({id: #{respondant.id}, email: '#{respondant.email}', employee_id: '#{respondant.employee_id}', submitted_at: '#{respondant.submitted_at}', survey_result_id: #{respondant.survey_result.try(:id)}})"
end

puts '# Survey Responses'
SurveyResponse.all.each do |survey_response|
  puts "SurveyResponse.create({id: #{survey_response.id}, question_id: #{survey_response.question.try(:id)}, respondant_id: #{survey_response.respondant.try(:id)}, response_content: '#{survey_response.response_content}'})"
end
