Problem Statement: Given an input string, find all the matching words in the given dictionary where all the chars ar some chars in the input string matches the words in the dictionary.

Input: ("oogd", ["ate", "eat", "tea", "dog", "do", "god", "goo", "go", "good"])

Expected output: ["dog", "do", "god", "goo", "go", "good"]

Edge case: the input string might have single or multiple repeating characters.

Brute force approach:

  * Create an empty result array.
  * Sort the input string.
  * Loop through the dictionary and sort the words in the dictionary.
      * Check if the input string includes the newly sorted words.
      * If yes, push them in the result array.
  * Return the result array.

  Helper method to sort the string:
    Split the chars of the word, sort them, join and return the word.

This solution looks simple and elegant but not efficient. The reason is, to sort the n chars in a word, the time complexity is O(n log n).
We have m words in the dictionary with n chars, so it is going to be O(m*n log n).

We can actually do better by creating the character count hash instead of sorting all the chars, since the hash look up is O(1).

New Approach: 

  * Create an empty result array.
  * Create a character count hash for the input string.
  * Loop through the dictionary
    * Create a character count hash for each word.
    * Compares this hash with the input string character count hash.
    * If the count of the char(from the word in the dictinary) is greater than or equal to the count of the hash(from the input string), push the word to the result array.
  * Return the result array.

  * Create a helper method to create the character count hash.
  * Create a helper method to compare both the hashes ( words from the dictionary and the input string ).

The reason this is better because the look up for the char in the hash is O(1).
There are n chars in the input string. So it is O(n) for creating the character count hash.
There are m words in the dictionary with k chars. so it is O(m*k) for creating the character count hash for words in the dictionary.
So the over all complexity is O((n+m)*k) which is much better than out brute force approach which is O(m*n log n).

