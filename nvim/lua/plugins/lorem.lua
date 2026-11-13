return {
   'derektata/lorem.nvim',
   cmd = "LoremIpsum",
   event = "InsertEnter",
   opts = {
      sentence_length = "mixed", -- using a default configuration
      comma_chance = 0.3,        -- 30% chance to insert a comma
      max_commas = 2,            -- maximum 2 commas per sentence
   },
}
