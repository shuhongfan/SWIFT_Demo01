// 1.创建一个数组
let docFolder = ["java.docx", "JavaBean.docx", "Objective-C.xlsx", "Swift.docx"]
// 2.定义一个变量, 用于统计docx文档的个数
var wordDocCount = 0
// 3.遍历数组
for doc in docFolder {
    // 3.1如果后缀为“.docx”，wordDocCount加1
    if doc.hasSuffix(".docx") {
        wordDocCount += 1
    }
}
print("Word文档的个数为：\(wordDocCount)")
// 4.定义一个变量, 用于统计关于java文档的个数
var javaDocCount = 0
// 5.遍历数组
for doc in docFolder {
    // 5.1转换为小写
    let lowercaseStr = doc.lowercased()
    // 5.2如果前缀为“java”，javaDocCount加1
    if lowercaseStr.hasPrefix("java") {
        javaDocCount += 1
    }
}
print("java相关文档的个数为：\(javaDocCount)")


