=begin
	インスタンス変数の練習。
	インスタンス変数は、初めて使われた時に、宣言（＝メモリ上に領域確保）から値の代入まで自動的に実行される。
	すなわち、グローバル領域や、classの内部で最初に宣言しておく必要はない。
	宣言なしで使えるので便利だが、コンストラクタやセッターなどで、ルール付けしておく必要がある。

	今回の例では、setNameが呼ばれた時点で、nameが宣言、値が代入される。
	setNameを呼ぶ前にshowNameを呼ぶと、nilが返る。
=end
class Car
	def setName(str)
		@name = str
	end

	def showName
		# 同じ結果
		# printf("%s\n", @name)
		print(@name, "\n")
	end
end

car1 = Car.new()
car1.setName("gomi")
car1.showName
