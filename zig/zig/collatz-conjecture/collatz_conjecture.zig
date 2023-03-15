pub const ComputationError = error {
    IllegalArgument
};


pub fn steps(number: usize) anyerror!usize {
    if (number == 0) {
        return error.IllegalArgument;
    }
    var count: usize = 0;
    var curr: usize = number;
    while (curr != 1) : (count += 1) {
        curr = if (curr % 2 == 0) curr / 2 else (curr * 3) + 1;
    }
    return count;
}
