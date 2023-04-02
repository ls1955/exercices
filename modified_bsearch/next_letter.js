/*
    Given an array of lowercase letters sorted
    in ascending order, find the smallest letter
    in the given array greater than a given ‘key’.

    Assume the given array is a circular list,
    which means that the last letter is assumed
    to be connected with the first letter. This
    also means that the smallest letter in the
    given array is greater than the last letter
    of the array and is also the first letter of
    the array.

    Write a function to return the next letter of
    the given ‘key’.
*/

const nextLetter = (chars, key) => {
    let left = 0;
    let right = chars.length - 1;

    if (chars[right] <= key) return chars[0];

    while (left < right) {
        let mid = Math.floor((left + right) / 2);

        if (chars[mid] > key) right = mid;
        else left = mid + 1;
    }
    return chars[left];
};

module.exports = nextLetter;
