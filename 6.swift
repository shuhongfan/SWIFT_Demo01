var array=[20,36,6,5,7]

let intCmp={
    (a:Int,b:Int)->Int in
    if a>b {
        return -1
    } else if(a<b){
        return 1
    } else {
        return 0
    }
}


func bubbleSort(inout array:[Int],cmp:(Int,Int)->Int) {
    let cnt = array.count
    for i in 1..<cnt {
        for j in 0..<cnt-1{
            if(cmp(array[j],array[j+1]) == -1){
                let t=array[j]
                array[j]=array[j+1]
                array[j+1]=t
            }
        }
    }
}


bubbleSort(&array,cmp:intCmp)

print(array)
