# omarchy-lumon-greeting
<!-- lumon-voice:head -->
```
░▒▓█  L U M O N   I N D U S T R I E S  █▓▒░
```
> *Welcome back to the severed floor. Your terminal has missed you, in its way.*
<!-- /lumon-voice:head -->

<!-- lumon-set:start -->
> **Part of [Omarchy · Lumon Industries](https://github.com/KaiCryan/omarchy-lumon)** — a whole-system *Severance* theme for Omarchy.

<details><summary><strong>The full set</strong></summary>

| Repo | |
|---|---|
| [omarchy-lumon](https://github.com/KaiCryan/omarchy-lumon) | **the hub** — install everything, screenshots, the whole pitch |
| [omarchy-lumon-boot](https://github.com/KaiCryan/omarchy-lumon-boot) | Plymouth boot splash — Lumon globe, matching LUKS prompt |
| [omarchy-lumon-lock](https://github.com/KaiCryan/omarchy-lumon-lock) | lock screen — prompts *“Enter your access code”* |
| **omarchy-lumon-greeting** | terminal greeting — 19 animations, then `fastfetch` &nbsp;·&nbsp; ← you are here |
| [omarchy-lumon-wallpapers](https://github.com/KaiCryan/omarchy-lumon-wallpapers) | ASCII crew portraits + 4K brand set, hourly cycler |
| [omarchy-lumon-screensaver](https://github.com/KaiCryan/omarchy-lumon-screensaver) | capped-fps `ttfx` effects + an ambient scene reel |
| [omarchy-lumon-theme](https://github.com/KaiCryan/omarchy-lumon-theme) | colour scheme, Hyprland look’n’feel, `fastfetch` + about branding |
| [omarchy-desktop-quote](https://github.com/KaiCryan/omarchy-desktop-quote) | a rotating quote placard over the wallpaper |
| [omarchy-lumon-assets](https://github.com/KaiCryan/omarchy-lumon-assets) | shared ASCII art, fonts and build tools |

</details>
<!-- lumon-set:end -->

<!-- lumon-media:start -->
<div align="center">

![A fresh terminal drawing a personnel-badge animation, then the fastfetch briefing](https://github.com/KaiCryan/omarchy-lumon-greeting/raw/main/docs/greeting.gif)

<sub>A fresh terminal: the personnel-badge animation, then the <code>fastfetch</code> briefing. <a href="https://github.com/KaiCryan/omarchy-lumon-greeting/raw/main/docs/greeting.mp4">Full clip (mp4)</a>.</sub>

</div>
<!-- lumon-media:end -->

A *Severance* / Lumon Industries greeting for [Omarchy](https://omarchy.org)
terminals. The first terminal you open after logging in plays a short
themed animation, then hands off to the usual `fastfetch` system briefing.

Nineteen animations ship in the rotation — a spinning Lumon globe, the descent
to the severed floor, a Macrodata Refinement bin filling with numbers, the
Music Dance Experience, Defiant Jazz, the Board, a random employee's personnel
badge (`badge`), and more.

## Install

```sh
git clone https://github.com/KaiCryan/omarchy-lumon-greeting
cd omarchy-lumon-greeting
./install.sh
```

`install.sh`:

- copies `branding/` into `~/.config/omarchy/branding/`
- writes `~/.config/omarchy/branding/lumon-greeting.conf` from the example
  (only if you don't already have one)
- adds a small hook to `~/.bashrc` (guarded by `$LUMON_GREETED` so it runs
  once per terminal, not per subshell)

Open a new terminal to see it. Nothing runs until then.

## Configure

Edit `~/.config/omarchy/branding/lumon-greeting.conf`:

| Key | Meaning |
|---|---|
| `LUMON_GREETING_ENABLED` | `1` / `0` master switch (the briefing still runs) |
| `LUMON_ANIM` | `random` (default), `sequence`, `daily`, a single name, or a set like `"globe mdr badge"` |
| `LUMON_ANIM_SPEED` | `>1` faster, `<1` slower |
| `LUMON_ANIM_MAXTIME` | hard cap in seconds — safety net, keep it |
| `LUMON_ANIM_FASTFETCH` | `1` to show the `fastfetch` briefing afterwards |
| `LUMON_ANIM_COLOR` / `_DIM` / `_HOT` | palette, `R;G;B` truecolor |
| `LUMON_ANIM_NAME` | name used by the `boot` / `elevator` intros (blank = `$USER`) |

```sh
lumon-greeting --list        # the animations
lumon-greeting <name>        # play one now, no briefing
lumon-greeting --preview     # play them all back to back
```

## Uninstall

```sh
./uninstall.sh
```

Removes the `~/.bashrc` hook and the installed files. Your `.conf` is left
in place; delete it by hand if you want.

## Notes

- Truecolor terminal recommended (Ghostty, foot, Kitty, Alacritty). Non-tty
  output falls back to a single static frame.
- `branding/lumon-anims/_previewtty.py` runs any animation in a fake terminal
  and prints the final screen as plain text — a no-GUI layout check.
- The character portraits in `badge` are ASCII line-art; the wallpaper set that
  shares the pipeline is [omarchy-lumon-wallpapers](https://github.com/KaiCryan/omarchy-lumon-wallpapers).

---

<div align="center"><sub>

*The work is mysterious and important.*

Part of [Omarchy · Lumon Industries](https://github.com/KaiCryan/omarchy-lumon) · a personal, non-commercial *Severance* tribute · not affiliated with Apple TV+

</sub></div>
<!-- lumon-voice:footer -->
