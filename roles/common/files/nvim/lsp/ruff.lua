return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = {
		".git",
		"Pipfile",
		"pyproject.toml",
		"pyrightconfig.json",
		"requirements.txt",
		"setup.cfg",
		"setup.py",
	},
	single_file_support = true,
}
