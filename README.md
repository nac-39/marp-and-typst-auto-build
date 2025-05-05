# marp-auto-build

marp で作成したスライドを自動でビルドし、GitHub Pages にデプロイします。

- 公開先：https://{your-id}.github.io/marp-auto-build/

## 手順

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

### 2. 権限の追加

リポジトリの設定画面から、

`Settings > Actions > General > Workflow permissions` を `Read and write permissions` に変更します。

![](example/images/example_permission.png)

### 3. GitHub Pages を有効化

リポジトリの設定画面から、

`Settings > Pages > Build and deployment > Branch`を`gh-pages`に変更してください。

![w:700](example/images/example_pages.png)

### 4. スライドの追加

スライドは、`example/`ディレクトリにならって作成してください。

```
${スライド名}/
  ├ images/
  │  ├ image1.png
  │  ├ image2.png
  │  ...
  └ slide.md
```

**注意**：`images/`の中に入っているファイル名が重複すると、`slides/images`に画像がコピーされる際に上書きされてしまうため、全スライドを通じてファイル名は重複しないようにしてください。

自作 css 等のカスタムテーマは、`.marp/themes`ディレクトリに格納してください。

### 5. commit & push

main ブランチにコミットし、push されると GitHub Actions により自動でビルド、デプロイされます。
デプロイ先の URL は`https://${GitHubのユーザ名}.github.io/${リポジトリ名}`です。

### 注意

#### typst でのフォント

ビルドは Ubuntu のコンテナ上で行われます。そのためローカル環境にあってもコンテナにないフォントは使用できません。
もし追加で使用したいフォントがあれば、Workflow ファイルの`Install fonts-noto`の部分を参考に追記してください。
現在は`Noto Sans JP`は使用可能になっています。

# 参考

- [Marp でスライドを作成しよう 〜 カスタムテーマと GitHub Actions による自動化まで 〜](https://zenn.dev/istyle/articles/8f13b876af7e3b)
