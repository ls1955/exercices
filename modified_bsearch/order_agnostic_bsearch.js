/*
    Statement:
    Given a sorted array of numbers, find if a
    given number ‘key’ is present in the array.
    Though we know that the array is sorted,
    we don’t know if it’s sorted in ascending
    or descending order. You should assume
    that the array can have duplicates.

    Write a function to return the index of the
    ‘key’ if it is present in the array,
    otherwise return -1.
*/

const bsearch = (nums, key) => {
    let left = 0;
    let right = nums.length - 1;
    let isAsc = nums[left] <= nums[right];

    while (left <= right) {
        let mid = Math.floor((left + right) / 2);

        if (nums[mid] === key) return mid;
        else if (nums[mid] < key) {
            isAsc ? left = mid + 1 : right = mid - 1;
        } else {
            isAsc ? right = mid - 1 : left = mid + 1;
        }
    }
    return -1;
};

module.exports = bsearch;
