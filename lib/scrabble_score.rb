class String
  define_method(:scrabble) do
    letter_scores = {"a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1, "l" => 1, "n" => 1, "r" => 1, "s" => 1, "t" => 1, "d" => 2, "g" => 2, "b" => 3, "m" => 3, "p" => 3, "f" => 4, "h" => 4, "v" => 4, "w" => 4, "y" => 4, "k" => 5, "j" => 8, "x" => 8, "q" => 10, "q" => 10}

    letters = self.split("")
    score = 0
    letters.each() do | letter |
      score += letter_scores.fetch(letter)
    end
  score
  end
end


class Fixnum
  define_method(:numbers_to_words) do
    ones = {0 =>"", 1=>"one", 2=>"two", 3=>"three", 4=>"four", 5=>"five", 6=>"six", 7=>"seven", 8=>"eight", 9=>"nine"}
    teens = {0=>"ten", 1=>"eleven", 2=>"twelve", 3=>"thirteen", 4=>"fourteen", 5=>"fifteen", 6=>"sixteen", 7=>"seventeen", 8=>"eighteen", 9=>"nineteen"}
    tens = {0 => "",2=>"twenty", 3=>"thirty", 4=>"forty", 5=>"fifty", 6=>"sixty", 7=>"seventy", 8=>"eighty", 9=>"ninety"}
    big = ["", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion"]

    stringArray = self.to_s().split("")
    digitsArray = []
    stringArray.each() do |digit|
      digitsArray.push(digit.to_i)
    end
    reversedDigits = digitsArray.reverse()

    words = ""
    counter = 0
    while reversedDigits.length > 0
      localWords = []
      localDigits = reversedDigits.slice!(0,3)

      if localDigits.length() == 1
        localWords.push(ones.fetch(localDigits[0]))
      elsif localDigits.length() == 3 and localDigits[2] != 0
        localWords.push(ones.fetch(localDigits[2]))
        localWords.push("hundred")
        if localDigits[1] == 1
          localWords.push(teens.fetch(localDigits[0]))
        else
          localWords.push(tens.fetch(localDigits[1]))
          localWords.push(ones.fetch(localDigits[0]))
        end
      else
        if localDigits[1] == 1
          localWords.push(teens.fetch(localDigits[0]))
        else
          localWords.push(tens.fetch(localDigits[1]))
          localWords.push(ones.fetch(localDigits[0]))
        end
      end
      localJoin = localWords.join(" ")
      if localJoin.match(/\w/)
        words = localJoin + " " + big[counter] + " " + words
      end
      counter += 1
    end
    words = words.split.join(" ")
    words
  end
end

class String
  define_method(:words_to_numbers) do
    powersOfThreeArray = ["quintillion", "quadrillion", "trillion", "billion", "million", "thousand"]
    digits = {"one"=>1, "two"=>2, "three"=>3, "four"=>4, "five"=>5, "six"=>6, "seven"=>7, "eight"=>8, "nine"=>9, "ten"=>10, "eleven"=>11, "twelve"=>12, "thirteen"=>13, "fourteen"=>14, "fifteen"=>15, "sixteen"=>16, "seventeen"=>17, "eighteen"=>18, "nineteen"=>19, "twenty"=>20, "thirty"=>30, "forty"=>40, "fifty"=>50, "sixty"=>60, "seventy"=>70, "eighty"=>80, "ninety"=>90, "thousand"=>1e3, "million"=>1e6, "billion"=>1e9, "trillion"=>1e12,  "quadrillion"=>1e15, "quintillion"=>1e18}
    inputArray = self.split(" ")


    total = 0
    while inputArray.length > 0
      powersOfThreeArray.each() do |testWord|
        index = inputArray.find_Index(testWord)
        localArray = inputArray.slice!(0,index)
      end
      if /hundred/.match[localArray]
        hundredsIndex = localArray.find_Index(testWord)
        hundreds = localArray.slice!(0,index)
        localTotal = digits.fetch(hundreds[0]) * 100
        while localArray.length > 0
          localTotal += digits.fetch(localArray[0])
          localArray.shift()
        end
      end
      total += localTotal * digits.fetch(inputArray[index])
    end
    total
  end
end
