const std = @import("std");
pub fn isArmstrongNumber(num: u128) bool {
    if (num == 0) return true;
    var digits = digitCount(num);
    var n = num;
    var sum: u128 = 0;
    while(n != 0) {
        var digit = n % 10;
        n /= 10;
        sum += std.math.pow(u128, digit, digits);
    }
    return sum == num;
}

pub fn digitCount(num: u128) u8 {
    if (num == 0) return 1;
    var count: u8 = 0;
    var n = num;
    while(n != 0) {
        n /= 10;
        count += 1;
    }
    return count;
}