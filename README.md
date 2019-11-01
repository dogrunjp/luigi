# luigi

サンプル×遺伝子の発現データを入力としてサンプル間、
あるいは遺伝子間の類似度および類似度ランキングを出力するライブラリです。


## package managerを利用したnimのインストール（macOSの場合）


```bash
$ brew install nim
```

## nimの簡単なサンプルスクリプトのコンパイルと実行

hello.nim
```nim
echo "So What?"
var name: string = readLine(stdin)
echo "Hi, ", name, "!"
```

コンパイルと実行
```
nim c -r hello.nim
```

