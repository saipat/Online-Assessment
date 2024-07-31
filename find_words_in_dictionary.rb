# Given an input string, find all the matching words in the given dictionary where all the chars ar some chars in the input string matches the words in the dictionary.

# Time Complexity => O((n+m) * k) explanation in read me.
def find_words_in_dictionary(input_string, dict)
  # Base check
  return [] if input_string.length == 0 || dict.length == 0

  # Create the character count hash for the input_string using the helper function.
  input_string_count = get_word_count(input_string)

  result = []

  # Loop through the words in the dictionary.
  dict.each do |word|
    # Create the character count hash for the word using the helper function.
    word_count = get_word_count(word)
    # Compare both the hashes and filter the word. 
    # Add the filtered words into the array.
    result.push(word) if contains_input_word_chars?(input_string_count, word_count)
  end

  # .inspect convers the array to an esy readable string in one line like ["ate", "eat", "tea"]
  result.inspect
end

# Helper method to create character count hash
def get_word_count(word)
  # Use with_object method to create the character count hash. You can also create using normal loop structure. I like one liners, so created this way.
  word.each_char.with_object(Hash.new(0)) { |char, count| count[char] += 1 }
end

# Helper method to compare the hashes. 
# .all? will filter the [k,v] pair in the word_count based on the char in the input_string_count >= 1
def contains_input_word_chars?(input_string_count, word_count)
  word_count.all? { |char, count| input_string_count[char] >= 1 }
end

# Tests
puts find_words_in_dictionary('good', []);
puts find_words_in_dictionary('', []);
puts find_words_in_dictionary('ate', ["ate", "eat", "tea", "dog", "do", "god", "goo", "go", "good"]);
puts find_words_in_dictionary('good', ['dog', 'good', 'cat', 'go', 'goo', 'gone', 'god', 'g']);