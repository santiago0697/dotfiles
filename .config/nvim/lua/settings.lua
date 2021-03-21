vim.o.hidden=true                              --Required to keep multiple buffers open multiple buffers
vim.wo.wrap=false                              --Display long lines as just one line
vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.o.pumheight=10                        --Makes popup menu smaller
vim.o.fileencoding="utf-8"                  --The encoding written to file
vim.o.cmdheight=2                         --More space for displaying messages
vim.o.splitbelow=true                          --Horizontal splits will automatically be below
vim.o.splitright=true                          --Vertical splits will automatically be to the right
vim.o.termguicolors=true
vim.o.t_Co="256"                            --Support 256 colors
vim.cmd('set ts=4')                           --Insert 4 spaces for a tab
vim.cmd('set sw=4')                        --Change the number of space characters inserted for indentation
vim.bo.expandtab=true                           --Converts tabs to spaces
vim.bo.smartindent=true                         --Makes indenting smart
vim.wo.number = true				-- show line number
vim.wo.relativenumber = true			-- show relative line number
vim.wo.cursorline=true                          --Enable highlighting of the current line
vim.o.showtabline=2                       --Always show tabs
vim.o.showmode=false                          --We don't need to see things like -- INSERT -- anymore
vim.wo.signcolumn="yes"                      --Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime=300                      --Faster completion
-- vim.o.timeoutlen=100                      --By default timeoutlen is 1000 ms
vim.o.clipboard="unnamedplus"               --Copy paste between vim and everything else
vim.cmd('set autoread')						-- Autoreload files
vim.cmd('nnoremap n nzzzv')
vim.cmd('nnoremap N Nzzzv')
