pub const Coordinate = struct {
    x: f32, y: f32,

    pub fn init(x_coord: f32, y_coord: f32) Coordinate {
        return Coordinate{.x = x_coord, .y = y_coord};
    }
    pub fn score(self: Coordinate) usize {
        if (isInsideCircle(self.x, self.y, 0, 0, 1)) {
            return 10;
        }
        if (isInsideCircle(self.x, self.y, 0, 0, 5)) {
            return 5;
        }
        if (isInsideCircle(self.x, self.y, 0, 0, 10)) {
            return 1;
        }
        return 0;
    }
};

fn isInsideCircle(x: f32, y: f32, c_x: f32, c_y: f32, r: f32) bool {
    return r * r >= (x-c_x) * (x-c_x) + (y-c_y) * (y-c_y);
}