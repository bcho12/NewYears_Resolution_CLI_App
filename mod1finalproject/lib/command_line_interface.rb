require 'pry'
class CommandLineInterface

  def fireworks
puts <<-'EOF'
                                  .''.
        .''.             *''*    :_\/_:     .
       :_\/_:   .    .:.*_\/_*   : /\ :  .'.:.'.
   .''.: /\ : _\(/_  ':'* /\ *  : '..'.  -=:o:=-
  :_\/_:'.:::. /)\*''*  .|.* '.\'/.'_\(/_'.':'.'
  : /\ : :::::  '*_\/_* | |  -= o =- /)\    '  *
   '..'  ':::'   * /\ * |'|  .'/.\'.  '._____
       *        __*..* |  |     :      |.   |' .---"|
        _*   .-'   '-. |  |     .--'|  ||   | _|    |
     .-'|  _.|  |    ||   '-__  |   |  |    ||      |
     |' | |.    |    ||       | |   |  |    ||      |
  ___|  '-'     '    ""       '-'   '-.'    '`      |____
  jgs~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
EOF
  end

  def show2019
puts <<-'EOF'
                                        ,---.-,
      ,----,     ,----..        ,---,  '   ,'  '.
    .'   .' \   /   /   \    ,`--.' | /   /      \
  ,----,'    | /   .     :  /    /  :.   ;  ,/.  :
  |    :  .  ;.   /   ;.  \:    |.' ''   |  | :  ;
  ;    |.'  /.   ;   /  ` ;`----':  |'   |  ./   :
  `----'/  ; ;   |  ; \ ; |   '   ' ;|   :       ,
    /  ;  /  |   :  | ; | '   |   | | \   \      |
   ;  /  /-, .   |  ' ' ' :   '   : ;  `---`---  ;
  /  /  /.`| '   ;  \; /  |   |   | '     |   |  |
./__;      :  \   \  ',  /    '   : |     '   :  ;
|   :    .'    ;   :    /     ;   |.'     |   |  '
;   | .'        \   \ .'      '---'       ;   |.'
`---'            `---`                    '---'

EOF
  end

  def greet
    puts "Welcome to 2019!!!!!🎉🎇🎆 2️⃣ 0️⃣ 1️⃣ 9️⃣ 👶 🎉🎇🎆"
  end


  def home
    puts "\n"
    puts "Type 'add' to add a resolution"
    puts "Type 'search' to search resolutions by category"
    puts "Type 'all' to see all resolutions"
    puts "Type 'categories' to see all categories"
    puts "Type 'edit' to edit a resolution"
    puts "Type 'delete' to delete a resolution"
    puts "Type 'exit' to exit"
    input = gets.chomp
    if input == "add"
      addresolution
    elsif input == "search"
      search_by_category
    elsif input == "edit"
      edit_resolution
    elsif input == "all"
      allresolutions
    elsif input == "delete"
      delete_resolution
    elsif input == "categories"
      allcategories
    elsif input == "exit"
      puts "Have a happy new year!!"
    elsif input == "fireworks"
      fireworks
      home
    elsif input == "2019"
      show2019
      home
    else
      puts "Invalid input, Try again"
      home
    end
  end


  def addresolution
    puts "What is your resolution for 2019?"
    resolution = gets.chomp
    puts "Enter categories for this resolution separated by commas: "
    categories = gets.chomp

    new_resolution = Resolution.find_or_create_by(content: resolution)

    category_array = categories.split(',')
    category_array.each do |c|
      c = Category.find_or_create_by(name: c)
      new_resolution.categories << c
    end
    home
  end


  def search_by_category
    puts "Type in category to search for resolution: "
    input = gets.chomp

    category = Category.find_or_create_by(name: input)
    ResolutionCategory.where(category: category).each do |c|
      puts "\n" + c.resolution.content
    end
    home
  end

  def edit_resolution
    puts "Enter the resolution you would like to edit: "
    input = gets.chomp

    if Resolution.exists?(content: input)
      puts "Enter edited version of resolution: "
      new_resolution_content = gets.chomp
      old_resolution = Resolution.find_by(content: input)
      old_resolution.update(content: new_resolution_content)
      home
    else
      puts "This resolution does not exist."
      home
    end
  end

  def delete_resolution
    puts "Enter the resolution you would like to delete: "
    input = gets.chomp

    if Resolution.exists?(content: input)
      delete_resolution = Resolution.find_by(content: input)
      ResolutionCategory.where(resolution: delete_resolution).destroy
      delete_resolution.destroy
      home
    else
      puts "This resolution does not exist."
      home
    end
  end


  def allresolutions
    resolutions = Resolution.all
    puts "\nResolutions for 2019: \n\n"
    i = 1
    resolutions.each do |r|
      puts "#{i.to_s}.  #{r.content}"
      i += 1
      puts "\ncategories:"
      r.categories.each do |c|
        puts "-" + c.name
      end
      puts "\n"
    end
    home
  end

  def allcategories
    categories = Category.all
    puts "\nCategories of Resolutions: \n"
    categories.each do |c|
      puts c.name
    end
    home
  end



  def run
    show2019
    fireworks
    greet
    #binding.pry
    home
  end

end
