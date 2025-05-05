---
marp: true
header: "example"
theme: gaia
paginate: true
math: katex
---

# marp-and-typst-auto-build

forked from [kentakom1213](https://github.com/kentakom1213/)
modified by [nac-39](https://github.com/nac-39/)

<hr>

marp で作成したスライドを自動でビルドし、GitHub Pages にデプロイします。

- 公開先：https://{your-id}.github.io/marp-auto-build/

---

### 1. git の hook を設定

`.git/hooks/pre-commit`を作成し、以下を書き加えます。

```sh
#!/bin/zsh

# arrange files
./organize-md.sh

# staging
git add .
```

**注意**：`organize-md.sh`は zsh で書かれているため、それ以外のシェルを使っているかたは適宜書き換えてください。

---

### 2. 権限の追加

リポジトリの設定画面から、

`Settings > Actions > General > Workflow permissions` を `Read and write permissions` に変更します。

![w:800](images/example_permission.png)

---

### 3. GitHub Pages を有効化

リポジトリの設定画面から、

`Settings > Pages > Build and deployment > Branch`を`gh-pages`に変更してください。

![w:700](images/example_pages.png)

---

### 4. スライドの追加

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

**注意**：`images/`の中に入っているファイル名は（全スライドを通じて）重複しないようにしてください。

---

### 5. commit & push

main ブランチにコミットし、push されると GitHub Actions により自動でビルド、デプロイされます。
デプロイ先の URL は`https://${GitHubのユーザ名}.github.io/${リポジトリ名}`です。

---

# 完成！

よい marp ライフを！
