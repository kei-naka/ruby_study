class HelloCount
=begin
	アクセッサーはインスタンス変数に対するセッターとゲッターを定義するので、
	クラス変数に対するアクセッサーは定義できないらしい。
	  attr_accessor :count
	はエラーではないが、
	  obj = HelloCount.new
	  p obj.count
	とかやっても、「インスタンス変数のcount」に対するゲッターを呼ぶので、
	  nil
	が返却される。
	クラス変数に対しては、アクセッサーを使わずにセッターやゲッターを定義する必要があるらしい。
=end
	# attr_accessor :count

=begin
	クラス変数は、必ず定義した時に初期化する必要がある。
	初期化していないと、以下のようなエラーが出る。
	  class_variable.rb:16: uninitialized class variable @@count in HelloCount (NameError)
	
	なお、初期化は定義時にする必要があるらしい。
	つまり、
	  @@count
	  def initialize
	    @@count = 0
	  end
	というように、コンストラクタで初期化しようとしても、上記のエラーが出る。
=end
	@@count = 0
	
	def hello
		@@count += 1
	end

=begin
	クラス・メソッド。
	呼び出す時は、HelloCount.count というように、クラス名.メソッド名で呼び出す。
	別に、普通のインスタンスメソッドとして、
	  def get_count
	  end
	みたいにしてもOK。
	呼び出す時に、
	  p aa.get_count
	  p bb.get_count
	としても、同じ値が返却されるが、クラス変数だけ扱ってるメソッドなので、
	クラス・メソッドとして定義するのがいいだろう、みたいな感じらしい。
=end
	def HelloCount.count
		@@count
	end
end

aa = HelloCount.new
=begin
	クラス変数はアクセッサーでアクセスできないので、
	アクセッサー定義しといて
	  p aa.count
	としても、インスタンス変数の @count とみなされ、
	  nil
	が返却される。

=end
p HelloCount.count	# 0
aa.hello
p HelloCount.count	# 1

bb = HelloCount.new
=begin
	aa と bb は、HelloCount のインスタンス自体は異なるが、
	クラス変数はクラスに対して１つなので、1 の値が引き継がれている。
	というか、インスタンス間で共有されている。
	クラスメソッドじゃなくてインスタンスメソッドで定義しておいて、
	  bb.get_count
	みたいにしても、結果は同じ。
	後で見た時に、何でクラス変数使ってインスタンスメソッドなの？って
	混乱するんで、保守性の観点からクラスメソッドにしましょうみたいな感じ。
=end
p HelloCount.count	# 1
bb.hello
p HelloCount.count	# 2
