class PersonInfo
{
    /**
     PersonInfi 是一个将外部文件中数据导入的类
     这个类初始化需要消耗不少时间
     */
    var personFileName = "personInfo.txt"
    //提供数据导入功能
}
class PersonDataManager
{
    lazy var personInfo = PersonInfo()
    var data = String()
    //提供数据管理功能
}
let manager = PersonDataManager()
manager.data+="some data "
manager.data += "Some more data"
print(manager.data)
print(manager.personInfo.personFileName)