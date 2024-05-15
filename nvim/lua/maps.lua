local keymap = vim.keymap

-- Do not yank with x
keymap.set("n", "x", '"_x')

-- -- Do not yank on paste
keymap.set("v", "p", '"_dP')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

--Save all
keymap.set("n", "<C-s>", ":wa<Return>", { silent = true })

-- tabs
keymap.set("n", "te", ":tab split<Return>", { silent = true })
keymap.set("n", "tn", ":tabnext<Return>", { silent = true })
keymap.set("n", "tp", ":tabprevious<Return>", { silent = true })

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Move lines
keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true, remap = true })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true, remap = true })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, remap = true })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, remap = true })

-- try hard mode
keymap.set("n", "<Up>", "", { silent = true })
keymap.set("n", "<Down>", "", { silent = true })
keymap.set("n", "<Left>", "", { silent = true })
keymap.set("n", "<Right>", "", { silent = true })

-- fold
keymap.set("n", "f", ":foldclose<Return>", { silent = true })
keymap.set("n", "ff", ":foldopen<Return>", { silent = true })
