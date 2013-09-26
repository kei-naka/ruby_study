=begin
	定数の練習。
	定数は大文字から始まるというネーミングルールがある。
	定数だけ、外部から :: でアクセスすることができる。
	. ではアクセスできない。

	今回の例では、 apple.Tax というアクセスの仕方はできない。

	attr_accessor はアクセッサー。(accessor.rb 参照)
=end
class Stuff
	attr_accessor :price

	Tax = 0.05

	def initialize(price)
		@price = price + price * Tax
		# Tax = 0.08	エラー。動的（＝静的じゃない）って怒られる
	end
end

apple = Stuff.new(100)
printf("%d\n", apple.price)
print "tax: ", Stuff::Tax
# print "tax: ", Stuff.Tax	エラー。Taxっていうメソッドなんてないって怒られる
# Stuff::Tax = 0.08	既に初期化されてるよってワーニング出る
