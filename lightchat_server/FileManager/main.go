package main

import (
	"github.com/gin-gonic/gin"
	"lightchat_server/FileManager/handler"
)

var ServerAddr = ":7061"

func main() {
	r := gin.Default()

	r.GET("/avatar/:id", handler.Avatar)
	r.POST("/uploadAvatar/:id", handler.UploadAvatar)

	r.GET("/friendCircleCover/:id", handler.FriendCircleCover)
	r.POST("/uploadFriendCircleCover/:id", handler.UploadFriendCircleCover)

	r.GET("/friendCircle", handler.FriendCircle)
	r.POST("/uploadFriendCircle", handler.UploadFriendCircle)

	r.GET("/videoThumbnail/:messageId", handler.VideoThumbnail)
	r.POST("/uploadVideoThumbnail", handler.UploadVideoThumbnail)

	r.GET("/file/:messageId", handler.File)
	r.POST("/uploadFile", handler.UploadFile)

	r.Run(ServerAddr)
}
