class Person{
	}
var per1 = Person()
var per2 = Person()
let per3 = per1
let per4 = per2
if (per1 === per3){
    print("引用同一个实例")
}
if (per3 !== per4){
    print("引用不同的实例")
}
