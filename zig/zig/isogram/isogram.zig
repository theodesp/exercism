const std = @import("std");
pub fn isIsogram(str: []const u8) bool {
    var seen = std.AutoHashMap(u8, bool).init(std.testing.allocator);
    defer seen.deinit();
    for (str) |c| {
        if (std.ascii.isAlphabetic(c)) {
            if (seen.get(std.ascii.toLower(c)) != null) {
                return false;   
            }
            seen.put(std.ascii.toLower(c), true) catch {
                return false;
            };
        }
    }
    return true;
}


