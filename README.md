# vim development
![N|Solid](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9f/Vimlogo.svg/64px-Vimlogo.svg.png)

[what is vim?](https://ko.wikipedia.org/wiki/Vim)

[vim community](https://www.vim.org/)

# how to install
#### 1. all package auto install
```
sudo /bin/bash install.sh
``` 

#### 2. tmux command
| command | description |
| :--- | :--- |
| tmux -V | version check   |
| tmux new -s [name] | create new session |
| ctrl + b, d | session log off   |
| tmux ls | show tmux session list |
| tmux attach -t [name] | connect session |
| tmux + b, % | split screen vertically |
| tmux + b, " | split screen horizontal |
| tmux + b, move key | moving between split screens |
| ctrl + b, z | current screen zoom or zoom out |
| ctrl + b, c | create new tab |
| ctrl + d | close current screen |
| tmux kill-session -t [name] | delete session |

#### 3. vim extension NERDTree command
| command | description |
| :--- | :--- |
| :NERDTreeToggle | NERDTree show & hide |
| ctrl + w, move key | moving between split screens |
| NERDTree click, m, a | create new file |
| NERDTree click, m, m | move file |
| NERDTree click, m, d | delete file |
| NERDTree click, m, c | copy file |

#### 4. vim-go command
| command | description |
| :--- | :--- |
| :GoDef | method, variable, define position navigation |
| :GoImport | package import |
| :GoTest | unit test |
| :GoTestFunc | unit test |
| :GoBuild | package compile |
| :GoInstall | package install |
| :GoRun | run |
| :GoLint | go lint tool |
| :GoPlay | upload go palyground & make link |