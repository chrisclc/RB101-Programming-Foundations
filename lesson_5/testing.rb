def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each do |section|
    section.times { uuid += characters.sample }
    uuid += '-' 
  end

  uuid.delete_suffix('-')
end

p generate_UUID