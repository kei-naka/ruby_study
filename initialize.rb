=begin
	コンストラクタの練習。
	javaのコンストラクタはクラス名と同じ名前だが、rubyでは、initializeで固定。
	コンストラクタの引数のところで初期化することができる。

	今回の例だと、CarKnownで、インスタンス変数 @name の初期値を xxx にしている。
	これによって、コンストラクタ内で、渡された変数 name のnil チェックをする必要がない。
=end
class CarUnknown
	def initialize
		@name = "Unknown"
	end

	def showName
		puts @name
	end
end

class CarKnown
	def initialize(name="xxx")
		@name = name
	end

	def showName
		puts @name
	end
end

car1 = CarUnknown.new
car1.showName
# puts car1.name	インスタンス変数はprivate扱いなので、クラスの外から直接アクセスすることはできない

# new の引数指定しないと初期値 xxx が入る
car2 = CarKnown.new()
car2.showName

# new の引数指定すると、指定した値で初期化される
car3 = CarKnown.new("teda")
car3.showName
