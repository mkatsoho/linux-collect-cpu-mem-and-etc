# this

## Prereq

To collect per cpu usage, you should do like these for **only once**

- 1. Start `top`, and press 1 to show each cpu usage, and then, 
- 2. press `shift + w`, the current config is automatically saved to `$HOME/.toprc`, and then
- 3. press `control + c` to exit


## How to run

```bash

bash ./collect.sh	# save in files /tmp/*.log

```

## TODOs

- [x] collect overall cpu usage
- [x] collect individal cpu usage
- [x] collect memory useage
- [ ] collect process and subprocess numbers of my app

