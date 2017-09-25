require 'byebug'

def merge(intervals)
    return [] if intervals.empty?

    merged = []

    intervals.sort! {|interval| interval.start}

    left = intervals[0].start
    right = intervals[0].end

    intervals.each do |interval|
        if interval.start.between?(left, right)
            right = [right, interval.end].max
        else
            merged << [left, right]
            left = interval.start
            right = interval.end
        end
    end

    merged << [left, right]
end

print can_jump([2,3,1,1,4])
