require 'open-uri'
require 'rubygems'
require 'nokogiri'
#require 'mechanize'
require 'image_downloader'

uri = 'https://ru.aliexpress.com/item/2016-Men-Suit-Jackets-Blazers-Coats-Dress-Suits-Men-s-Casual-Fashion-Slim-Fit-Long-Sleeved/32610743394.html?spm=2114.03010108.3.3.MLjlI3&ws_ab_test=searchweb0_0,searchweb201602_4_10065_10068_10000009_118_10084_10000025_10083_10080_10000029_10082_10081_10000028_10110_10111_10060_10112_10113_10062_10114_10056_10055_10037_10054_10059_10032_10099_10078_10079_10000022_10077_10000012_10103_10073_10102_10000015_10096_10000018_10000019_10052_10108_10053_10107_10050_10106_10051,searchweb201603_3,afswitch_5,single_sort_1_default&btsid=457ee6b7-5480-45cd-8b8b-2d3edc81c224'
doc = Nokogiri::HTML(open(uri))

strings = doc.text.strip!.split('"') # split html text to strings in array between "" quotes


strings.delete_if { |bite| (bite.include? "alicdn.com/kf/") == false } # delete strings


strings.map! {|link| URI.extract(URI.encode("#{link}"))}
strings.each_with_index {|f, i| strings[i] = f[0]}

strings.each_with_index do |file, i|
open(file) {|f|
 File.open("blazer" + "#{i.to_s}" + ".jpg","wb") do |file|
   file.puts f.read
 end
}
end

#open("https://ae01.alicdn.com/kf/HTB12tizOXXXXXchXXXXq6xXFXXXd/%D0%9C%D1%83%D0%B6%D1%87%D0%B8%D0%BD%D1%8B-Blazer-2016-%D0%9D%D0%BE%D0%B2%D1%8B%D0%B9-%D0%9A%D0%BE%D1%81%D1%82%D1%8E%D0%BC-%D0%9C%D1%83%D0%B6%D1%87%D0%B8%D0%BD%D1%8B-5-%D0%A6%D0%B2%D0%B5%D1%82%D0%B0-%D0%9F%D0%BE%D0%B2%D1%81%D0%B5%D0%B4%D0%BD%D0%B5%D0%B2%D0%BD%D1%8B%D0%B5-%D0%9A%D1%83%D1%80%D1%82%D0%BA%D0%B8-%D1%82%D0%B5%D1%80%D0%BD%D0%BE-Masculino-%D0%9F%D0%BE%D1%81%D0%BB%D0%B5%D0%B4%D0%BD%D0%B8%D0%B5-%D0%9A%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8-%D0%9F%D0%B0%D0%BB%D1%8C%D1%82%D0%BE-%D0%9F%D0%B8%D0%B4%D0%B6%D0%B0%D0%BA%D0%B8.jpg") {|f|
   #File.open("blazer.jpg","wb") do |file|
   #file.puts f.read
  #end
#}

