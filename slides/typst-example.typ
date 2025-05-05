#import "@preview/polylux:0.4.0": *

#counter(page).update(0)
#set page(paper: "presentation-16-9", numbering: "1", footer: context [
  #h(1fr)
  #set text(color.gray, size: 14pt)
  #counter(page).display("1")
])
#set text(font: ("Noto Sans CJK JP", "Noto Sans JP"), size: 20pt)

#set align(horizon)

#slide[
  #set align(horizon)
  #set page(footer: "")
  = marp-and-typst-auto-build
]

#slide[
== 1. git の hook を設定

`.git/hooks/pre-commit`を作成し、以下を書き加えます。

```sh
  #!/bin/zsh

  # arrange files
  ./organize-md.sh

  # staging
  git add .
  ```

*注意*：`organize-md.sh`は zsh で書かれているため、それ以外のシェルを使っているかたは適宜書き換えてください。
]

#slide[
== 2. 権限の追加

リポジトリの設定画面から、

`Settings > Actions > General > Workflow permissions` を `Read and write permissions` に変更します。

#image("images/example_permission.png", width: 50%)

]

#slide[
== 4. スライドの追加

スライドは、`example/`ディレクトリにならって作成してください。

```
slide-name/
  ├ images/
  │  ├ image1.png
  │  ├ image2.png
  │  ...
  └ slide.md
```

カスタム css は、`.marp/themes`ディレクトリに格納してください。

*注意*：`images/`の中に入っているファイル名は（全スライドを通じて）重複しないようにしてください。

]

#slide[
== 5. commit & push

main ブランチにコミットし、push されると GitHub Actions により自動でビルド、デプロイされます。 デプロイ先の URL は`https://${GitHubのユーザ名}.github.io/${リポジトリ名}`です。

]

#slide[
  == 完成！

  よい marp & typst ライフを！

]