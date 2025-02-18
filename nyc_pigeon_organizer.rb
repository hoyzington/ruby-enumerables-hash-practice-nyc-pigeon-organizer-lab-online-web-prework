
def remove_key_hash_of_hoa(hash)
  new = []
  hash.each {|key, value|                                #  <--  pigeon_data
    new << value
  }                                                      #  -->  remove_first_key
  new
end

def remove_key_array_of_hoa(array)
  new = []
  i = 0
  while i < array.size
    new[i] = []
    array[i].each {|key, value|                          #  <--  remove_first_key
      new[i] << value
    }                                                    #  -->  names_aoa
    i += 1
  end
  new
end

def simplify_aoa(array)
  new1 = array.flatten                                   #  <--  names_aoa
  new2 = new1.uniq
  new2                                                   #  -->  names_final_array
end

def stringify(array)
  new = []
  i = 0
  while i < array.size
    new[i] = array[i].map{|key, value|                   #  <--  remove_first_key
      key.to_s
    }                                                    #  -->  string_keys
    i += 1
  end
  new
end

def isolate_key_hash_of_hoa(hash)
  new = []
  hash.each {|key, value|                                #  <--  pigeon_data
    new << key
  }                                                      #  -->  remove_first_key
  new
end

def new_hash(data, pigeons, attributes, traits)
  hash = {}
  pigeons.size.times do |name|
    hash[pigeons[name]] = {}                             #  <--  (multiple!)
    data.size.times do |attribute|
      hash[pigeons[name]][attributes[attribute]] = []
      data[attribute].size.times do |trait|
        if data[attribute][trait].include?(pigeons[name]) == true
          hash[pigeons[name]][attributes[attribute]] << traits[attribute][trait]
        end
      end                                                #  -->  pigeon_list
    end
  end
  hash
end

def nyc_pigeon_organizer(data)
  remove_first_key = remove_key_hash_of_hoa(data)
  names_aoa = remove_key_array_of_hoa(remove_first_key)
  names_final_array = simplify_aoa(names_aoa)
  string_keys = stringify(remove_first_key)
  array_of_keys = isolate_key_hash_of_hoa(data)
  pigeon_list = new_hash(names_aoa, names_final_array, array_of_keys, string_keys)
  pigeon_list
end
