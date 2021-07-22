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
    puts "The students of Villain's Academy".center(40)
    puts "--------------".center(40)
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students".center(40)
end

def print(students)
    students.each.with_index(1) do |student, index|
        puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
    end
end

def input_students
    puts "Please enter the names of the students".center(40)
    puts "To finish, just hit return twice".center(40)
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    while !name.empty? do
        # add the students hash to the array
        students << {name: name, cohort: :november, hobbies: :swimming, country: :USA}
        puts "Now we have #{students.count} students".center(40)
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
