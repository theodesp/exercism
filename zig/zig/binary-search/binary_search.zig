// Take a look at the tests, you might have to change the function arguments

pub fn binarySearch(comptime T: type, target: usize, items: []const T) ?usize {
    var low: i32 = 0;
    var high: i32 = @intCast(i32, items.len) - 1;

    return while (low <= high) {
        var mid = @divTrunc((low + high), 2);
        var m = @intCast(usize, mid);
        var guess = items[m];
        if (guess == target) break m;
        if (guess > target) {
            high = mid - 1;
        } else low = mid + 1;
    } else null;
}
