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
   "cmus",
   "spotify",
   "firefox",
   "mpv",
   "next",
   "previous",
   "pause",
   "play",
   "play-pause",
}
create_user_command("Player", function(opts)
   local system = vim.fn.system
   local notify = vim.notify
   local arg1 = opts.fargs[1] or "";
   local arg2 = opts.fargs[2] or "";
   local supported_players = {
      "cmus",
      "spotify",
      "firefox",
      "mpv"
   }
   local playback_commands = {
      "next",
      "previous",
      "pause",
      "play",
      "play-pause",
   }

   local function is_arg_player(arg)
      for _, player in ipairs(supported_players) do
         if arg == player then return true end
      end
      return false
   end

   local function is_arg_command(arg)
      for _, command in ipairs(playback_commands) do
         if arg == command then return true end
      end
      return false
   end

   local function notify_player(supported_player)
      local status_command = "playerctl status"
      local player_name_command = "playerctl metadata --format '{{ playerName }}'"
      local song_command = "playerctl metadata --format '{{ artist }} - {{ title }}'"

      if supported_player then
         status_command = "playerctl -p " .. supported_player .. " status"
         player_name_command = "playerctl -p " .. supported_player .. " metadata --format '{{ playerName }}'"
         song_command = "playerctl -p " .. supported_player .. " metadata --format '{{ artist }} - {{ title }}'"
      end

      local status = string.gsub(system(status_command), "\n", "")
      if status == "No players found" or status == "Stopped" then
         return notify(status, "WARN");
      end

      local player_name = string.gsub(system(player_name_command), "\n", "")
      local song = string.gsub(system(song_command), "\n", "")
      local status_icons = {
         Playing = "󰐊 ",
         Paused = "󰏤 ",
      }

      status = string.gsub(system(status_command), "\n", "")
      local notify_table_data = {
         status, " (", player_name, ")\n",
         status_icons[status], song
      }

      return notify(table.concat(notify_table_data))
   end

   if is_arg_player(arg1) then
      if arg2 == "" then
         return notify_player(arg1)
      end

      if not is_arg_command(arg2) then
         return notify("Invalid player argument " .. arg2, "WARN")
      end

      system("playerctl -p " .. arg1 .. " " .. arg2)
      return notify_player(arg1)
   end

   if arg1 ~= "" and not is_arg_player(arg1) and not is_arg_command(arg1) then
      return notify("Invalid argument " .. arg1, "WARN")
   end

   system("playerctl " .. arg1)
   return notify_player()
end, {
   nargs = "*",
   complete = function()
      return player_args
   end
})
