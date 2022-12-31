package handler

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"log"
	"os"
)

func Avatar(c *gin.Context) {
	id := c.Param("id")
	_, err := os.Stat(fmt.Sprintf("./static/avatar/%s", id))
	if err != nil {
		c.File("./static/avatar/default.jpg")
		return
	}
	c.File(fmt.Sprintf("./static/avatar/%s", id))
}

func UploadAvatar(c *gin.Context) {
	id := c.Param("id")
	file, err := c.FormFile("newAvatar")
	if err != nil {
		log.Printf("Get Avatar from user: %s Failed: %v", id, err)
		return
	}
	err = c.SaveUploadedFile(file, fmt.Sprintf("./static/avatar/%s", id))
	if err != nil {
		log.Printf("Save Avatar file of user: %s Failed: %v", id, err)
		return
	}
	c.String(200, "Success")
}

func FriendCircleCover(c *gin.Context) {
	id := c.Param("id")
	_, err := os.Stat(fmt.Sprintf("./static/friendCircleCover/%s", id))
	if err != nil {
		c.File("./static/friendCircleCover/default.png")
		return
	}
	c.File(fmt.Sprintf("./static/friendCircleCover/%s", id))
}

func UploadFriendCircleCover(c *gin.Context) {
	id := c.Param("id")
	file, err := c.FormFile("newCover")
	if err != nil {
		log.Printf("Get Cover from user: %s Failed: %v", id, err)
		return
	}
	err = c.SaveUploadedFile(file, fmt.Sprintf("./static/friendCircleCover/%s", id))
	if err != nil {
		log.Printf("Save Cover file of user: %s Failed: %v", id, err)
		return
	}
	c.String(200, "Success")
}

func FriendCircle(c *gin.Context) {
	id := c.Query("id")
	index := c.Query("index")
	_, err := os.Stat(fmt.Sprintf("./static/friendCircle/%s-%s", id, index))
	if err != nil {
		c.File("./static/friendCircle/default.jpg")
		return
	}
	c.File(fmt.Sprintf("./static/friendCircle/%s-%s", id, index))
}

func UploadFriendCircle(c *gin.Context) {
	id := c.PostForm("id")
	index := c.PostForm("index")
	image, err := c.FormFile("image")
	if err != nil {
		log.Printf("Get FriendCircle(id: %s) image(index: %s) file failed: %s", id, index, err)
		return
	}
	err = c.SaveUploadedFile(image, fmt.Sprintf("./static/friendCircle/%s-%s", id, index))
	if err != nil {
		log.Printf("Save FriendCircle(id: %s) image(index: %s) file failed: %s", id, index, err)
		return
	}
	c.String(200, "Success")
}

func VideoThumbnail(c *gin.Context) {
	id := c.Param("messageId")
	_, err := os.Stat(fmt.Sprintf("./static/videoThumbnail/%s", id))
	if err != nil {
		c.File("./static/videoThumbnail/default.png")
		return
	}
	c.File(fmt.Sprintf("./static/videoThumbnail/%s", id))
}

func UploadVideoThumbnail(c *gin.Context) {
	id := c.PostForm("messageId")
	image, err := c.FormFile("thumbnail")
	if err != nil {
		log.Printf("Get Video Thumbnail(messageId: %s) image failed: %s", id, err)
		return
	}
	err = c.SaveUploadedFile(image, fmt.Sprintf("./static/videoThumbnail/%s", id))
	if err != nil {
		log.Printf("Save Video Thumbnail(messageId: %s) image failed: %s", id, err)
		return
	}
	c.String(200, "Success")
}

func File(c *gin.Context) {
	id := c.Param("messageId")
	for _, err := os.Stat(fmt.Sprintf("./static/file/%s", id)); err != nil; _, err = os.Stat(fmt.Sprintf("./static/file/%s", id)) {
	}
	c.File(fmt.Sprintf("./static/file/%s", id))
}

func UploadFile(c *gin.Context) {
	id := c.PostForm("messageId")
	file, err := c.FormFile("file")
	if err != nil {
		log.Printf("Get File(messageId: %s) Failed: %s", id, err)
		return
	}
	err = c.SaveUploadedFile(file, fmt.Sprintf("./static/file/%s", id))
	if err != nil {
		log.Printf("Save File(messageId: %s) Failed: %s", id, err)
		return
	}
	c.String(200, "Success")
}
