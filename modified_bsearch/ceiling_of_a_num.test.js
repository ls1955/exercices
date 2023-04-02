const ceilingOfANum = require('./ceiling_of_a_num');

test('case 1', () => {
    expect(ceilingOfANum([4, 6, 10], 6)).toBe(1);
});

test('case 2', () => {
    expect(ceilingOfANum([1, 3, 8, 10, 15], 12)).toBe(4);
});

test('case 3', () => {
    expect(ceilingOfANum([4, 6, 10], 17)).toBe(-1);
});

test('case 4', () => {
    expect(ceilingOfANum([4, 6, 10], -1)).toBe(0);
});

test('case 5', () => {
    expect(ceilingOfANum([1], 1)).toBe(0);
});

test('case 6', () => {
    expect(ceilingOfANum([1], 99)).toBe(-1);
});
