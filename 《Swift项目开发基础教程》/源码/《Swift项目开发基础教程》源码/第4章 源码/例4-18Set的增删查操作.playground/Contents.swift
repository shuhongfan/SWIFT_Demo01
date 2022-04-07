var favoriteColors:Set = ["红色","绿色","蓝色"]
//1.添加
favoriteColors.insert("黄色")
print(favoriteColors)
//2.删除
if let removeGreen = favoriteColors.remove("绿色"){
    print("我已经不喜欢\(removeGreen)了")
} else {
    print("我从来没喜欢过这个颜色")
}
//3.查找
if favoriteColors.contains("黑色"){
    print("好吧，我还喜欢这个颜色")
} else {
    print("黑色太沉重了，不是我的菜")
}
//4.删除所有
favoriteColors.removeAll()
print(favoriteColors)
