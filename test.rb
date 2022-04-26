
def solution
    (y,x) = gets.chomp.split(" ").map(&:to_i)
    two_d_array = Array.new(y) { Array.new(x) { 500 } }
    flag = true
    for i in (0...y)
        values = gets.chomp.chars
        for j in (0...x)
            if values[j].to_i == 0
                two_d_array[i][j] = 500
            else
                two_d_array[i][j] = 0
            end
        end
    end
    while flag
        flag = false
        for i in (0...y)
            for j in (0...x)
                if i<y-1 && two_d_array[i][j]>two_d_array[i+1][j]+1
                    two_d_array[i][j] = two_d_array[i+1][j]+1
                    flag = true
                end
                if j<x-1 && two_d_array[i][j]>two_d_array[i][j+1]+1
                    two_d_array[i][j] = two_d_array[i][j+1]+1
                    flag = true
                end
                if i>0 && two_d_array[i][j]>two_d_array[i-1][j]+1
                    two_d_array[i][j] = two_d_array[i-1][j]+1
                    flag = true
                end
                if j>0 && two_d_array[i][j]>two_d_array[i][j-1]+1
                    two_d_array[i][j] = two_d_array[i][j-1]+1
                    flag = true
                end
            end
        end
    end
    for i in (0...y)
        puts two_d_array[i].join(" ")
    end
end    
num_case = gets
while num_case.to_i != 0
 
    solution
    num_case= num_case.kind_of?(String) ? num_case.to_i-1 : num_case-1
    if(num_case>0)
    	    gets
    end            
end
