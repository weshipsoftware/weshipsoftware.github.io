function storeColorScheme() {
	localStorage.setItem('colorScheme', document.documentElement.style.colorScheme)
}

function toggleTheme() {
	document.documentElement.style.colorScheme = 
		document.documentElement.style.colorScheme === 'dark' ? 'light' : 'dark'
	storeColorScheme()
}

window.matchMedia('(prefers-color-scheme: dark)')
	.addEventListener('change', function(e)
{
	document.documentElement.style.colorScheme = e.matches ? 'dark' : 'light'
	storeColorScheme()
})
