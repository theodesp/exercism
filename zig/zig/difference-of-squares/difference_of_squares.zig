pub fn squareOfSum(number: usize) usize {
    const nominator = number * (number + 1); 
    const denominator = 2;
    return @divTrunc(nominator, denominator) * @divTrunc(nominator, denominator);
}

pub fn sumOfSquares(number: usize) usize {
    const nominator = number * (number + 1) * (2 * number + 1); 
    const denominator = 6;
    return @divTrunc(nominator, denominator);
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
