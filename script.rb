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

    string.split("").each do |letter| 
        if upper_case_hash.key?(letter)
            current_pos = upper_case_hash["#{letter}"]
            new_pos = current_pos + digit
            if new_pos > 25
                wrap_pos = (new_pos - 25) - 1
                encrypted_string += upper_case_hash.key(wrap_pos)
            else
                encrypted_string += upper_case_hash.key(new_pos)
            end
        elsif lower_case_hash.key?(letter)
            current_pos = lower_case_hash["#{letter}"]
            new_pos = current_pos + digit
            if new_pos > 25
                wrap_pos = (new_pos - 25) - 1
                encrypted_string += lower_case_hash.key(wrap_pos)
            else
                encrypted_string += lower_case_hash.key(new_pos) 
            end
        else
            encrypted_string += letter
        end
    end

    return encrypted_string

end