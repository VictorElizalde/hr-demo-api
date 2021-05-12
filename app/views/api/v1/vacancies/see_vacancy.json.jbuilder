json.id @vacancy.id
json.title @vacancy.title
json.description @vacancy.description
json.salary_range "#{@vacancy.min_salary}K - #{@vacancy.max_salary}K"
