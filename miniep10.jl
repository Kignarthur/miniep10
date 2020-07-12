function mtxSum()
    max_sum_submatrix([])
    max_sum_submatrix([0])
    max_sum_submatrix([0 -1 ; -2 -3])
    max_sum_submatrix([100 -100 ; 100 -100])
    max_sum_submatrix([1 1 1 ; 1 1 1 ; 1 1 1])
    max_sum_submatrix([0 0 0 ; 0 0 0 ; 0 0 0])
    max_sum_submatrix([1 2 3 ; 4 5 6 ; 7 8 9])
    max_sum_submatrix([1 0 1 ; 0 -1 0 ; 1 -1 1])
    max_sum_submatrix([-1 1 1 ; 1 -1 1 ; 1 1 -2])
    max_sum_submatrix([-1 -1 -1 ; -1 -1 -1 ; -1 -1 -1])
    println("OK")
end

#Add decent tests

function max_sum_submatrix(matrix)

    println()

    if length(matrix) < 2
        return println(matrix)
    end

    matrixSize = size(matrix,1)

    maxSum = -Inf
    Rows = [1]
    Columns = [1]
    SubMatrix = [1]

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

                    Rows[1] = row
                    Columns[1] = column
                    SubMatrix[1] = subMatrixSize
                    maxSum = sum

                elseif sum == maxSum

                    push!(Rows,row)
                    push!(Columns,column)
                    push!(SubMatrix, subMatrixSize)

                end

            end

        end

    end

    for index in 1 : length(Rows)

        sum = 0

        r = Rows[index]
        c = Columns[index]
        s = SubMatrix[index]

        for row in r : r + ( s - 1 )

            for column in c : c + ( s - 1 )

                sum += matrix[row,column]

            end

        end

        if sum == maxSum

            println(view( matrix, r : r + (s-1), c : c + (s-1) )) 

        end

    end

end

mtxSum()
