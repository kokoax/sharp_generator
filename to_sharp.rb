def set_sharp_char(f, char, start_cn)
  last_cn = 0
  7.times { |i|
    cn = start_cn
    for c in f.readline.scan(/.{1,#{10}}/)
      char[cn][i] = c
      cn += 1
    end
    last_cn = cn
  }
  last_cn
end

def load_sharp_char()
  File.open("sharp_char", "r") do |f|
    char = [[]]
    26.times { |i|
      char[i] = []
    }

    last_cn = set_sharp_char(f, char, 0)
    f.readline
    set_sharp_char(f, char, last_cn)

    char
  end
end

def asd(char, data, sharp)
  7.times { |i|
    data[i] = [data[i], sharp[char.ord-65][i]].join
  }
end

def to_sharp_char(str, sep, sharp)
  data = []
  7.times {|i|
    data[i] = ""
  }
  for c in str.split(/\s*/)
    asd(c, data, sharp)
  end
  data
end

def main(text)
  puts to_sharp_char(text.upcase, "  ", load_sharp_char)
end

main(ARGV[0])

