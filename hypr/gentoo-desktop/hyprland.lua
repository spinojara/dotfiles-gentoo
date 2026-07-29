require("common")

m1 = "desc:Microstep MAG274QRF-QD CA8A272600215"
m2 = "desc:Ancor Communications Inc VG248 FBLMQS053222"

hl.monitor({
	output = m1,
	mode = "2560x1440@165",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = m2,
	mode = "1920x1080@144",
	position = "2560x180",
	scale = 1,
})

add_workspaces({
	{ "1", m1, true },
	{ "2", m1, false },
	{ "3", m1, false },
	{ "4", m1, false },
	{ "5", m1, false },
	{ "6", m1, false },
	{ "7", m1, false },
	{ "8", m1, false },
	{ "9", m1, false },
	{ "q", m2, true },
	{ "w", m2, false },
	{ "e", m2, false },
	{ "r", m2, false },
	{ "t", m2, false },
})

hl.on("hyprland.start", function ()
	hl.dsp.cursor.move({ x = 1280, y = 720 })
	hl.exec_cmd("gentoo-pipewire-launcher")
end)

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.bind("ALT + SHIFT + p", hl.dsp.exec_cmd("systemctl poweroff"), { long_press = true })
hl.bind("ALT + SHIFT + o", hl.dsp.exec_cmd("systemctl poweroff"), { long_press = true })

hl.window_rule({
	match = {
		class = "(i?)firefox.*",
		workspace = "r[1-9]w[v2-100]",
	},
	workspace = "name:q silent",
})
