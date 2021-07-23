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
  students = []
  # take a student name
  puts "Please enter a student's name".center(40)
  name = gets.chomp()
  # take a student cohort
  puts "Please enter the student's cohort".center(40)
  cohort = gets.chomp()
  puts "When you are finished, please type 'stop'"
  # This is what stops the input
  until (name == "stop") || (cohort == "stop") do
  # This is appending the default value is they don't insert name or cohort
    if cohort.empty?
      students << {name: name, cohort: :november, hobbies: :swimming, country: :USA}
    elsif name.empty?
      students << {name: :apples, cohort: cohort, hobbies: :swimming, country: :USA}
    else students << {name: name, cohort: cohort, hobbies: :swimming, country: :USA}
    end
  # This is printing depending on what's up
    if students.count == 1
      puts "Now we have 1 student".center(40)
      else puts "Now we have #{students.count} students".center(40)
    end
  puts "Please enter another name".center(40)
  name = gets.chomp
  puts "Please enter another cohort".center(40)
  cohort = gets.chomp
  end
    if (name == "stop") || (cohort == "stop") 
      students
    end
  end

# This print statement states how many students
students = input_students
print_header
print(students)
print_footer(students)
