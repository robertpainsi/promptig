Promptig
==============

Adds current branch/hash to prompt and colors it by current status like untracked files, behind or ahead, merge conflicts, and many more.

### Install

Clone the repository, add
```bash
function prompt_command {
  export PS1=$(path/to/promptig/folder/promptig)
}
export PROMPT_COMMAND=prompt_command
```
to the end of ~/.bashrc (Linux) or ~/.bash_profile (Mac) and adapt the PS1 path accordingly (e.g. `PS1=$(~/Projects/promptig/promptig)`).

### List of current features

![alt tag](https://raw.githubusercontent.com/robertpainsi/promptig/master/readme-preview.png)

### Things you need to know when modifying the code

- Color codes are terminal dependent. http://www.arwin.net/tech/bash.php#s_1 `Cyan='\e[0;34m'` may not be cyan in your terminal. See color palette (Edit → Profile Preferences → Colors → Palette)

### How to generate a preview output

- Run `test/test.sh` to see a preview output

### How to add a preview output

- Add a new file to test/tests with file extension `.sh` (e.g. my-ultimate-feature.sh) and make it executeable (`chmod +x my-ultimate-feature.sh`)

- Copy the code from another test file and modify it

- Run `test/test.sh` to see a preview output
