import Foundation

func solution(_ dots:[[Int]]) -> Int {
    var dots = dots
    var width: Int = 0
    var height: Int = 0
    
    let basisDot = dots.removeFirst()
    
    for dot in dots {
        if dot[0] == basisDot[0] {
            height = abs(dot[1] - basisDot[1])
        } else if dot[1] == basisDot[1] {
            width = abs(dot[0] - basisDot[0])
        }
    }

    return width * height
}
