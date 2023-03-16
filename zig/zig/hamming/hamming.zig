const std = @import("std");

pub const DnaError = error {
    EmptyDnaStrands,
    UnequalDnaStrands,
};

pub fn compute(first: []const u8, second: []const u8) DnaError!usize {
    if (first.len == 0 or second.len == 0) {
        return DnaError.EmptyDnaStrands;
    }
    if (std.mem.eql(u8, first, second)) {
        return 0;
    }
    if (first.len != second.len) {
        return DnaError.UnequalDnaStrands;
    }
    var count: u8 = 0;
    var i: u8 = 0;
    for (first) |ch| {
        if (second[i] != ch) {
            count += 1;
        }
        i += 1;
    }
    return count;
}
