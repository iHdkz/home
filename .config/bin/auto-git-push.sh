#!/bin/bash

cd $HOME || exit

# 追跡対象の変更をステージング[cite: 1]
git add -u

# 変更がない場合はpull（最新化）だけして終了する
if git diff --cached --quiet ; then
    git pull --rebase origin master -q
    exit 0
fi

CURRENT_TIME=$(date +'%Y-%m-%d %H:%M:%S')

# 1. 変更をコミットせずに、まずはstash（裏ポケット）へ退避
git stash push -m "Auto sync: $CURRENT_TIME"

# 2. 安全に最新の履歴を取り込む
if ! git pull --rebase origin master -q; then
    echo "[$(date)] Pull failed. Sync aborted." >> $HOME/.dotfiles-sync-error.log
    exit 1
fi

# 3. stashから変更を戻してコンフリクト判定
if ! git stash pop; then
    # コンフリクト発生！
    # popに失敗するとstashは安全に保持されますが、作業ファイルに競合マーカーが残るためリセットします
    git reset --hard HEAD
    
    MSG="[WARN] Dotfiles sync conflict! Your changes are kept safe in git stash."
    echo "[$(date)] $MSG" >> $HOME/.dotfiles-sync-error.log
    
    # 通知: 開いているすべてのターミナル画面（WSL/Gentoo）に警告をブロードキャスト
    echo "$MSG" | wall 2>/dev/null
    exit 1
fi

# 4. コンフリクトなく戻せたら、改めてコミットとプッシュを行う
git add -u
git commit -m "Auto backup: $CURRENT_TIME"
git push origin master -q
