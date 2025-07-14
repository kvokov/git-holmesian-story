# Git Sherlock Holmes Story Generator

[![License: 🍺 Beerware](https://img.shields.io/badge/license-🍺%20Beerware-yellow.svg?style=flat)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/kvokov/git-holmesian-story.svg?style=social)](https://github.com/kvokov/git-holmesian-story/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/kvokov/git-holmesian-story.svg?style=social)](https://github.com/kvokov/git-holmesian-story/network)

Turn a shell script into a **Sherlock Holmes detective tale** told *entirely* through Git commits.

---

## Quick start

```bash
git clone https://github.com/kvokov/git-holmesian-story
cd git-holmesian-story
chmod +x create_mystery_repo.sh
./create_mystery_repo.sh         # creates ./the-mystery-of-the-missing-semicolon
cd the-mystery-of-the-missing-semicolon
git log --reverse -p             # enjoy the story
```

<div align="center">
  <img src="media/demo.gif" width="480" alt="Animated preview of git log scrolling through the story"/>
</div>

---

## What you get

- **Ten canonical commits** that read like a short Conan-Doyle adventure.
- **TypeScript source** whose diffs advance the plot.
- **Zero** dependencies beyond standard **Git** and a **POSIX-compatible sh**.
- A sleek starting point for your own commit-driven narratives.

---

## How it works

`create_mystery_repo.sh` bootstraps a nested repository named **the-mystery-of-the-missing-semicolon**, timestamps each commit for natural ordering, and fills the history with code plus Holmesian prose. The outer repo is just the launcher, the inner repo is the story.

---

## Contributing

- Pull requests for new mysteries, tweaks, or README polish are welcome.
- Run `shellcheck create_mystery_repo.sh` before submitting.

---

## License

Released under the *Beerware* License - see [LICENSE](LICENSE) for details.