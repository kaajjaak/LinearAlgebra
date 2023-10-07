import Pkg
Pkg.add("Plots")
Pkg.add("LinearAlgebra")

include("VecDrawer.jl")
using ..VecDrawer
using LinearAlgebra
using Plots

function cube(angle=0)
    refreshplot()

    # transformation matrices
    T1 = [0 1 0; 1 0 0; 0 0 0]
    T2 = [1 0 0; 0 0 -1; 0 1 0]

    # rotation vector
    R = [1 0 0; 0 cos(angle) -sin(angle); 0 sin(angle) cos(angle)]

    # base vector we start from
    BASEVEC = R * [0, 1, 0]
    plotvec3d(BASEVEC)

    # other cube edges with (0,0,0)
    front_bottom = [norm(BASEVEC), 0 , 0]
    front_left = T2 * BASEVEC
    plotvec3d(front_bottom)
    plotvec3d(front_left)

    # cube edges with origin (0,0,1)
    left_top = front_left + BASEVEC
    front_top = front_left + front_bottom
    plotvec3d(front_left, left_top)
    plotvec3d(front_left, front_top)

    # cube edges with origin (1,0,1)
    front_right = front_top - front_left
    right_top = front_top + BASEVEC
    plotvec3d(front_top, front_right)
    plotvec3d(front_top, right_top)

    # cube edges with origin (1,1,1)
    right_right = right_top - front_left
    back_top = left_top + front_bottom
    plotvec3d(right_top, right_right)
    plotvec3d(left_top, back_top)

    # cube edges with origin (1,1,0)
    back_bottom = BASEVEC + front_bottom
    left_bottom = front_right + BASEVEC
    plotvec3d(BASEVEC, back_bottom)
    plotvec3d(front_right, left_bottom)

    # cube edge with origin (0,1,0)
    left_left = BASEVEC + front_left
    plotvec3d(BASEVEC, left_left)
end

@gif for i in 1:90
    cube(deg2rad(i))
end