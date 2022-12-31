if ! docker compose rm -fs; then
  echo "Failed to remove docker containers"
  echo "Undeploy LightChat Failed"
  exit 1
fi
rm -rf ./data $1> /dev/null 2>&1
docker rmi heejinzzz/lightchat-usermanager:v1.0.0 $1> /dev/null 2>&1
docker rmi heejinzzz/lightchat-filemanager:v1.0.0 $1> /dev/null 2>&1
docker rmi heejinzzz/lightchat-friendmanager:v1.0.0 $1> /dev/null 2>&1
docker rmi heejinzzz/lightchat-friendcirclemanager:v1.0.0 $1> /dev/null 2>&1
docker rmi heejinzzz/lightchat-chatmanager:v1.0.0 $1> /dev/null 2>&1
echo "Undeploy LightChat Success"