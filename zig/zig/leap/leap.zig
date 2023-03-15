const std = @import("std");

pub fn isLeapYear(year: u32) bool {
    const isDivBy100 = @mod(year, 100) == 0;
    const isDivBy400 = @mod(year, 400) == 0;
    const isDivBy4 = @mod(year, 4) == 0;

    if (isDivBy4) {
        return if (isDivBy100) return isDivBy400 else true;
    }
    return false;
}
