serve:
	if which plackup >/dev/null; then \
		plackup -MPlack::App::Directory -e 'Plack::App::Directory->new->to_app' -l localhost:12345; \
	elif which python2.7 >/dev/null; then \
		python2.7 -m SimpleHTTPServer 12345; \
	fi
