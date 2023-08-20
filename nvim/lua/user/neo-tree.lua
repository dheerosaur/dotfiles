require('neo-tree').setup {
  close_if_last_window = true,
  enable_git_status = true,
  filesystem = {
    follow_current_file = { enabled = true },
    hijack_netrw_behavior = 'open_current',
    use_libuv_file_watcher = true,
  },
  git_status = {
    window = {
      position = 'float',
      mappings = {
        ['A'] = 'git_add_all',
        ['gu'] = 'git_unstage_file',
        ['ga'] = 'git_add_file',
        ['gr'] = 'git_revert_file',
        ['gc'] = 'git_commit',
        ['gp'] = 'git_push',
        ['gg'] = 'git_commit_and_push',
      },
    },
  },
}
