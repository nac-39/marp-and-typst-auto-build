#!/bin/zsh

local MARP_CDN='
<!-- mermaid.js -->
<script src="https://unpkg.com/mermaid@8.1.0/dist/mermaid.min.js"></script>
<script>mermaid.initialize({startOnLoad:true});</script>'

# slidesのリセット
rm -rf slides && mkdir -p slides/images
touch slides/images/.gitkeep

# imagesのリセット
rm -rf output && mkdir -p output/images
touch output/images/.gitkeep

# slides/index.mdのリセット
echo '# slides' >slides/index.md

# ディレクトリのみ取り出し
for dir in $(ls -l | grep '^d' | awk '{print $9}'); do
    if [[ ! $dir =~ "slides|output" ]]; then
        if [[ -f "$dir/slide.typ" ]]; then
            # slide.typが存在する場合の処理
            cat "$dir/slide.typ" >"slides/$dir.typ"
            # indexに追記
            echo "- $dir ([PDF](./$dir.pdf))" >>'slides/index.md'
        elif [[ -f "$dir/slide.md" ]]; then
            # slide.mdが存在する場合の処理
            cat "$dir/slide.md" >"slides/$dir.md"
            echo $MARP_CDN >>"slides/$dir.md"
            # indexに追記
            echo "- [$dir](./$dir) ([PDF](./$dir.pdf))" >>'slides/index.md'
        fi
        # imagesのコピー
        for img in $(ls "$dir/images"); do
            cp "$dir/images/$img" slides/images
            cp "$dir/images/$img" output/images
        done
    fi
done
