package main

import (
	"lightchat_server/ChatManager/ChatStream"
	"lightchat_server/ChatManager/MessageManager"
	"sync"
)

func main() {
	wg := &sync.WaitGroup{}
	wg.Add(1) // MessageManager、ChatStream 中只要有一个启动失败，就结束整个程序
	go ChatStream.RunChatStream(wg)
	go MessageManager.RunMessageManager(wg)
	wg.Wait()
}
