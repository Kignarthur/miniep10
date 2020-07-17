function mtxSum()
    println()
    max_sum_submatrix([]);println()
    max_sum_submatrix([0]);println()
    max_sum_submatrix([0 -1 ; -2 -3]);println()
    max_sum_submatrix([100 -100 ; 100 -100]);println()
    max_sum_submatrix([1 1 1 ; 1 1 1 ; 1 1 1]);println()
    max_sum_submatrix([0 0 0 ; 0 0 0 ; 0 0 0]);println()
    max_sum_submatrix([1 2 3 ; 4 5 6 ; 7 8 9]);println()
    max_sum_submatrix([1 0 1 ; 0 -1 0 ; 1 -1 1]);println()
    max_sum_submatrix([1 -3 -1 ; -1 0 1 ; 1 -3 -1]);println()
    max_sum_submatrix([-1 -1 -1 ; -1 -1 -1 ; -1 -1 -1]);println()
    max_sum_submatrix([1 -2 1 ; 2 -1 2 ; 1 -2 1]);println()
    max_sum_submatrix([0 0 0 0 ; 0 0 0 0 ; 0 0 0 0; 0 0 0 0]);println()
    max_sum_submatrix([3 1 4 1 ; 5 9 2 6 ; 5 3 5 8; 9 7 9 3]);println()
    println("END")
end

function max_sum_submatrix(matrix)

    if length(matrix) < 2
        println(matrix)
        return
    end

    matrixSize = size(matrix,1)

    maxSum = -Inf
    SumArr = [1]
    RowsArr = [1]
    ColumnsArr = [1]
    SubMatrixArr = [1]

    for subMatrixSize in 1 : matrixSize

        for row in 1 : matrixSize - (subMatrixSize - 1)

            for column in 1 : matrixSize - (subMatrixSize - 1)

                sum = 0

                for subRow in 0 : subMatrixSize - 1

                    for subColumn in 0 : subMatrixSize - 1

                        sum += matrix[row + subRow , column + subColumn]

                    end

                end

                if sum > maxSum

                    SumArr[1] = sum
                    RowsArr[1] = row
                    ColumnsArr[1] = column
                    SubMatrixArr[1] = subMatrixSize
                    maxSum = sum

                elseif sum == maxSum

                    push!(SumArr,sum)
                    push!(RowsArr,row)
                    push!(ColumnsArr,column)
                    push!(SubMatrixArr, subMatrixSize)

                end

            end

        end

    end

    for index in 1 : length(RowsArr)

        r = RowsArr[index]
        c = ColumnsArr[index]
        s = SubMatrixArr[index]

        if SumArr[index] == maxSum

            println(view( matrix, r : r + (s-1), c : c + (s-1) )) 

        end

    end

    return

end

mtxSum()
