import nimdata
import neo
import sequtils
import strutils
import nre

##　内積計算関数
proc `*` *(a, b: seq[float]): seq[float] =
    newSeq(result, len(a))
    for i in countup(0,len(a)-1): 
        result[i] = a[i] * b[i]
        
## 内積計算した後がseqになってしまっているので、それを足し合わせて真の内積に。
proc inner_vec(inner:seq[float]):float=
    var invec: float = 0
    for i in countup(int64(0),len(inner)-1):
        invec = invec + inner[i]
    return  invec


## 絶対値計算関数
proc absolute(ab1,ab2:seq[float]):float=
    var abs1: float = 0
    var abs2: float = 0
    var abso1: float = 0
    var abso2: float = 0
    var abso : float= 0
    for i in countup(int64(0),len(ab1)-1):
        abs1 = abs1 + (ab1[i])*(ab1[i])
        abs2 = abs2 + (ab2[i])*(ab2[i])
        abso1 = sqrt(abs1)
        abso2 = sqrt(abs2) 
        abso = abso1*abso2
    return abso


##cos類似度計算関数
proc git_col_len():seq[string]=

    let dfRawText = DF.fromFile("inputのPATH")

    const schema = [
    strCol("id"),
    ]
    let df = dfRawText.map(schemaParser(schema, '\t'))
                  
    var name: seq[string] = df.map(record => record.id)
                              .collect()
    
    var length:int64 = df.count()-1
    var lem : int64 = df.count()
    var ii:int64 = 0
   
    for i in countup(ii,length):
        var v: seq[string] = name[i].split( re"[,] ?" )
        var vname: seq[string] = name[i].split( re"[,] ?" )
        v.delete(0)
        var vv: seq[float] = v.mapIt(parseFloat(it))
        for j in countup(ii,length):
            var w: seq[string] = name[j].split( re"[,] ?" )
            var wname: seq[string] = name[j].split( re"[,] ?" )
            w.delete(0)
            var ww: seq[float] = w.mapIt(parseFloat(it))
            var naiseki = vv*ww              ##ベクトルを掛け算したseqを取得
            var inner:float = 0
            var abso:float = 0
            var cosluigi:float = 0
            cosluigi = inner_vec(naiseki)/absolute(vv,ww)
            var res: seq[string] = @[$vname[0],$wname[0],$cosluigi]
            echo res
                
echo git_col_len()
