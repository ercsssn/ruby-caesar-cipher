def caesar_cipher(string, digit)
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

    # upper_case_hash.each do |letter,position|
    #     puts "#{letter} = #{position}"
    # end

    string.split("").each do |letter| 
        if upper_case_hash.key?(letter)
            current_pos = upper_case_hash["#{letter}"]
            new_pos = current_pos + digit
            if new_pos > 25
                wrap_pos = new_pos - 25
            else
                new_pos
            end
            # puts "#{letter} = #{upper_case_hash["#{letter}"]}" 
        elsif lower_case_hash.key?(letter)
            current_pos = lower_case_hash["#{letter}"]
            new_pos = current_pos + digit
            if new_pos > 25
                wrap_pos = new_pos - 25
            else
                new_pos
            end
            # puts "#{letter} = #{lower_case_hash["#{letter}"]}"
        else
            puts "I'm a special character or a number"
        end
    end

end