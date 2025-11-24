require("full-border"):setup {
	type = ui.Border.ROUNDED,
}

function Header:render(area)
	return {}
end

function Parent:render(area)
	return {
		ui.List(self._folder.window, self._folder:layout())
			:area(area)
			:style(ui.Style():fg("#9D949F")),
	}
end
