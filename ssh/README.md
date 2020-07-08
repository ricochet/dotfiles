# Multiple identities for github and gitlab

##

```bash
# I've seen comments and guides that symlinks of ssh keys between windows
# and WSL work. They didn't for me and IMO not worth the trouble.
# Copy for sanity.
cp -R /mnt/c/Users/$USER/.ssh ~/.ssh

chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/config
```

## If correctly setup

```bash
ssh -T github.com
# Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.

ssh -T gitlab.com
# Welcome to GitLab, USERNAME!
```

## How this works

`~/personal/.gitconfig` uses a different email address then the default `~/.gitconfig`. The `~/.gitconfig` has a conditional include when the gitdir is `~/personal`

## References

- <https://gist.github.com/jexchan/2351996>
- [Guide](https://medium.com/the-andela-way/a-practical-guide-to-managing-multiple-github-accounts-8e7970c8fd46)
