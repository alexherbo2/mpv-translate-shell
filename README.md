# mpv / Translate Shell

[![IRC][IRC Badge]][IRC]

###### [Configuration](#configuration) | [Documentation](#commands) | [Contributing](CONTRIBUTING)

> [mpv] script to translate subtitles with [Translate Shell].

## Installation

``` sh
ln -s $PWD/scripts/translate-shell.lua $XDG_CONFIG_HOME/mpv/scripts/
```

## Configuration

Add a key-binding:

`input.conf`

```
t script-message-to translate_shell toggle
```

Configure [Translate Shell]:

`script-opts/translate_shell.conf`

```
target=fr
```

## Commands

- `enable`: Enable Translate Shell
- `disable`: Disable Translate Shell
- `toggle`: Toggle Translate Shell

## Options

- `target`: Target language

[mpv]: https://mpv.io
[Translate Shell]: https://github.com/soimort/translate-shell
[IRC]: https://webchat.freenode.net/#mpv
[IRC Badge]: https://img.shields.io/badge/IRC-%23mpv-blue.svg
