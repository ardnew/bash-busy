# busy
Very simple animated busy indicator for Bash shell scripts

![busy for 2 seconds](extras/demo.gif)

# Usage

The provided function accepts 2-3 arguments:

```bash
$ busy [delay] <prompt> <expression>
```

If the first argument (`[delay]`) appears to be a time duration (as recognized by `sleep(1)`), then it is used as the animated frame duration. Otherwise, the default `0.1s` is used.

The next argument is the prompt printed next to the animated busy string.

The final argument is a string that is passed to `eval` and determines how long to continue the busy loop. As long as the expression evaluates `false`, the busy loop continues running. Once it evaluates true, the busy loop exits and the function returns.

# Installation

Add function [`busy`](busy.bash) to one of your shell initialization scripts (e.g. `.bashrc`), or download the script in this repo and source it from your script:

```bash
. busy.bash
```
