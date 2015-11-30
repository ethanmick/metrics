#
# The Make File
# This gives you simple and fast commands to launch your project.
# It also allows new comers to get involved super easily.
#

run:
	HTTP_PORT=4748 \
	HTTP_HOST='0.0.0.0' \
	node coffee_bridge.js

