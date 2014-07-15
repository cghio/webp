download:
	curl -Ls "https://webp.googlecode.com/files/libwebp-0.4.0-mac-10.8.tar.gz" | tar xfvz -
	curl -Ls "https://webp.googlecode.com/files/libwebp-0.4.0-mac-10.7.tar.gz" | tar xfvz -
	curl -Ls "https://webp.googlecode.com/files/libwebp-0.4.0-linux-x86-64.tar.gz" | tar xfvz -
	curl -Ls "https://webp.googlecode.com/files/libwebp-0.4.0-linux-x86-32.tar.gz" | tar xfvz -
	curl -LsO "https://webp.googlecode.com/files/libwebp-0.4.0-windows-x64.zip"
	unzip -o libwebp-0.4.0-windows-x64.zip
	rm -f libwebp-0.4.0-windows-x64.zip
	curl -LsO "https://webp.googlecode.com/files/libwebp-0.4.0-windows-x86.zip"
	unzip -o libwebp-0.4.0-windows-x86.zip
	rm -f libwebp-0.4.0-windows-x86.zip
	curl -LsO "https://webp.googlecode.com/files/libwebp-0.4.0-windows-x86-no-wic.zip"
	unzip -o libwebp-0.4.0-windows-x86-no-wic.zip
	rm -f libwebp-0.4.0-windows-x86-no-wic.zip
	curl -LsO "https://webp.googlecode.com/files/libwebp-0.4.0-windows-x64-no-wic.zip"
	unzip -o libwebp-0.4.0-windows-x64-no-wic.zip
	rm -f libwebp-0.4.0-windows-x64-no-wic.zip
	curl -Ls "https://webp.googlecode.com/files/webpiosapp-0.4.0.tar.gz" | tar xfvz -
	rm -f ._webpiosapp-0.4.0
