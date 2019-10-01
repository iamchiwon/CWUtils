all: update lint trunk
lint:
	bundle exec pod spec lint CWUtils.podspec
trunk:
	bundle exec pod trunk push CWUtils.podspec
update: 
	bundle update cocoapods
