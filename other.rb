Point = Struct.new(:y, :x, :val)
def solution
    (y,x) = gets.chomp.split(" ").map(&:to_i)
    two_d_array = Array.new(y) { Array.new(x) { 500 } }
    array_black = []
    array_white = []
    for i in (0...y)
        values = gets.chomp.chars
        for j in (0...x)
            if values[j].to_i == 0
                array_black.push Point.new(i, j, 500)
            else
                two_d_array[i][j] = 0
            end
        end
    end
    length = array_black.length
    i = 0
    while length > 0 
            array_black[i].x>0 && two_d_array[array_black[i].y][array_black[i].x-1]<array_black[i].val ? array_black[i].val = two_d_array[array_black[i].y][array_black[i].x-1]+1 : array_black[i].val = array_black[i].val
            array_black[i].y>0 && two_d_array[array_black[i].y-1][array_black[i].x]<array_black[i].val ? array_black[i].val = two_d_array[array_black[i].y-1][array_black[i].x]+1 : array_black[i].val = array_black[i].val
            array_black[i].x<x-1 && two_d_array[array_black[i].y][array_black[i].x+1]<array_black[i].val ? array_black[i].val = two_d_array[array_black[i].y][array_black[i].x+1]+1 : array_black[i].val = array_black[i].val
            array_black[i].y<y-1 && two_d_array[array_black[i].y+1][array_black[i].x]<array_black[i].val ? array_black[i].val = two_d_array[array_black[i].y+1][array_black[i].x]+1 : array_black[i].val = array_black[i].val
            
            two_d_array[array_black[i].y][array_black[i].x] = array_black[i].val
            if array_black[i].val<500 && (array_black[i].y>=y-1 || two_d_array[array_black[i].y+1][array_black[i].x] != 500) && (array_black[i].x>=x-1 || two_d_array[array_black[i].y][array_black[i].x+1] != 500)
                array_black.delete_at(i)
                length-=1
                i=0
            else
                i+=1
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

