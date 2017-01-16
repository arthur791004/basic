# Git

## commands
* git init
* git config [--global]
  * user.name
  * user.mail
  * alias
* git add \<filename>
* git commit
* git status
  * -uno
* git branch
  * git branch -r
  * git checkout -b \<branch>
  * git checkout \<branch>
* git merge
  * git merge \<branch>
* git stash
  * git stash save -u \<comment>
  * git stash list
  * git stash apply stash @{\<index>}
* git reset
  * --hard: 捨棄所有還沒 commit 的修改，強制回到上一個版本
* git log
  * --oneline
  * --decorate
  * --graph
  * -\<num>
  * -p: 顯示差異
  * -stat: 檢視每個更新的簡略統計資訊
  * git log --graph --oneline --all --branches \<branch>
  * git log \<new>...\<old>
  * git log --after=\<time>
  * git log \<time> --before
  * log after \<changeset>
    * git log --pretty=oneline <changeset>...HEAD --brances <branch>
* git diff
  * -p: 顯示差異
  * git diff-tree -p \<changeset>
* git blame
* git tag
* git rebase
  * 修改 commit: git rebase \<changeset> -i
* git fetch
* git pull
  * git pull -u \<remote name> \<branch>
* git push
  * git push -u \<remote name> \<branch>
* git fork
* git clone
* git remote add \<name> \<remote_url>

## 常用 cases

### 列出 conflict
```git diff --name-only --diff-filter=U```

### Checkout file from other branch
```git checkout <branch_name> -- <paths>```

### Revert
```
git reset --hard HEAD^    # before push
git revert <changeset>    # after push
```

### Log two branch
```git log <old>...<new>```

### 切到某個 changeset
```
# by changeset
git reset --hard <changeset>
# by step
git reflog
git reset --hard HEAD@{<num>}
```

### Merge Specified changeset
```git cherry-pick <changeset>```

### List number of commit between 2 changeset
```git rev-list <new>...<old> --count```

### Without Space
```git diff --ignore-space-change --ignore-all-space | vim -```

## reference
* https://www.slideshare.net/secret/retavuvmp0Vbun
* http://julianchu.net/2015/11/18-git.html
