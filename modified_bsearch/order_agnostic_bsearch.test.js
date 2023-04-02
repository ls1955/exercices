const bsearch = require('./order_agnostic_bsearch');

test('case1', () => {
    expect(bsearch([4, 6, 10], 10)).toBe(2);
});

test('case2', () => {
    expect(bsearch([1, 2, 3, 4, 5, 6, 7], 5)).toBe(4);
});

test('case3', () => {
    expect(bsearch([10, 6, 4], 10)).toBe(0);
});

test('case4', () => {
    expect(bsearch([10, 6, 4], 4)).toBe(2);
});

test('case5', () => {
    expect(bsearch([1], 1)).toBe(0);
});

test('case6', () => {
    expect(bsearch([1], 99)).toBe(-1);
});