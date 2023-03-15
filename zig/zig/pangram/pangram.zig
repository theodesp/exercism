const std = @import("std");
pub fn isPangram(str: []const u8) bool {
    const alphabet = "abcdefghijklmnopqrstuvwxyz";
    for (alphabet) |ch| {
        if (!chrInStr(str, ch)) {
            return false;
        }
    }
    return true;
}

pub fn chrInStr(str: []const u8, chr: u8) bool {
    for (str) |c| {
        var toLower = if (std.ascii.isUpper(c)) c + 32 else c;
        if (toLower == chr) {
            return true;
        }
    }
    return false;
}
