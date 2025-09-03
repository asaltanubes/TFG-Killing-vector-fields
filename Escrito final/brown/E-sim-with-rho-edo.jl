# import Plots
using CairoMakie
using LaTeXStrings
using Interpolations: linear_interpolation
include("../plotheme.jl")
# Plots.pythonplot()
# Plots.gr()


setprecision(800)
FloatType=Float64

function RK45(f::Function, tt::Vector{T}, y0::T) where T
    steps = length(tt)-1
    yy = zeros(T, steps+1)

    yy[1]  = y0

    h = tt[2]-tt[1]

    for i in range(1, steps)
        k1 = h*f(tt[i],     yy[i])
        k2 = h*f(tt[i]+h/3,  yy[i]+k1/3)
        k3 = h*f(tt[i]+2h/3, yy[i]-k1/3+k2)
        k4 = h*f(tt[i]+h,   yy[i]+k1-k2+k3)

        yy[i+1] = yy[i] + (k1+3k2+3k3+k4)/8
    end

    return yy
end

V(T)    = -T^2/2 + T^4/4 + .5
Vdot(T) = -T + T^3



function edo(t, x)
    if x < 0
        (Vdot(t)/V(t) + 18*sqrt.(-3x)).*(1 + x) 
    else
        println("Error at t = $t, with value: $x")
        return -100
    end

end

function integrate(tt::Vector{FloatType}, xx::Vector{FloatType})
    integ = similar(xx)

    integ[1] = 0.
    Δt = tt[2]-tt[1]
    for i in 2:length(integ)
        integ[i] = (xx[i]+xx[i-1])/2 *Δt + integ[i-1]
    end
    return integ
end

function edo_rho(uuv)
    global tt
    uut = linear_interpolation(tt, uuv)
    function inner(t, x)
        sut = √-uut(t)
        return x*(-Vdot(t)/V(t) - 18√3*(sut - 1/(2sut)))
    end
end


 
t₀ = FloatType(0.0)
tf = FloatType(1.0)

sim_points=100_000
R = 1
lₚ = 1



tt = Vector(range(t₀, tf, sim_points))
Δt = tt[2]-tt[1] 

u₀ = FloatType(-.999)
E₀ = 1.
println("mex")
uu_mex = RK45(edo, tt, u₀)

ρ_mex = exp.(-integrate(tt, @. Vdot(tt)/V(tt) + 18√3/2 * (3√-uu_mex - 1/√-uu_mex)))
β = (E₀*R^2*lₚ^(4/3)*∛V(t₀)/(3^(5/3)*(1+u₀)))^(3/2)
E_mex = @. 3^(5/3)* β^(2/3) * (1 + uu_mex) /(R^2 * lₚ^(4/3) * V(tt) ^(1/3) ) * (ρ_mex) ^(2/3)



V(T) = exp(-T)
Vdot(T) = -exp(-T)

println("exp")
uu_exp = RK45(edo, tt, u₀)
ρ_exp = exp.(- integrate(tt, @. Vdot(tt)/V(tt) + 18√3/2 * (3√-uu_exp - 1/√-uu_exp)))
β = (E₀*R^2*lₚ^(4/3)*∛V(t₀)/(3^(5/3)*(1+u₀)))^(3/2)
E_exp = @. 3^(5/3)* β^(2/3) * (1 + uu_exp) /(R^2 * lₚ^(4/3) * V(tt) ^(1/3) ) * (ρ_exp) ^(2/3)



V(T) = log(-T+4)
Vdot(T) = -((-T+4))^(-1)

println("log")
uu_log = RK45(edo, tt, u₀)
ρ_log = - integrate(tt, @. Vdot(tt)/V(tt) + 18√3/2 * (3√-uu_log - 1/√-uu_log))
β = (E₀*R^2*lₚ^(4/3)*∛V(t₀)/(3^(5/3)*(1+u₀)))^(3/2)
E_log = @. log(3^(5/3)* β^(2/3) * (1 + uu_log) /(R^2 * lₚ^(4/3) * V(tt) ^(1/3) )) + 2/3* (ρ_log)



V(T) = -T+2
Vdot(T) = -1/V(T)

println("lin")
uu_lin = RK45(edo, tt, u₀)
ρ_lin = exp.(- integrate(tt, @. Vdot(tt)/V(tt) + 18√3/2 * (3√-uu_lin - 1/√-uu_lin)))
β = (E₀*R^2*lₚ^(4/3)*∛V(t₀)/(3^(5/3)*(1+u₀)))^(3/2)
E_lin= @. 3^(5/3)* β^(2/3) * (1 + uu_lin) /(R^2 * lₚ^(4/3) * V(tt) ^(1/3) ) * (ρ_lin) ^(2/3)





fs = 24
lw = 2
# p = Plots.plot(xtickfontsize=floor(.8*fs),ytickfontsize=floor(.8*fs),xguidefontsize=fs,yguidefontsize=fs,legendfontsize=floor(0.9*fs), foreground_color_legend=nothing)
# Plots.plot!(p, tt, log.(E_mex), label=L"V = -\phi^2/2 + \phi^4/4 + 0.5", legend=:topleft, linewidth=lw)
# Plots.plot!(p, tt, log.(E_exp), label=L"V = e^{-\phi}", linewidth=lw)
# Plots.plot!(p, tt, E_log, label=L"V=\ln(\phi+2)", linewidth=lw)
# Plots.plot!(p, tt, log.(E_lin), label=L"V=-\phi +2", linewidth=lw)
# Plots.xlabel!(p, L"\phi")
# Plots.ylabel!(p, L"\ln(E)")
# Plots.gui(p)

function makeplotu()
    fig = Figure()
    ax = Axis(fig[1, 1], xlabel=L"\phi", ylabel=L"u")

    lines!(ax, tt[1:100:end], uu_mex[1:100:end], label=L"V = -\phi^2/2 + \phi^4/4 + 0.5", linewidth=lw)
    lines!(ax, tt[1:100:end], uu_exp[1:100:end], label=L"V=e^{-\phi}", linewidth=lw)
    lines!(ax, tt[1:100:end], uu_log[1:100:end], label=L"V=\ln(-\phi+4)", linewidth=lw)
    lines!(ax, tt[1:100:end],  uu_lin[1:100:end], label=L"V=-\phi +2", linewidth=lw)
    axislegend(ax, position=:rb, labelsize=floor(0.9*fs))

    fig
end


function makeplotE()
    fig = Figure()
    ax = Axis(fig[1, 1], xlabel=L"\phi", ylabel=L"\log(E)")

    lines!(ax, tt[1:100:end], log.(E_mex)[1:100:end], label=L"V = -\phi^2/2 + \phi^4/4 + 0.5")
    lines!(ax, tt[1:100:end], log.(E_exp)[1:100:end], label=L"V=e^{-\phi}")
    lines!(ax, tt[1:100:end], E_log[1:100:end], label=L"V=\ln(-\phi+4)")
    lines!(ax, tt[1:100:end],  log.(E_lin)[1:100:end], label=L"V=-\phi +2")
    axislegend(ax, position=:lt)

    fig
end

set_theme!(mytheme)
save("figures/u-sim.svg", makeplotu())