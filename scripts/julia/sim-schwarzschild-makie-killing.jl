# import Plots
using GLMakie
using LinearAlgebra: dot, diagm
using DifferentialEquations: ODEProblem, solve, DP5, Tsit5
using Interpolations: LinearInterpolation
using ProgressMeter: Progress, next!

β = 0.6
const rₛ = 1

g(xx) = [-(1-rₛ/xx[2]), + 1/(1-rₛ/xx[2]), +xx[2]^2]

function lorentz(β)
    γ = 1/√(1-β^2)
    return     [γ   -γ*β  0
               -γ*β  γ    0
                0    0    1]
end

function polar_to_cartesian(xx)
    t, r, θ = xx
    return [1 0        0
            0 cos(θ)  -r*sin(θ)
            0 sin(θ)   r*cos(θ)]
end

function cartesian_to_polar(xx)
    t, x, y = xx
    r = sqrt(x^2+y^2)
    return [1 0 0
            0 x/r y/r
            0 -y/r^2 x/r^2]
end

function cartesian_to_polar_coord(xx)
    t = xx[1]
    r = sqrt(xx[2]^2 + xx[3]^2)
    θ = atan(xx[3], xx[2])

    return [t, r, θ]
end

function polar_to_cartesian_coord(xx)
    t = xx[1]
    x = xx[2]*cos(xx[3])
    y = xx[2]*sin(xx[3])
    return [t, x, y]
end

T(β, xx) = cartesian_to_polar(lorentz(β)*xx)*lorentz(β)
Ti(β, xx) = lorentz(-β)*polar_to_cartesian(xx)


function gmc(xx)
    xxec = lorentz(β)*xx
    Tiₓ = Ti(β, lorentz(β)*xx)
    return Tiₓ*diagm(g(cartesian_to_polar_coord(xxec)))*Tiₓ'
end



function sim_particle(x₀, v₀, t_span = (BigFloat(0.), BigFloat(100.)), N = 5000)
    tt = Vector(range(t_span[1], t_span[2], N))
    # v₀ = [0., v₀...]
    # g₀ = g(x₀)
    # v₀[1] = sqrt((-1 - dot(g₀, v₀.^2))/g₀[1])
    g0 = g(x₀)
    E = g0[1] * v₀[1]
    L = g0[3] * v₀[3]

    println("E->", E)
    println("L->", L)


    function edo!(du, uudot, p, t)

        r, ϕ = uudot[1:2]
        gx = g([t, r, ϕ])

        rd = + gx[1]*sqrt(-1/(gx[2] * E^2) + L^2/(gx[3] * gx[2] * E^2) +1)
        ϕd = L*gx[1]/(E * gx[3])


        du .= [rd, ϕd]
    end

    sol = solve(ODEProblem(edo!, x₀[2:3], t_span), Tsit5(), saveat=tt, abstol = 1e-10, reltol = 1e-10)

    xx = stack(sol.u, dims=1)
    t = sol.t
    x = xx[:, 1] .* cos.(xx[:, 2])
    y = xx[:, 1] .* sin.(xx[:, 2])
    
    return stack([t, x, y])
end

x0 = [BigFloat(0.), BigFloat(1.6), BigFloat(2.)]
v0 = cartesian_to_polar(x0)*[BigFloat(0.), BigFloat(-1.), BigFloat(0.)]
# v0 = cartesian_to_polar(x0)*[BigFloat(0.), BigFloat(-0.2), BigFloat(0.)]
g₀ = g(x0)
v0[1] = sqrt((-1-g₀[2]*v0[2]^2 - g₀[3] * v0[3]^2)/g₀[1])
x0 = cartesian_to_polar_coord(x0)
println("norm v0 ->", v0'*diagm(g₀)*v0)

rr = sim_particle(x0, v0, (BigFloat(0.), BigFloat(8.)))
# rr = sim_particle(x0, v0, (BigFloat(0.), BigFloat(10.)))

fig, ax, _ = lines(rr[:, 2], rr[:, 3])

rrh = rr*lorentz(-β)
x = LinearInterpolation(rrh[:, 1], rrh[:, 2])
y = LinearInterpolation(rrh[:, 1], rrh[:, 3])

tt = Vector(range(rrh[1, 1], rrh[end, 1], 20))
invγ = sqrt(1-β^2)

framerate = 60
nframes = framerate*5
bar = Progress(nframes)

timerange = range(rrh[1, 1], rrh[end, 1], nframes)
println("figure")
fig = Figure(size = (1920, 1080))
ax = Axis(fig[1, 1], autolimitaspect=1, limits = ((x(timerange[1])-rₛ, x(timerange[end])+ rₛ), nothing))

t = Observable(rrh[1, 1])

lines!(ax, @lift(cos.(0:0.01:2π).*invγ .+ β .* $t), sin.(0:0.01:2π), linewidth=2, color = RGBf.(0, 0, 0))
xx = x.(timerange)
yy = y.(timerange)
index = Observable(1)
lines!(ax, @lift(xx[1:$index]), @lift(yy[1:$index]), linewidth=2, color=:orange)
scatter!(ax, @lift(x($t)), @lift(y($t)), markersize=15)


record(fig, "schwarzschild-anim6.mp4", 1:nframes;
        framerate = framerate) do i
    nowt = timerange[i]
    index[]=i
    t[] = nowt
    next!(bar)
end

# Plots.gr()
# anim = Plots.@animate for (i, t) in enumerate(tt)
    # println(i)
    # ind = Int(floor(i*jump))
#     Plots.plot([x(t)], [y(t)], seriestype= :scatter, xlims = (-2, 6), ylims=(-3, 6), aspect_ratio=:equal, legend=nothing)
#     Plots.plot!(cos.(0:0.01:2π).*invγ .+ β .* t, sin.(0:0.01:2π))

# end
# Plots.plot!(cos.(0:.1:2π), sin.(0:.1:2π))
# Plots.gui()
# Plots.gif(anim, "gif1.gif", fps=5)

# Plots.plot(xx[:, 1], xx[:, 2], legend=nothing)
# Plots.plot!(xx[:, 1], 0 .*sol.t .+ 1., legend=nothing)
# Plots.plot(r[2], r[3], aspect_ratio = :equal)
# Plots.plot!(centro[2], centro[3])
# Plots.plot!(cos.(θ), sin.(θ))
# Plots.xlims!(-.75, -.25)
# Plots.ylims!(.8, .9)
# Plots.gui()