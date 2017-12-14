# dotfiles

## Installation

First, run the setup scripts in the `utils/` dir:

```
./utils/setup_dot_files.sh
./utils/setup_git_bash_utils.sh
./utils/setup_rbenv.sh
./utils/setup_vim.sh
```

Then, update the SteerMouse settings (for Microsoft IntelliMouse):

1. `cp SteerMouse/Device.smsetting `
2. Navigate to System Preferences => SteerMouse => Mouse tab
3. Click the `Reconfigure` button
4. Your mouse should now be using the new settings
