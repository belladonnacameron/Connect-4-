class Board
require 'matrix'

    def self.build_stacks(stacks)
        narr = Array.new(stacks) {Array.new(0)}
        return narr
    end 

    def initialize (stacks, max_height)
        
        @max_height = max_height
        @stacks = stacks
        if @stacks < 4 or @max_height < 4
            raise "rows and cols must be >= 4"
        end
        @stacks = self.class.build_stacks(@stacks)#Array.new(@stacks) {Array.new(0)}
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end

    def max_height 
        return @max_height
    end

    def add (token, idx)
        if idx < @max_height && @stacks[idx].length != @max_height
            @stacks[idx].push(token)
            return true 
        else #@stacks[idx].length == @max_height
            return false 
        end 
    end

    def vertical_winner?(token)

        @stacks.each_with_index do |stack, i|
            win_h = 0
            stack.each_with_index do |ele, ii|
                if ele == token 
                    win_h += 1
                end
            end
            if win_h == @max_height 
                return true 
            end
        end
        return false 
        # if @stacks[0][0] == token && @stacks[1][0] == token && @stacks[2][0] == token 
        #     return true 
        # elsif @stacks[0][1] == token && @stacks[1][1] == token && @stacks[2][1] == token 
        #     return true 
        # elsif @stacks[0][2] == token && @stacks[1][2] == token && @stacks[2][2] == token 
        #     return true 
        # else 
        #     return false
        # end

    end

    def horizontal_winner?(token)
       p = @stacks.reduce(&:zip).map(&:flatten)
       p.each_with_index do |stack, i|
        win_h = 0
        stack.each_with_index do |ele, ii|
            if ele == token 
                win_h += 1
            end
        end
        if win_h == @stacks.length
            return true 
        end
        end
    return false 
        # (0...@max_height).each do |j|
        #     win_v = 0
        #     ii = 0 
        #     len = @stack[j].length 
        #     (0...len).each do |i|
        #         if @stacks[i][j] == nil || @stacks[i+1][j] == nil 
        #             break
        #         end 
        #         if @stacks[i][j] == token 
        #             win_v += 1
        #         end
        #     end

        #      if win_v == @max_height
        #          return true 
        #      end
        #      ii += 1
        # end
        return false 
    end

    def winner?(token)
        if self.horizontal_winner?(token) || self.vertical_winner?(token)
            return true 
        else
            return false 
        end 
    end

    
end