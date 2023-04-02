const nextLetter = require('./next_letter');

test('case1', () => {
    expect(nextLetter(['a', 'c', 'f', 'h'], 'f')).toBe('h');
});

test('case2', () => {
    expect(nextLetter(['a', 'c', 'f', 'h'], 'b')).toBe('c');
});

test('case3', () => {
    expect(nextLetter(['a', 'c', 'f', 'h'], 'm')).toBe('a');
});

test('case4', () => {
    expect(nextLetter(['a', 'c', 'f', 'h'], 'h')).toBe('a');
});