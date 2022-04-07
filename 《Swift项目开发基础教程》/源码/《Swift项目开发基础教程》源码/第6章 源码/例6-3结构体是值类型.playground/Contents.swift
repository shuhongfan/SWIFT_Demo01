//先定义一个结构体StudentInfo
struct StudentInfo
{
	      var name: String
	      var age: Int
	      func showStudentInfo() ->Void
	      {
	          print("姓名：\(name)---年龄：\(age)")
	      }
	 }
// 实例化StudentInfo结构体
var stu1 = StudentInfo(name: "张三", age: 17)
var stu2 = stu1
stu1.showStudentInfo()
stu2.showStudentInfo()

