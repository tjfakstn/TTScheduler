#!/bin/sh
# index.html(claude.ai 아티팩트용 본문)을 GitHub Pages용 완성 문서 docs/index.html로 감싼다.
# 아티팩트 게시 때 붙는 기본 머리말·초기화 스타일을 똑같이 넣어서 두 곳의 화면이 같게 보이게 한다.
set -e
cd "$(dirname "$0")"
mkdir -p docs
{
  printf '%s\n' '<!doctype html>' '<html lang="ko">' '<head>' \
    '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">' \
    '<style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0;font:14px system-ui,-apple-system,sans-serif}img{max-width:100%}[hidden]{display:none!important}</style>' \
    '</head>' '<body>'
  cat index.html
  printf '%s\n' '</body>' '</html>'
} > docs/index.html
touch docs/.nojekyll
echo "docs/index.html 생성 완료"
