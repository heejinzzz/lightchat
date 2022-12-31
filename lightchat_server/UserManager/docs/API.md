# LightChat - UserManager API List

---

### getUserInfoById
根据用户Id获取用户信息。

* 请求参数：getUserInfoByIdRequest

| 字段名 |   类型   |  说明  |
|:---:|:------:|:----:|
| id  | string | 用户id |

* 返回参数：getUserInfoByIdResponse

|  字段名   |   类型   |   说明    |
|:------:|:------:|:-------:|
| exist  |  bool  | 此用户是否存在 |
|  name  | string |   用户名   |
| gender | Gender |  用户性别   |

---

### getUserInfoByNumber
根据用户手机号获取用户信息。

* 请求参数：getUserInfoByNumberRequest

|  字段名   |   类型   |  说明   |
|:------:|:------:|:-----:|
| number | string | 用户手机号 |


* 返回参数：getUserInfoByNumberResponse

|  字段名   |   类型   |   说明    |
|:------:|:------:|:-------:|
| exist  |  bool  | 此用户是否存在 |
|   id   | string |  用户id   |
|  name  | string |   用户名   |
| gender | Gender |  用户性别   |

---

### loginWithPassword
用户通过手机号和密码申请登录。

* 请求参数：loginWithPasswordRequest

|   字段名    |   类型   |   说明   |
|:--------:|:------:|:------:|
|  number  | string | 用户手机号  |
| password | string | 用户登录密码 |

* 返回参数：loginWithPasswordResponse

|   字段名   |   类型   |    说明    |
|:-------:|:------:|:--------:|
| succeed |  bool  | 用户登录是否成功 |
|   id    | string |   用户id   |

---

### loginWithSMS
用户通过手机号和验证码登录。

* 请求参数：loginWithSMSRequest

|  字段名   |   类型   |  说明   |
|:------:|:------:|:-----:|
| number | string | 用户手机号 |

* 返回参数：loginWithSMSResponse

|   字段名   |   类型   |    说明    |
|:-------:|:------:|:--------:|
| succeed |  bool  | 用户登录是否成功 |
|   id    | string |   用户id   |

---

### changeUserName
修改用户昵称。

* 请求参数：changeUserNameRequest

|   字段名   |   类型   |  说明  |
|:-------:|:------:|:----:|
|   id    | string | 用户id |
| newName | string | 新昵称  |

* 返回参数：changeUserNameResponse

|   字段名   |  类型  |   说明   |
|:-------:|:----:|:------:|
| succeed | bool | 是否修改成功 |

---

### changeUserGender
修改用户性别。

* 请求参数：changeUserGenderRequest

|    字段名    |   类型   |  说明  |
|:---------:|:------:|:----:|
|    id     | string | 用户id |
| newGender | Gender | 新性别  |

* 返回参数：changeUserGenderResponse

|   字段名   |  类型  |   说明   |
|:-------:|:----:|:------:|
| succeed | bool | 是否修改成功 |

---

### register
注册新用户。

* 请求参数：registerRequest

|   字段名    |   类型   |   说明   |
|:--------:|:------:|:------:|
|  number  | string | 用户手机号  |
| password | string | 用户登录密码 |
|   name   | string |  用户昵称  |
|    id    | string |  用户id  |
|  gender  | Gender |  用户性别  |

* 返回参数：registerResponse

|     字段名     |  类型  |       说明       |
|:-----------:|:----:|:--------------:|
|   idCheck   | bool |   用户id是否已被占用   |
| numberCheck | bool | 用户手机号是否可以注册新账号 |

---

### requestSMS
请求发送短信验证码。

* 请求参数：requestSMSRequest

|  字段名   |   类型    |     说明      |
|:------:|:-------:|:-----------:|
| number | string  | 要发送短信的目标手机号 |
|  type  | SMSType |  要发送的短信类型   |

* 返回参数：requestSMSResponse

|     字段名      |   类型   |    说明    |
|:------------:|:------:|:--------:|
|     code     | string |  发送的验证码  |
| validMinutes | int32  | 验证码有效的时间 |

