local animation = {
  duration = {
    step = 6,
    total = 150,
  },
  easing = "inOutQuint",
}

return {
  "folke/snacks.nvim",
  opts = (function()
    return {
      animate = {
        fps = 165,
        duration = animation.duration,
        easing = animation.easing,
      },
      dashboard = {
        preset = {
          header = [[
███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ 
████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ 
██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ 
██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ 
██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ 
╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ 
]],
        },
      },
      scroll = {
        animate = {
          duration = animation.duration,
          easing = animation.easing,
        },
        spamming = 14,
      },
    }
  end)(),
}
