# student_count = 11
# This puts the student roster on individual lines
# students = [ 
# { name: "Dr Hannibal Lecter", cohort: :november},
# { name: "Darth Vader", cohort: :november},
# { name: "Nurse Ratched", cohort: :november},
# { name: "Michael Corleone", cohort: :november},
# { name: "Alex DeLarge", cohort: :november},
# { name: "The Wicked Witch of the West", cohort: :november},
# { name: "Terminator", cohort: :november},
# { name: "Freddy Krueger", cohort: :november},
# { name: "The Joker", cohort: :november},
# { name: "Joffrey Baratheon", cohort: :november},
# { name: "Norman Bates", cohort: :november}
# ]

def print_header
    puts "The students of Villain's Academy"
    puts "--------------"
end

# def print(names)
#    names.each do |name|
#      puts name
#    end
# end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    while !name.empty? do
        # add the students hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    students
end

# This print statement states how many students
students = input_students
print_header
print(students)
print_footer(students)
