Point = Struct.new(:y, :x)

def solution
    (y,x) = gets.chomp.split(" ").map(&:to_i)
    two_d_array = Array.new(y) { Array.new(x) { 500 } }
    pivot_array = []
    temp_array = []
    val = 1
    flag = true
    for i in (0...y)
        values = gets.chomp.chars
        for j in (0...x)
            if values[j].to_i == 0
                two_d_array[i][j] = 500
            else
                two_d_array[i][j] = 0
                pivot_array.push Point.new(i, j)
            end
        end
    end
    while pivot_array.length>0
        for i in (0...pivot_array.length)
            if pivot_array[i].y>0 && two_d_array[pivot_array[i].y-1][pivot_array[i].x] == 500
                two_d_array[pivot_array[i].y-1][pivot_array[i].x] = val
                temp_array.push Point.new(pivot_array[i].y-1, pivot_array[i].x)
            end 
            if pivot_array[i].x>0 && two_d_array[pivot_array[i].y][pivot_array[i].x-1] == 500
                two_d_array[pivot_array[i].y][pivot_array[i].x-1] = val
                temp_array.push Point.new(pivot_array[i].y, pivot_array[i].x-1)
            end 
            if pivot_array[i].y<y-1 && two_d_array[pivot_array[i].y+1][pivot_array[i].x] == 500
                two_d_array[pivot_array[i].y+1][pivot_array[i].x] = val
                temp_array.push Point.new(pivot_array[i].y+1, pivot_array[i].x)
            end 
            if pivot_array[i].x<x-1 && two_d_array[pivot_array[i].y][pivot_array[i].x+1] == 500
                two_d_array[pivot_array[i].y][pivot_array[i].x+1] = val
                temp_array.push Point.new(pivot_array[i].y, pivot_array[i].x+1)
            end
        end
        pivot_array = temp_array
        temp_array = []
        val += 1
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
