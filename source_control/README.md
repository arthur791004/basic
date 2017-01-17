# Source Control

## 常用功能對照表
| 功能            | svn                     |   git                       |        hg                | cvs              |
| -------------- | ----------------------- | --------------------------- | ------------------------ | ---------------- |
| 複製 Repository | svn checkout \<path\>   | git clone \<path\>          | hg clone \<path\>        | cvs checkout \<module\> |
| 更新 Repository | svn update              | git pull --rebase           | hg pull && hg update -C  | cvs update |
| 切到特定版本     | svn checkout -r \<rev\> | git reset --hard -r \<rev\> | hg update -C -r \<rev\>  |  |
| 新增檔案        | svn add \<file path\>    | git add \<file path\>      | hg add \<file path\>      | cvs add \<file path\> |
| 移除檔案        | svn rm \<file path\>     | git rm \<file path\>        | hg remove \<file path\>  | cvs remove \<file path\> |
| commit         | svn commit               | git commit [-a]             | hg commit                | cvs commit |
| push           | x                        | git push                    | hg push                  | x |
| 新增 branch     | ?                       | git branch \<new branch\>   | hg branch \<new branch\>  |  |
| 切換 branch     | ?                       | git checkout \<branch\>     | hg update \<branch\>      |  |
| Push New branch | ?                       | git push -u origin \<branch\> | hg push --new-branch    |  |
| Merge branch    | ?                       | git merge \<branch\>         | hg merge \<branch\>      |  |
| 列出 branch     | ?                       | git branch [-a]              | hg branches              |  |
| 衝突檔案標記為已解決 | ?                   | git add \<file path\>        | hg resolve -m \<file path\> |  |
| diff           | svn diff                 | git diff                     | hg diff                  | cvs diff |
| diff rev       | ?                        | git diff \<rev1\> \<rev2\> -- \<file\> | hg diff -r \<rev1\> -r \<rev2\> \<file\> |   |
| blame          | ?                        | git blame \<file path\>      | hg blame \<file path\>   |  |
| revert         | svn revert \<file path\> | git checkout \<file path\>   | hg revert \<file path\>  |  |
| 查看 Log       | svn log                  | git log -\<number\>          | hg log -l \<number\> [-v] | cvs log |
| 查看當前狀態    | svn info                 | git status                   | hg status                 |  |

## 補充說明

## 進階功能

## Reference
* svn
  * https://blog.longwin.com.tw/2007/07/svn_tutorial_2007/
* git
  * https://ihower.tw/git/basic.html
  * https://gist.github.com/guweigang/9848271
* hg
  * http://www.slideshare.net/WanCW/mercurial
  * http://marco79423.twbbs.org/articles/%E5%88%9D%E6%8E%A2-mercurial-%E4%B9%8B%E5%A5%B3%E5%8F%8B%E9%96%8B%E7%99%BC%E6%97%A5%E8%AA%8C/
* cvs
  * https://puremonkey2010.blogspot.tw/2010/12/linux-linuxcvs.html
  * http://kevincrazy.pixnet.net/blog/post/29780822-cvs%E5%85%A5%E9%96%80
  * http://cz8384.bokee.com/984680.html
