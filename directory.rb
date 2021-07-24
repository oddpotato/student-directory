
def print_header
    puts "The students of Villain's Academy".center(40)
    puts "--------------".center(40)
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students".center(40)
end

def print(students)
  unique_cohort = []
  students.each do |student|
  unique_cohort.append(student[:cohort])
  unique_cohort.uniq!
  end
  if unique_cohort.length > 0
    unique_cohort.each do |cohort|
      puts "Students in the #{cohort} cohort"
      students.each do |person|
        if person[:cohort] == cohort
          puts "#{person[:name]}}"
        end
      end
    end
  else puts "Nothing to see here, chief"
  end
end 

def input_students
  students = []
  # take a student name
  puts "Please enter a student's name".center(40)
  name = gets.chop
  # take a student cohort
  puts "Please enter the student's cohort".center(40)
  cohort = gets.strip
  puts "When you are finished, please press 'Enter' 3 times".center(40)
  # This is what stops the input
  until name.empty? && cohort.empty? do
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
    if name.empty? && cohort.empty?
      students
    end
  end

# This print statement states how many students
students = input_students
print_header
print(students)
print_footer(students)
