require 'sinatra'
require 'sinatra/reloader'

get '/' do
	words = params[:words].to_s
	puts "D:Words  = #{words}"
	offset = params[:offset].to_i
	puts "D:Offset = #{offset}"
	result_text = cipher(words, offset)
	puts "D:Ciphered word = #{result_text}" 
	erb :index, :locals => {:result_text => result_text}	
end

def shift_char(c, base, offset)
  (((c.ord - base) + offset) % 26 + base).chr
end

def cipher(s, offset)
  s.chars.map do |c|
    case c
    when 'a'..'z'
      shift_char(c, 'a'.ord, offset)
    when 'A'..'Z'
      shift_char(c, 'A'.ord, offset)
    else
      c
    end
  end.join
end