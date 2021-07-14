## Initializing repo on existing config directory:

```bash
git init
git remote add origin $url_of_clone_source
git fetch origin
git checkout -b master --track origin/master
```

## Configureing NeoVIM

1. Install Plug
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
2. Run `:PlugInstall` in `nvim`.
3. Do YCM installation process.
