@students = []

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the Students"
  puts "2. Show the Students"
  puts "3. Update an Entry"
  puts "9. Exit"
end

def process(selection)
    case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "3"
       updating_entry
    when "9"
      exit
    else 
      puts "I don't understand. Try again."
    end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
    puts "The students of Villain's Academy".center(40)
    puts "--------------".center(40)
end

def print_footer
    puts "Overall, we have #{@students.count} great students".center(40)
end

def print_student_list
    @students.each.with_index(1) do |student, index|
        puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(40)
    end
end

def updating_entry
puts "Which entry would you like to change?".center(40)
entry = gets.chomp()
puts "Attempt to access which key?".center(40)
key = gets.chomp()
puts "Please enter the new value".center(40)
value = gets.chomp()
  @students.each.with_index(1) do |sub_hash, index|
  if index == entry.to_i
    sub_hash.each do |k, v|
      if k == key.to_sym
        v.to_s.gsub!(v.to_s,value.to_s)
      end 
    end
  end
  end
end

def input_students
  # @students = []
  # take a student name
  puts "Please enter a student's name".center(40)
  name = gets.chomp()
  # take a student cohort
  puts "Please enter the student's cohort".center(40)
  cohort = gets.chomp()
  puts "When you are finished, please press 'Enter' 3 times".center(40)
  # This is what stops the input
  until name.empty? && cohort.empty? do
  # This is appending the default value is they don't insert name or cohort
    if cohort.empty?
      @students << {name: name, cohort: 'november', hobbies: :swimming, country: :USA}
    elsif name.empty?
      @students << {name: 'Apples', cohort: cohort, hobbies: :swimming, country: :USA}
    else @students << {name: name, cohort: cohort, hobbies: :swimming, country: :USA}
    end
  # This is printing depending on what's up
    if @students.count == 1  
      puts "Now we have 1 student".center(40)
      else puts "Now we have #{@students.count} students".center(40)
    end
  puts "Please enter another name".center(40)
  name = gets.chomp
  puts "Please enter another cohort".center(40)
  cohort = gets.chomp
  end
  @students
  end

# This print statement states how many students
#students = input_students
#print_header
#print(students)
#print_footer(students)

interactive_menu