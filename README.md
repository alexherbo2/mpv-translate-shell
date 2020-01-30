# mpv-translate-shell

[Translate Shell] integration for [mpv].

## Installation

Add [`translate-shell.lua`](scripts/translate-shell.lua) to your [`scripts`] directory.

## Configuration

[`~/.config/mpv/input.conf`][`input.conf`]

```
t script-message-to translate_shell toggle
```

`~/.config/mpv/script-opts/translate_shell.conf`

```
target=fr
```

[mpv]: https://mpv.io
[Translate Shell]: https://soimort.org/translate-shell/
[`input.conf`]: https://mpv.io/manual/master/#files-~/-config/mpv/input-conf
[`scripts`]: https://mpv.io/manual/master/#files-~/-config/mpv/scripts/
