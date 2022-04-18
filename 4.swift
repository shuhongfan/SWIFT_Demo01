// 编写一个求圆的面积的函数，并调用该函数求一个半径为10的圆的面积。

func area(r:Double)->Double{
    let PI:Double=3.1415926;
    return PI * r * r;
}

print(area(r:10));