def caesar_cipher(string)
    upper_case = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("") #TODO: Make this a hash
    lower_case = "abcdefghijklmnopqrstuvwxyz".split("")
    lowercase_hash = Hash.new
    encrypted_string = ""

    lower_case.each_with_index do |letter,index|
        lowercase_hash[letter] = index
    end

    string.split("").each do |letter| 
        if upper_case.include?(letter)
            puts "I'm uppercase"
        elsif lower_case.include?(letter)
            puts "I'm lowercase"
        else
            puts "I'm a special character or a number"
        end
    end

end