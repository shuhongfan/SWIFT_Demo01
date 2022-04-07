protocol GetFile {
    func take()->String
}
class Assistant:GetFile{
    func take() -> String {
        return "助理给老板拿文件！"
    }
}
class Boss {
    var delegate:GetFile
    init(man:GetFile) {
        delegate = man
    }
    func take()->String {
        return delegate.take()
    }
}
let assistant = Assistant()
let boss = Boss(man: assistant)
print(boss.take())

