module multiplication
key = [5 5 5; 6 6 6; 3 3 3]

function setKey(x::Matrix)
    this.key = x
end

function multiply(x::String)
        matrix = reshape(vcat([Int(c) for c in x], zeros(Int, 3 - length(x) % 3 == 3 ? 0 : 3 - length(x) % 3)), 3, Int(round(length(x) / 3, RoundUp)))
        enc = *(key, matrix)
        return String([Char(c) for c in enc if c != 0])
    end

    export multiply, setKey
end
