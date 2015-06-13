# Method 1: test is array contains any words that do not start with r, all lowercase; return true or false

=begin
passes:
def begins_with_r(array)
  new_array = true
  array.each do |word|
    if word.split("").first != "r"
      new_array = false
    end
  end
  new_array
end

passes:
def begins_with_r(array)
  new_array = true
  array.each do |word|
    if word.start_with?("r") == false
      new_array = false
    end
  end
  new_array
end
=end

def begins_with_r(array)
  new_array = []
  array.map do |word| 
    new_array << word.start_with?("r") == false 
  end
  new_array.include?(false) ? false : true
end

# Method 2: return all elements of array that contain the letter 'a'
# OR use delete_if for elements that don't contain the letter a

def contain_a(array)
  new_array = []
  array.each do |word|
    unless word.scan(/a/).empty? # word scan will return an array, so we can check it for emptiness
      new_array << word
    end
  end
  new_array
end

# Return the first element that begins with the letters 'wa' (in an array of strings)
# => look at final array and return final_array.first
def first_wa(array)
  new_array = []
  array.each do |word|
    if word.to_s.start_with?("wa") # or use Regex OR Slice
      new_array << word
    end
  end
  new_array.first
end

# remove_non_strings remove anything that's not a string from an array
# delete_if removes things items from the array instantly every time the block is passed, not after the iteration is over
# word.is_a? String         # true
# word.kind_of? String      # true

def remove_non_strings(array)
  array.delete_if do |word|
    word.class != String
  end
end

# count_elements count how many times something appears in an array; turn into a hash {:name => number of occurences }
def count_elements(array)
  new_array = Array.new
  array.uniq.select do |hash|
    hash[:count] = array.count(hash)
    new_array << hash
  end
  new_array
end

=begin
  let(:data) { data is an array of hashes
    [
           {
             "blake" => {
                :awesomeness => 10,
                     :height => "74",
                  :last_name => "johnson"
            },
            "ashley" => {
                :awesomeness => 9,
                     :height => 60,
                  :last_name => "dubs"
            }
        }
    ]
  }

    let(:keys) { also an array of hashes
    [
           {
            :first_name => "blake"
        },
           {
            :first_name => "ashley"
        }
    ]
  }

  let(:merged_data) {
    [
           {
             :first_name => "blake",
            :awesomeness => 10,
                 :height => "74",
              :last_name => "johnson"
        },
           {
             :first_name => "ashley",
            :awesomeness => 9,
                 :height => 60,
              :last_name => "dubs"
        }
    ]
  }
=end

def merge_data(keys, data)
  keys.collect do |hash|
      hash.merge(data[0][hash[:first_name]])
  end
end

# returns array of hashes where one of the values is 'key' exactly
=begin
  let(:cool) {
    [
            {
                   :name => "ashley",
            :temperature => "sort of cool"
        },
            {
                   :name => "blake",
            :temperature => "cool"
        }
    ]
  }
=end

# expected: [{:name=>"blake", :temperature=>"cool"}]
#            got: {:temperature=>"cool"}

def find_cool(array) # given an array of hashes
  # new_hash = Hash.new -- actually there is no need for a hash intermediary
  new_array = Array.new
  array.each do |hash|
    hash.each do |key, value|
      if value == "cool"
        # new_hash = hash
        new_array << hash
      end
    end
  end
  new_array
end

#organize_schools organizes the schools by location
=begin
{
      "flatiron school bk" => {
        :location => "NYC"
      },
      "flatiron school" => {
        :location => "NYC"
      },
      "dev boot camp" => {
        :location => "SF"
      },
      "dev boot camp chicago" => {
        :location => "Chicago"
      },
      "general assembly" => {
        :location => "NYC"
      },
      "Hack Reactor" => {
        :location => "SF"
      }
    }
  let(:organized_schools) {
    {"NYC"=>["flatiron school bk", "flatiron school", "general assembly"],
     "SF"=>["dev boot camp", "Hack Reactor"],
     "Chicago"=>["dev boot camp chicago"]}
=end
# {"flatiron school bk"=>{:location=>"NYC"}, "flatiron school"=>{:location=>"NYC"}, "dev boot camp"=>{:location=>"SF"}, "dev boot camp chicago"=>{:location=>"Chicago"}, "general assembly"=>{:location=>"NYC"}, "Hack Reactor"=>{:location=>"SF"}}

def organize_schools(hash) # it is a hash of hashes...
  new_hash = Hash.new

  hash.each do |school_name, school_details| # school_name = flatiron; school_details is a hash {:location => "NYC"}
    if new_hash[school_details[:location]] 
      new_hash[school_details[:location]] << school_name
    else
      new_hash[school_details[:location]] = [school_name]
    end
  end
  new_hash
end


