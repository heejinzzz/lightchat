docker rmi heejinzzz/lightchat-usermanager:v1.0.0 $1> /dev/null 2>&1
docker rmi heejinzzz/lightchat-filemanager:v1.0.0 $1> /dev/null 2>&1
docker rmi heejinzzz/lightchat-friendmanager:v1.0.0 $1> /dev/null 2>&1
docker rmi heejinzzz/lightchat-friendcirclemanager:v1.0.0 $1> /dev/null 2>&1
docker rmi heejinzzz/lightchat-chatmanager:v1.0.0 $1> /dev/null 2>&1

cd UserManager || exit 1
if ! docker build -t heejinzzz/lightchat-usermanager:v1.0.0 .; then
  echo "Failed to build image heejinzzz/lightchat-usermanager:v1.0.0"
  echo "Deploy LightChat Failed"
  exit 1
fi
cd ..
cd FileManager || exit 1
if ! docker build -t heejinzzz/lightchat-filemanager:v1.0.0 .; then
  echo "Failed to build image heejinzzz/lightchat-filemanager:v1.0.0"
  echo "Deploy LightChat Failed"
  exit 1
fi
cd ..
cd FriendManager || exit 1
if ! docker build -t heejinzzz/lightchat-friendmanager:v1.0.0 .; then
  echo "Failed to build image heejinzzz/lightchat-friendmanager:v1.0.0"
  echo "Deploy LightChat Failed"
  exit 1
fi
cd ..
cd FriendCircleManager || exit 1
if ! docker build -t heejinzzz/lightchat-friendcirclemanager:v1.0.0 .; then
  echo "Failed to build image heejinzzz/lightchat-friendcirclemanager:v1.0.0"
  echo "Deploy LightChat Failed"
  exit 1
fi
cd ..
cd ChatManager || exit 1
if ! docker build -t heejinzzz/lightchat-chatmanager:v1.0.0 .; then
  echo "Failed to build image heejinzzz/lightchat-chatmanager:v1.0.0"
  echo "Deploy LightChat Failed"
  exit 1
fi
cd ..

if ! mkdir -p ./data/FileManager; then
  echo "Failed to create data directory"
  echo "Deploy LightChat Failed"
  exit 1
fi
if ! cp -r FileManager/static ./data/FileManager; then
  echo "Failed to copy FileManager static files into data directory"
  echo "Deploy LightChat Failed"
  exit 1
fi
if ! docker compose up -d; then
  echo "Failed to run docker containers"
  echo "Deploy LightChat Failed"
  exit 1
fi
echo "Deploy LightChat Success"