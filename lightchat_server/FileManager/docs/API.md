# LightChat - FileManager API List

---

### /avatar/:id
获取用户的头像图片。

* Method：GET


* 请求参数：

| 字段名 |   类型   | 必选  |  说明  |
|:---:|:------:|:---:|:----:|
| id  | string |  是  | 用户id |

* 返回参数：用户头像图片文件

---

### /uploadAvatar/:id
上传用户的头像图片。

* Method：POST


* 请求参数：

|    字段名    |      类型       | 必选  |    说明    |
|:---------:|:-------------:|:---:|:--------:|
|    id     |    string     |  是  |   用户id   |
| newAvatar | MultipartFile |  是  | 用户头像图片文件 |

* 返回参数：无

---

### /friendCircleCover/:id
获取用户的朋友圈封面图片。

* Method：GET


* 请求参数：

| 字段名 |   类型   | 必选  |  说明  |
|:---:|:------:|:---:|:----:|
| id  | string |  是  | 用户id |

* 返回参数：朋友圈封面图片文件

---

### /uploadFriendCircleCover/:id
上传用户的朋友圈封面图片。

* Method：POST


* 请求参数：

|   字段名    |      类型       | 必选  |     说明      |
|:--------:|:-------------:|:---:|:-----------:|
|    id    |    string     |  是  |    用户id     |
| newCover | MultipartFile |  是  | 用户朋友圈封面图片文件 |

* 返回参数：无

---

### /friendCircle
获取朋友圈内容图片。

* Method：GET


* 请求参数：

|  字段名  | 类型  | 必选  |        说明         |
|:-----:|:---:|:---:|:-----------------:|
|  id   | int |  是  |       朋友圈id       |
| index | int |  是  | 该图片在该朋友圈的所有图片中的序号 |

* 返回参数：朋友圈内容图片文件。

---

### /uploadFriendCircle
上传朋友圈内容图片。

* Method：POST


* 请求参数：

|  字段名  |      类型       | 必选  |        说明         |
|:-----:|:-------------:|:---:|:-----------------:|
|  id   |      int      |  是  |       朋友圈id       |
| index |      int      |  是  | 该图片在该朋友圈的所有图片中的序号 |
| image | MultipartFile |  是  |     朋友圈内容图片文件     |

* 返回参数：无

---

### /videoThumbnail/:messageId
获取视频缩略图。

* Method：GET


* 请求参数：

|    字段名    |   类型   | 必选  |     说明     |
|:---------:|:------:|:---:|:----------:|
| messageID | string |  是  | 该视频对应的消息id |

* 返回参数：视频缩略图文件

---

### /uploadVideoThumbnail
上传视频缩略图。

* Method：POST


* 请求参数：

|    字段名    |      类型       | 必选  |     说明     |
|:---------:|:-------------:|:---:|:----------:|
| messageId |    string     |  是  | 该视频对应的消息id |
| thumbnail | MultipartFile |  是  |  视频缩略图文件   |

* 返回参数：无

---

### /file/:messageId
获取文件。

* Method：GET


* 请求参数：

|    字段名    |   类型   | 必选  |     说明     |
|:---------:|:------:|:---:|:----------:|
| messageID | string |  是  | 该文件对应的消息id |

* 返回参数：文件

---

### /uploadFile
上传文件。

* Method：POST


* 请求参数：

|    字段名    |      类型       | 必选  |     说明     |
|:---------:|:-------------:|:---:|:----------:|
| messageId |    string     |  是  | 该文件对应的消息id |
|   file    | MultipartFile |  是  |     文件     |

* 返回参数：无