module VecDrawer
using Plots

    function plotvec(x::Vector, y::Vector)
        plot!([x[1], y[1]], [x[2], y[2]], arrow=true, legend=false)
    end
    
    function plotvec(x::Vector)
        plot!([0, x[1]], [0, x[2]], arrow=true, legend=false)
    end

    function plotvec3d(x::Vector)
        plot3d!([0, x[1]], [0, x[2]], [0, x[3]], legend=false)
    end

    function plotvec3d(x::Vector, y::Vector)
        plot3d!([x[1], y[1]], [x[2], y[2]], [x[3], y[3]], legend=false)
    end
    function refreshplot()
        plot(xlims=(-2, 2), ylims=(-2, 2), zlims=(0, 4))
    end

    export plotvec, plotvec3d, refreshplot
end