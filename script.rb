def caesar_cipher(string)
    upper_case = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
    lower_case = "abcdefghijklmnopqrstuvwxyz".split("")
    upper_case_hash = Hash.new
    lower_case_hash = Hash.new
    encrypted_string = ""

    lower_case.each_with_index do |letter,index|
        lower_case_hash[letter] = index
    end

    upper_case.each_with_index do |letter,index|
        upper_case_hash[letter] = index
    end

    upper_case_hash.each do |letter,position|
        puts "#{letter} = #{position}"
    end

    string.split("").each do |letter| 
        if upper_case_hash.key?(letter)
            puts "#{letter} = #{upper_case_hash["#{letter}"]}" #TODO: Add a number to the hash key value
        elsif lower_case_hash.key?(letter)
            puts "#{letter} = #{lower_case_hash["#{letter}"]}"
        else
            puts "I'm a special character or a number"
        end
    end

end