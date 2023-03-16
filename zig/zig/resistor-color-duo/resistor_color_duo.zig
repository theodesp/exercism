pub const ColorBand = enum(u8) {
    black, 
    brown, 
    red, 
    orange, 
    yellow,
    green, 
    blue,  
    violet, 
    grey,
    white,
};

pub fn colorCode(colors: [2]ColorBand) usize {
    if (colors[0] == ColorBand.black) {
        return @enumToInt(colors[1]);
    }
    return @enumToInt(colors[0]) * 10 + @enumToInt(colors[1]);
}
