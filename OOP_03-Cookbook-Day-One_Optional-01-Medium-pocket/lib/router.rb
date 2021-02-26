class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "---------------------------------"
    puts "Welcome to your DEV Pocket Reader"
    puts "---------------------------------\n\n"
    while @running
      print_menu
      action = gets.chomp.to_i
      print "clear"
      route(action)
    end
    puts "Bye bye!"
  end

  private

  def print_menu
    puts "----------------------------"
    puts "What do you want to do next?"
    puts "----------------------------"
    puts "1. List posts"
    puts "2. Save post for later"
    puts "3. Read post"
    puts "4. Mark post as read"
    puts "5. Exit"
    print "> "
  end

  def route(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.show
    when 4 then @controller.mark_as_read
    when 5 then @running = false
    else
      puts "Try again"
    end
  end
end
