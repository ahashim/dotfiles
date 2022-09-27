local status, icons = pcall(require, "nvim-web-devicons")
if not status then
    return
end

icons.setup {
    default = true,
    override = {
        default_icon = {
            icon = "",
            name = "Default",
        },

        c = {
            color = "#4FA6ED",
            icon = "",
            name = "c",
        },

        css = {
            color = "#4FA6ED",
            icon = "",
            name = "css",
        },

        deb = {
            color = "#8B3434",
            icon = "",
            name = "deb",
        },

        Dockerfile = {
            color = "#48B0BD",
            icon = "",
            name = "Dockerfile",
        },

        html = {
            color = "#CC9057",
            icon = "",
            name = "html",
        },

        jpeg = {
            color = "#BF68D9",
            icon = "",
            name = "jpeg",
        },

        jpg = {
            color = "#BF68D9",
            icon = "",
            name = "jpg",
        },

        js = {
            color = "#E2B86B",
            icon = "",
            name = "js",
        },

        lock = {
            color = "#E55561",
            icon = "",
            name = "lock",
        },

        lua = {
            color = "#4FA6ED",
            icon = "",
            name = "lua",
        },

        mp3 = {
            color = "#BF68D9",
            icon = "",
            name = "mp3",
        },

        mp4 = {
            color = "#4FA6ED",
            icon = "",
            name = "mp4",
        },

        out = {
            color = "#A0A8B7",
            icon = "",
            name = "out",
        },

        png = {
            color = "#BF68D9",
            icon = "",
            name = "png",
        },

        py = {
            color = "#8EBD6B",
            icon = "",
            name = "py",
        },

        ["robots.txt"] = {
            color = "#A0A8B7",
            icon = "ﮧ",
            name = "robots",
        },

        ts = {
            color = "#4FA6ED",
            icon = "ﯤ",
            name = "ts",
        },

        ttf = {
            color = "#A0A8B7",
            icon = "",
            name = "TrueTypeFont",
        },

        rb = {
            color = "#E55561",
            icon = "",
            name = "rb",
        },

        rpm = {
            color = "#CC9057",
            icon = "",
            name = "rpm",
        },

        vue = {
            color = "#8EBD6B",
            icon = "﵂",
            name = "vue",
        },

        woff = {
            color = "#A0A8B7",
            icon = "",
            name = "WebOpenFontFormat",
        },

        woff2 = {
            color = "#A0A8B7",
            icon = "",
            name = "WebOpenFontFormat2",
        },

        xz = {
            color = "#CC9057",
            icon = "",
            name = "xz",
        },

        zip = {
            color = "#CC9057",
            icon = "",
            name = "zip",
        },
    },
}
