using Test

function mtxSum()
    println(max_sum_submatrix([1 1 1 ; 1 1 1 ; 1 1 1]))
    max_sum_submatrix([0 -1 ; -2 -3])
    max_sum_submatrix([-1 1 1 ; 1 -1 1 ; 1 1 -2])
    println("OK")
end

function max_sum_submatrix(matrix)

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

            println( view( matrix, r : r + (s-1), c : c + (s-1) ) )

        end

    end

end
