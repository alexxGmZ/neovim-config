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

local player_args = {
   "next",
   "previous",
   "pause",
   "play",
   "play-pause",
}
create_user_command("Player", function(args)
   local system = vim.fn.system
   local notify = vim.notify
   local tool = "playerctl "
   local user_command_arg = args["args"]

   for _, player_command in ipairs(player_args) do
      if player_command == user_command_arg then
         system(tool .. player_command)
      end
   end

   local status = string.gsub(system(tool .. "status"), "\n", "");

   if status == "No players found" or status == "Stopped" then
      return notify(status, "WARN")
   end

   local status_icons = {
      Playing = "󰐊 ",
      Paused = "󰏤 ",
   }
   status = string.gsub(system(tool .. "status"), "\n", "");
   local player_name = string.gsub(system(tool .. "metadata --format '{{ playerName }}'"), "\n", "")
   local song = system(tool .. "metadata --format '{{ artist }} - {{ title }}' | tr -d '\n'")
   local notify_table_data = {
      status, " (", player_name, ")\n",
      status_icons[status], song
   }

   return notify(table.concat(notify_table_data))
end, {
   nargs = "*",
   complete = function()
      return player_args
   end
});
