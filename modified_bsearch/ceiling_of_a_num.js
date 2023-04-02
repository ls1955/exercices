/*
    Statement:
    Given an array of numbers sorted in an ascending
    order, find the ceiling of a given number ‘key’.
    The ceiling of the ‘key’ will be the smallest
    element in the given array greater than or equal
    to the ‘key’.

    Write a function to return the index of the ceiling
    of the ‘key’. If there isn’t any ceiling return -1.
*/

const ceilingOfANum = (nums, key) => {
    let left = 0;
    let right = nums.length - 1;

    while (left < right) {
        let mid = Math.floor((left + right) / 2);

        if (nums[mid] >= key) right = mid;
        else left = mid + 1;
    }
    return nums[left] >= key ? left : -1;
}

module.exports = ceilingOfANum;
