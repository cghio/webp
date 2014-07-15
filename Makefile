download:
	curl -Ls "https://webp.googlecode.com/files/libwebp-0.4.0-mac-10.8.tar.gz" | tar xfvz -
	curl -Ls "https://webp.googlecode.com/files/libwebp-0.4.0-linux-x86-64.tar.gz" | tar xfvz -
	curl -Ls "https://webp.googlecode.com/files/libwebp-0.4.0-linux-x86-32.tar.gz" | tar xfvz -
	curl -LsO "https://webp.googlecode.com/files/libwebp-0.4.0-windows-x64.zip"
	unzip libwebp-0.4.0-windows-x64.zip
	rm -f libwebp-0.4.0-windows-x64.zip
	curl -LsO "https://webp.googlecode.com/files/libwebp-0.4.0-windows-x86.zip"
	unzip libwebp-0.4.0-windows-x86.zip
	rm -f libwebp-0.4.0-windows-x86.zip
