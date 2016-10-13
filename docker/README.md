# Docker

## install
1. curl [-fsSL]  https://get.docker.com/ | sh
   * -f: Fail silently (no output at all) on HTTP errors
   * -s: Silent mode. Don't output anything
   * -S: Show error. With -s, make curl show errors when they occur
   * -L: Follow redirects
2. sudo systemctl enable docker.service
3. usermod -aG docker [username]

## commands
* docker build -t [Name] [PATH]
  * --tag: Name and optionally a tag in the 'name:tag' format
  * --file: Name of the Dockerfile (Default is 'PATH/Dockerfile')
* docker run --name [name] --publish [host]:[container] -d [IMAGE]
  * --detach: Run container in background and print container ID
  * --env: Set environment variables
  * --env-file: Read in a file of environment variables
  * --expose: Expose a port or a range of ports
  * --hostname: Container host name
  * --link [container]:[alias]: Add link to another container
  * --name: Assign a name to the container
  * --publish [host]:[container]: Publish a container's port(s) to the host (default [])
  * --volume [host]:[container]: Bind mount a volume
* docker ps
* docker logs [container]
* docker exec -ti [container] bash
  * connect to bash for docker container
* docker start/stop/restart [container] 
* docker inspect [container]
* docker images
* docker rm [container]
* docker rmi [IMAGE]

## dockerfile
* concept
  * 製作 image 的方式有兩種：
    * 使用 Docker container，直接進入 container 內部，使用命令列增刪改，再匯出成 image
    * 使用 Dockerfile，將增刪改的動作文本化，再建置成 image。Dockerfile 的方式容易調整與管理，也是推薦的方式。
* basic
  * FROM [base image]
    * 基於某個已存在的 image 進行二次開發
  * MAINTAINER 
    * 記載誰寫的。
  * RUN
    * 在 Docker 建置 image 時執行命令列指令，主要用來安裝 packages、設定系統環境等操作。
    * 如: npm install
  * USER
    * 用來切換使用者身分。Docker 預設使用者是 root，但若不需要，建議切換使用者身分，畢竟 root 權限太大了，使用上有安全的風險。
  * WORKDIR
    * 用來切換工作目錄。Docker 預設工作目錄是在根目錄
  * COPY
    * 能將本機端的檔案或目錄，複製到 image 內
  * ENTRYPOINT
    * An ENTRYPOINT allows you to configure a container that will run as an executable.
    * 指定 Docker image 運行成 instance 時，要執行的指令或檔案
    * formats
      * ENTRYPOINT \["executable", "param1", "param2"\] (the preferred exec form) 
      * ENTRYPOINT command param1 param2 (shell form) 
* advance
  * ONBUILD
    * 讓指令延遲執行，延遲到下一個使用 FROM 的 Dockerfile 在建置 image 時執行，只限延遲一次。
    * ONBUILD 的使用情境在於建置時取得最新的源碼 (搭配 RUN) 與限定系統框架
  * ADD
  * CMD
    * The main purpose of a CMD is to provide defaults for an executing container.
    * docker run 命令如果指定了參數會把 CMD 裡的參數覆蓋
    * formats
      * CMD \["executable","param1","param2"\] (exec form, this is the preferred form): 運行一個可執行的文件並提供參數
      * CMD \["param1","param2"\] (as default parameters to ENTRYPOINT): 為 ENTRYPOINT 指定參數
      * CMD command param1 param2 (shell form): 是以 "/bin/sh -c" 的方法執行的命令
  * EXPOSE
* variable
  * ARG
    * ARG 定義的變數效果只在建置 image 時有效，建置完成後變數就消失
  * ENV
    * ENV 定義的變數是環境變數，image 運行成 instance 時依然存在，可從 instance 內的環境變數中取得
  * LABEL
    * LABEL 定義的標籤可以使用在 docker 指令中作為過濾用途，在 instance 內是無法取得。
* improvement
  * ENV 個數
    * ENV 允許一次定義多個變數
  * RUN 個數
    * RUN 允許使用 && 串接指令，這麼做的好處是減少建置成 image 的 layer 數量，因為 layer 數量的上限為 127。
    * 當然還有更好的做法，例如使用 Shell scripts 執行複雜的指令。
* others
  * 查看 image 或 container 的 LABEL
    * docker inspect [IMAGE or CONTAINER_NAME]
  * 統計 image 的 layer 數量
    * docker history IMAGE_NAME | wc -l
* notes
  * COPY v.s ADD
    * ADD 多了 2 個功能, 下載 URL 和解壓縮
    * 如果你不希望壓縮文件 copy 到 container 後會被解壓縮的話 ==> 使用 COPY
    * 如果需要自動下載 URL 並 copy 到 container ==> ADD
  * ENTRYPOINT v.s CMD
    * ENTRYPOINT 和 CMD 的不同點在於執行 docker run 時參數傳遞的方式
    * CMD 指定的命令可以被 docker run 傳遞的命令覆蓋：
  ```
  ...
  CMD ["echo"]
  docker run CONTAINER_NAME echo foo
  // output: foo
  ```
    * ENTRYPOINT 會把容器名後面的所有內容都當成參數傳遞給其指定的命令(不會對命令覆蓋)：
  ```
  ...
  ENTRYPOINT ["echo"]
  docker run CONTAINER_NAME echo foo
  // output: echo foo
  ```

## reference
* https://docs.docker.com/engine/reference/builder/
* https://docs.docker.com/engine/installation/linux/centos/
* http://cepave.com/how-to-write-dockerfile/
* https://joshhu.gitbooks.io/dockercommands/content/Containers/ContainersBasic.html
* https://philipzheng.gitbooks.io/docker_practice/content/container/run.html
* http://blog.jex.tw/blog/2014/12/24/docker/
* http://dockone.io/article/131
* http://cloud.51cto.com/art/201411/457338.htm
* https://blog.tankywoo.com/docker/2014/05/08/docker-4-summary.html
