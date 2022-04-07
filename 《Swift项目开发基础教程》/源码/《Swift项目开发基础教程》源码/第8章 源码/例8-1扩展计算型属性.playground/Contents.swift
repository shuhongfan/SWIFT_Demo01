extension Double {
    // 计算型属性km表示长度单位千米
    var km: Double { return self * 1_000.0 }
    // 计算型属性m表示长度单位米
    var m : Double { return self }
    // 计算型属性cm表示长度单位厘米
    var cm: Double { return self / 100.0 }
    // 计算型属性mm表示长度单位毫米
    var mm: Double { return self / 1_000.0 }
}
// 定义一个常量onekilometer保存换算后的值
let onekilometer = 1.km
print("一公里等于 \(onekilometer) 米")
// 定义一个常量tenmillimeter保存换算后的值
let tenmillimeter = 10.mm
print("10毫米等于 \(tenmillimeter) 米")
// 通过扩展实现长度单位的计算
let aMarathon = 42.km + 195.m
print("马拉松的长度是 \(aMarathon) 米")

