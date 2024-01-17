////
////  재귀함수가 무엇인가요?.swift
////  AlgorithmEx
////
////  Created by Sooik Kim on 1/17/24.
////
//
//import Foundation
//
//let counts = Int(readLine()!)!
//
//print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")
//
//let question = """
//"재귀함수가 뭔가요?"
//"""
//let answer1 = """
//"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.
//"""
//let answer2 = """
//마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.
//"""
//
//let answer3 = """
//그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어."
//"""
//
//let answer4 = """
//"재귀함수는 자기 자신을 호출하는 함수라네"
//"""
//
//let answer = """
//라고 답변하였지.
//"""
//
//var count = 0
//recursion(&count, prefix: "")
//
//func recursion(_ count: inout Int, prefix:String) {
//    var prefix = prefix
//    print(prefix + question)
//    if count == counts {
//        print(prefix + answer4)
//    } else {
//        print(prefix + answer1)
//        print(prefix + answer2)
//        print(prefix + answer3)
//    }
//    
//    count += 1
//    let originalPrefix = prefix
//    prefix += "____"
//    
//    if count <= counts {
//        recursion(&count, prefix: prefix)
//    }
//    print(originalPrefix + answer)
//}
