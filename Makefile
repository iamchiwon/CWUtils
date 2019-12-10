all: update lint trunk
lint:
	bundle exec pod spec lint CWUtils.podspec --allow-warnings
trunk:
	bundle exec pod trunk push CWUtils.podspec --allow-warnings
update: 
	bundle update cocoapods
