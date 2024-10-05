local create_user_command = vim.api.nvim_create_user_command

create_user_command("DiffOrig", function()
   local scratch_buffer = vim.api.nvim_create_buf(false, true)
   local current_ft = vim.bo.filetype
   vim.cmd("vertical sbuffer" .. scratch_buffer)
   vim.bo[scratch_buffer].filetype = current_ft
   vim.cmd("read ++edit #") -- load contents of previous buffer into scratch_buffer
   vim.cmd.normal('1G"_d_') -- delete extra newline at top of scratch_buffer without overriding register
   vim.cmd.diffthis()       -- scratch_buffer
   vim.cmd.wincmd("p")
   vim.cmd.diffthis()       -- current buffer
end, {})

create_user_command("Player", function(args)
   local system = vim.fn.system
   local notify = vim.notify
   local tool = "playerctl "
   local arg = args["args"]

   local function notify_new_track()
      local song = system(tool .. "metadata --format '{{ artist }} - {{ title }}' | tr -d '\n'")
      notify("󰐊 " .. song)
   end

   if arg == "status" then
      local status = system(tool .. "status | tr -d '\n'");
      notify(status)
   elseif arg == "next" then
      system(tool .. "next")
      notify_new_track()
   elseif arg == "previous" then
      system(tool .. "previous")
      notify_new_track()
   elseif arg == "pause" then
      system(tool .. "pause")
   elseif arg == "play" then
      system(tool .. "play")
   elseif arg == "play-pause" then
      system(tool .. "play-pause")
   else
      local player_name = system(tool .. "metadata --format '{{ playerName }}'")
      local song = system(tool .. "metadata --format '{{ artist }} - {{ title }}' | tr -d '\n'")
      notify(player_name .. "󰐊 " .. song)
   end
end, {nargs = "*"});

