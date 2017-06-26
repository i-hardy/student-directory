class Joker
  def no_fun
    puts "You're no fun!"
  end

  def joking
    joke_list = {
    "A broken pencil" => "Never mind, it's pointless",
    "Cows go" => "No, cows go moo",
    "Etch" => "Bless you",
    "Amos" => "A mosquito",
    "Lettuce" => "Lettuce in, it's cold",
    "Beats" => "Beats me"
    }
    joke = joke_list.to_a[rand(joke_list.length)]
    puts "Knock knock"
    response = gets.chomp.downcase
    if response == "who's there?"
      puts joke[0]
      response = gets.chomp.downcase
        if response == "#{joke[0].downcase} who?"
        puts joke[1]
        else
          no_fun
        end
    else
        no_fun
    end
  end
end

puts "#{IO.read($0)}"
