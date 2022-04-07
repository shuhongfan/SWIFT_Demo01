let hasStudentCard = true
let hasTeacherCard = false
let isTeacher = false
let isStudent = true
if hasStudentCard && isStudent || hasTeacherCard && isTeacher {
    print("学生或者老师都可以参加活动")
} else {
    print("您没有权限参加活动")
}
