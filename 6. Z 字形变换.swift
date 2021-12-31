class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        
        var rowsArray = [String](repeating: "", count: min(numRows, s.count))
        
        var rowIndex = 0
        var directionIsDown = false
        
        for c in s {
            rowsArray[rowIndex].append(c)
            
            if rowIndex == numRows - 1 || rowIndex == 0 {
                directionIsDown = !directionIsDown
            }
            
            if directionIsDown {
                rowIndex += 1
            } else {
                rowIndex -= 1
            }
        }
        
        return rowsArray.joined()
    }
}
