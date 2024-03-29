helm:
	helm upgrade --install blue-green ./blue-green

clean:
	helm uninstall blue-green
