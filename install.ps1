Write-Output "Installing vim-plug"

if (!(Get-Command "go.exe" -ErrorAction SilentlyContinue)) {
    Write-Output "make sure go.exe exists in PATH"
}

if (!(Get-Command "python2.exe" -ErrorAction SilentlyContinue)) {
    Write-Output "make sure python2.exe exists in PATH"
}

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
        $uri,
        $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
            "~\vimfiles\autoload\plug.vim"
            )
        )

$vimrc_uri = 'https://github.com/jm33-m0/vim_dotfiles/raw/master/_vimrc'
(New-Object Net.WebClient).DownloadFile(
        $vimrc_uri,
        $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
            "~\_vimrc"
            )
        )

Write-Output "vim-plug has been installed, please :PlugInstall to install other plugins"
