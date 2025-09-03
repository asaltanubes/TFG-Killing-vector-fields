using CairoMakie
using LaTeXStrings
using SpecialFunctions: gamma
using ProgressMeter: Progress, next!
using Interpolations: linear_interpolation
include("../plotheme.jl")
# Plots.pythonplot()

# setprecision(800)
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


V = T -> -T^2/2 + T^4/4 + .5
Vdot = T -> -T + T^3

function edo(t, x)
    if x < 0
        (Vdot(t)/V(t) + 18*sqrt.(-3x)).*(1 + x) 
    else
        # println("Error at t = $t, with value: $x")
        return -1000
    end

end
 
t₀ = FloatType(0.3)
tf = FloatType(1.0)

sim_points=10_000
N = 100

tt = Vector(range(t₀, tf, sim_points))

vv  = Vector(range(FloatType(-.7), FloatType(-.2), N))
# differential_factor = FloatType(0.999)
# dα = (differential_factor-1)vv

uu  = zeros(FloatType, (sim_points, N))
# duu = zeros(FloatType, (sim_points, N))

sim(v) = RK45(edo, tt, v)

println("Computing u")
bar = Progress(N)
@inbounds @Threads.threads for i in range(1, N)
    uu[:, i]  = sim(vv[i])
    # duu[:, i] = sim(differential_factor*vv[i])-uu[:, i]
    next!(bar)
end



# println("Computing rho 1")
# bar = Progress(N)
# @inbounds for j in range(1, N) 
#     ρ[:, j] .= dα[j] ./ duu[:, j]
#     next!(bar)
# end

# Drop the variable
# duu = nothing

function edorho(uuv)
    global tt
    uut = linear_interpolation(tt, uuv)
    function inner(t, x)
        sut = √-uut(t)
        return x*(-Vdot(t)/V(t) - 18√3*(sut - 1/(2sut)))
    end
end



ρ = similar(uu)
println("Computing rho")
bar = Progress(N)
@inbounds @Threads.threads for j in range(1, N)
    ρ[:, j] .= RK45(edorho(uu[:, j]), tt, FloatType(1))
    next!(bar)
end



VV = V.(tt)
γ = similar(uu) 

println("Computing gamma")
bar = Progress(length(uu))
@inbounds for j in range(1, N) 
    @simd for i in range(1, sim_points)
        γ[i, j] = (1+uu[i, j])/VV[i]
        next!(bar)
    end
end

ϵ = similar(uu)
Δt = tt[2]-tt[1]
println("Computing epsilon")
bar = Progress(N)
@Threads.threads for j in range(1, N) 
    ϵ[1, j] = 0.
    for i in range(2, sim_points)
        ϵ[i, j] = ϵ[i-1, j] + sqrt(-uu[i, j])*Δt
    end
    next!(bar)
end

# Plots.plot(tt, ϵ, legend=nothing)



# Transposing so that indexing in time is column major
uut = uu'
γt = γ'
ρt = ρ'
expϵt = exp.(6√3ϵ') 

normphi = Vector{FloatType}(undef, sim_points)

println("Computing norm")
bar = Progress(sim_points)
Δv = vv[2]-vv[1]
coef = gamma(FloatType(1//3))* Δv^2/(3^(1/3)* sqrt(2π) * (maximum(vv)-minimum(vv))^2)
@inbounds @Threads.threads for i in range(1, sim_points)
    s = 0
    @inbounds for v in 1:N
        @inbounds for w in 1:(v-1) 
            s += expϵt[v, i] * expϵt[w, i] * 1/∛(abs(γt[v]-γt[w]))
        end
    end
    normphi[i] = coef*s
    next!(bar)
end

# fs = 14
# lw = 2
# nphi = Plots.plot(xtickfontsize=floor(.8*fs), ytickfontsize=floor(.8*fs),xguidefontsize=fs, yguidefonsize=fs,legendfontsize=floor(0.9*fs))
# Plots.plot!(nphi, tt, normphi, legend=nothing)
# Plots.xlabel!(nphi, L"\phi")
# Plots.ylabel!(nphi, L"<\phi|\phi>")

expvalE = Vector{FloatType}(undef, sim_points)

println("Computing E")
coef = Δv*(2π)^2/(maximum(vv)-minimum(vv))^2
expϵt2 = expϵt.^2
bar = Progress(sim_points)
@inbounds @Threads.threads for i in 1:sim_points
    s = 0
    for v in 1:N
        s += expϵt2[v, i]*(1+uut[v, i])*ρt[v, i]
    end
    expvalE[i] = coef*s
    next!(bar)
end


# fs = 14
# lw = 2
# pexpvale = Plots.plot(xtickfontsize=floor(.8*fs), ytickfontsize=floor(.8*fs),xguidefontsize=fs, yguidefonsize=fs,legendfontsize=floor(0.9*fs))
# Plots.plot!(pexpvale, tt, log.(expvalE ./ normphi), legend=nothing)
# Plots.xlabel!(pexpvale, L"\phi")
# Plots.ylabel!(pexpvale, L"\ln(E)")
# Plots.gui(pexpvale)


fs = 24
lw = 3

function makeplotnormphi()
    fig = Figure()
    ax = Axis(fig[1, 1], xlabel=L"\phi", ylabel=L"\langle \varphi | \varphi \rangle")
    lines!(ax, tt[1:10:end],  normphi[1:10:end], linewidth=lw)

    fig
end


function makeplotE()
    fig = Figure()
    ax = Axis(fig[1, 1], xlabel=L"\phi", ylabel=L"\langle \varphi |E| \varphi \rangle", yscale=log10)
    lines!(ax, tt[1:10:end],  (expvalE./normphi)[1:10:end], linewidth=lw)

    fig
end

set_theme!(mytheme)
save("figures/exp-val-e.svg", makeplotE())