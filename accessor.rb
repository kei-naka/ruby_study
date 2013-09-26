=begin
	アクセッサー（ゲッター＋セッター）の練習。
	attr_readerで宣言したらどっかでセッター作らなきゃダメ
	attr_writerで宣言したらどっかでゲッター作らなきゃダメ
	attr_accessorで宣言使える外部からアクセスできる変数のように使える
	けど内部のゲッター＋セッターを呼び出してるだけで、スコープがprivateに変わりはないので注意。

	今回の例では、25行目で
		car1.price=500
	でpriceをセットする（＝ここで初めて使われるので、@priceを宣言する）前にshowPriceで呼び出すと、nilが返る。
	commentも同様に、
		car1.comment="new car"
	でセットする前に呼び出すと nil が返る。
=end
class Car
	attr_reader :name
	attr_writer :price
	attr_accessor :comment

	def initialize(name = "unknown")
		@name = name
	end

	def showPrice
		puts @price
	end
end

car1 = Car.new()
car1.price=500
car1.comment="new car"
puts car1.name
car1.showPrice
puts car1.comment
