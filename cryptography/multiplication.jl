module multiplication
    # key has to be 3 x 3 and invertible
    key = [1 5 9; 3 77 8; 99 88 4]

    function setKey(x::Matrix)
        global key
        key = x
    end

    function multiply(x::String)
        matrix = reshape(vcat([Int(c) for c in x], zeros(Int, 3 - length(x) % 3 == 3 ? 0 : 3 - length(x) % 3)), 3, Int(round(length(x) / 3, RoundUp)))
        enc = *(key, matrix)
        return String([Char(c) for c in enc if c != 0])
    end

    function decrypt(x::String)
        matrix = reshape(vcat([Int(c) for c in x], zeros(Int, 3 - length(x) % 3 == 3 ? 0 : 3 - length(x) % 3)), 3, Int(round(length(x) / 3, RoundUp)))
        display(key)
        display(inv(key))
        dec = *(inv(key), matrix)
        return String([Char(round(c)) for c in dec if c != 0])
    end

    export multiply, setKey, decrypt
end
