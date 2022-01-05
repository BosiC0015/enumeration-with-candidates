# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    end
  end
  return nil
end

def experienced?(candidate)
  if candidate[:years_of_experience] >= 2
    return true
  end
  return false
end

def github_points_enough?(candidate)
  if candidate[:github_points] >= 100
    return true
  end
  return false
end

def languages?(candidate)
  if candidate[:languages].include?('Ruby')  && candidate[:languages].include?('Python')
    return true
  end
  return false
end

def application_day?(candidate)
  if candidate[:date_applied] >= 15.days.ago.to_date
    return true
  end
  return false
end

def age?(candidate)
  if candidate[:age] > 17
    return true
  end
  return false
end

def qualified_candidates(candidates)
  qualified_candidates = []
  candidates.each do |candidate|
    if experienced?(candidate) && github_points_enough?(candidate) && languages?(candidate) && application_day?(candidate) && age?(candidate)
      qualified_candidates.push(candidate)
    end
  end
  return qualified_candidates
end

def ordered_by_qualifications(candidates)
  reordered_candidates = []
  experience = []
  candidates.each do |candidate|
    experience.push(candidate[:years_of_experience])
  end
  years_of_experience_array = experience.sort.reverse
  years_of_experience_array.each do |years_of_experience|
    candidates.each do |candidate|
      if candidate[:years_of_experience] == years_of_experience
        reordered_candidates.push(candidate)
        years_of_experience_array.shift
      end
    end
  end
  return reordered_candidates
end
