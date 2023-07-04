# Mac dotfiles

This repo is my ongoing progress for working on my personal dotfiles for my devices.

## Setting up your Mac

1. Update macOS to the latest version through system preferences
2. Generate a new public and private SSH key by running:

```bash
curl https://raw.githubusercontent.com/juststeveking/dotfiles-mac/HEAD/ssh.sh | sh -s "<your-email-address>"
```

3. Clone this repo to `~/.dotfiles` with:

```bash
git clone --recursive git@github.com:juststeveking/dotfiles-mac.git ~/.dotfiles
```

4. Run the installation with:

```bash
~/.dotfiles/install.sh
```

5. After machup is synced with your cloud storage, restore preferences by running `mackup restore`
6. Restart your computer to finalize the process

**Your Mac is now ready to use!**

