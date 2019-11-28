# luigi

サンプル×遺伝子の発現データを入力としてサンプル間、
あるいは遺伝子間の類似度および類似度ランキングを出力するライブラリです。


## luigi.pyについて

二次元のヘッダ行付きtsvファイル（先頭列はサンプルIDなど）を読み込み
cos類似度ランキングをJSON形式で出力します。

### オプション

- 必須: 入力ファイル。tsv形式のマトリクスを指定します。
- -o: 出力ファイル名。省略した場合は"ranking.json"で出力される。
- -r: 出力するランキング数。省略した場合100まで出力。

```
# python luigi.py <入力ファイル> -o <オプション：出力ファイル> -r <オプション：ランキング数>
```

### 実行例

```
# python luigi.py data/T-TPM-100.txt -o data/ranking100.json -r 10
```


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


