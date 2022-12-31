import "package:flutter/material.dart";
import "../Storage/LightChatSearchHistory.dart";
import "../CustomWidgets/LightChatSearchResult.dart";

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }

}

class _SearchPageState extends State<StatefulWidget> {
  static const _maxInvisibleWordLength = 8;
  late TextEditingController _inputBoxController;
  late FocusNode _inputBoxFocusNode;
  late List<String> _searchHistoryWords;
  late String _searchWord;

  @override
  void initState() {
    super.initState();
    _inputBoxController = TextEditingController();
    _inputBoxFocusNode = FocusNode();
    _searchHistoryWords = [];
    _searchWord = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
        ),
        title: Row(
          children: [
            Expanded(
                flex: 4,
                child: StatefulBuilder(builder: (context, childSetState) {
                  _inputBoxController.addListener(() {
                    childSetState(() {
                      _searchWord = _inputBoxController.text;
                    });
                  });
                  _inputBoxFocusNode.addListener(() {
                    setState(() {});
                  });

                  return TextField(
                    controller: _inputBoxController,
                    focusNode: _inputBoxFocusNode,
                    maxLength: 15,
                    autofocus: true,
                    decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: const Icon(Icons.search),
                      hintText: "搜索",
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: _searchWord.isNotEmpty ? IconButton(
                        onPressed: () {
                          _inputBoxController.clear();
                        },
                        icon: const Icon(Icons.cancel, color: Colors.grey),
                      ) : null,
                    ),
                  );
                },)
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                onPressed: () async {
                  if (_searchWord.isNotEmpty) {
                    // 搜索关键词 _searchWord
                    _inputBoxFocusNode.unfocus();

                    if (_searchHistoryWords.contains(_searchWord)) {
                      _searchHistoryWords.remove(_searchWord);
                    }
                    if (_searchHistoryWords.length >= 10) {
                      _searchHistoryWords =
                          _searchHistoryWords.getRange(0, 9).toList();
                    }
                    _searchHistoryWords.insert(0, _searchWord);
                    await setLightChatSearchHistory(_searchHistoryWords);
                    setState(() {});
                  }
                },
                child: const Text("搜索", style: TextStyle(letterSpacing: 1)),
              ),
            )
          ],
        ),
      ),
      body: (_inputBoxFocusNode.hasPrimaryFocus || _inputBoxController.text.isEmpty) ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.history),
                      Text("  最近搜索")
                    ],
                  ),
                  IconButton(
                    onPressed: () async {
                      await deleteLightChatSearchHistory();
                      setState(() {});
                    },
                    icon: const Icon(Icons.delete, color: Colors.grey),
                  )
                ],
              ),
              const Divider(),
              Expanded(
                  child: FutureBuilder(
                    future: getLightChatSearchHistory(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        _searchHistoryWords = snapshot.data ?? [];

                        return GridView.count(
                          padding: const EdgeInsets.only(left: 20),
                          childAspectRatio: 4/1,
                          crossAxisCount: 2,
                          children: _searchHistoryWords.map<Widget>((word) {
                            return TextButton(
                              onPressed: () async {
                                setState(() {
                                  _searchWord = word;
                                  if (_searchHistoryWords.contains(_searchWord)) {
                                    _searchHistoryWords.remove(_searchWord);
                                  }
                                  if (_searchHistoryWords.length >= 10) {
                                    _searchHistoryWords =
                                        _searchHistoryWords.getRange(0, 9).toList();
                                  }
                                  _searchHistoryWords.insert(0, _searchWord);
                                });
                                await setLightChatSearchHistory(_searchHistoryWords);
                                _inputBoxController.text = word;
                                _inputBoxFocusNode.unfocus();
                              },
                              child: Row(
                                children: [
                                  Text(word, overflow: TextOverflow.ellipsis),
                                  const Icon(Icons.navigate_next)
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      }
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 0.35*MediaQuery.of(context).size.width),
                        child: const AspectRatio(
                          aspectRatio: 1/1,
                          child: CircularProgressIndicator(
                            strokeWidth: 8,
                          ),
                        ),
                      );
                    },
                  )
              )
            ],
          )
      ) : LightChatSearchResult(key: UniqueKey(), searchWord: _searchWord)
    );
  }

}