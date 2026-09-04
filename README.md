# omarchy-lumon-greeting

> Part of **[Omarchy · Lumon Industries](https://github.com/KaiCryan/omarchy-lumon)** — a whole-system _Severance_ theme for Omarchy. This repo is one piece; the hub links the rest.

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
