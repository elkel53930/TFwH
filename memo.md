## 単一マス目拡張

「選択肢が複数あるマス目」が複数あっても、一つの「選択肢が複数あるマス目」に対してのみ選択肢を拡張(expand)する。

safeって何？。確定したマス目同士では矛盾がない(確定したマス目の値はそれぞれ異なる)事を安全(safe)と定義している。
pruneすると複数要素あるマスの値が確定して、安全でなくなることはある。
`[2], [2,3], [3] -> [2],[3],[3]`みたいに。

逆はない。選択肢増やしてもsafeであることは変わらない。`[2], [1], [3] -> [2],[1,3],[3]`みたいに。


安全な完成行列m (= 答えのこと)にたいして
```
filter valid (expand m) = [extract m]
```
答えが相手なんだから、expandしてvalidなものだけをこしとっても、
extract = map (map head)choicesの先頭だけ取り出しても(そもそもリストchoicesの要素数は1つ)同じ。

# 6章

## 6.1 自然数上の帰納法

{exp.1}は「expの定義の1行目」っていう意味。

浮動小数点数じゃなくても結合則成り立たないよね。Intとか。

### 脱線
```
ghci> import Control.Monad
ghci> (putStrLn "abc" >> fail "hoge") `mplus` putStrLn "hello"
abc
hello
```
一度起こしたabcという副作用は取り消せない…。


## 6.2 リスト上の帰納法

### 無限リスト上の帰納法

擬リスト列　→　擬リストのリスト
```
[[undefined], [0 : undefined], [0 : 1 : undefined], [0 : 1 : 2 : undefined]...]
```

undefinedに値があると思って書いてるよね(値として認めているから擬リストが作れる)。証明器はundefinedの値を認めないよね = 証明器では擬リストは作れない。

```
P(lim[n->inf] xsn )
lim[n-<inf](Pxsn)
```

* e1とe2はHaskellの式。e1 = e2という性質は連鎖完備。e1とe2は∀で修飾された自由変数を含むHaskell式。<br>
ex : `P(xs) | xs /= [] = [head xs] = take 1 xs`
