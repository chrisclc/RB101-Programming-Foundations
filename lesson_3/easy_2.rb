#1
ages.include?("Spot")
ages.key?("Spot")
ages.member?("Spot")

#2
munsters_description.swapcase!
munsters_description.capitalize!
munsters_description.downcase!
munsters_description.upcase!

#3
ages.merge!(additional_ages)

#4
advice.match?('Dino')
advice.include?('Dino')

#5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#6
flintstones.push("Dino")
flintstones << "Dino"

#7
flintstones.push("Dino").push("Hoppy")
flintstones.concat(["Dino" ,"Hoppy"])

#8
advice.slice!(0, advice.index('house'))

#9
statement.count("t")

#10
title.center(40)
