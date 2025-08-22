import Plots
using LinearAlgebra: dot, diagm
using DifferentialEquations: ODEProblem, solve, DP5, Tsit5
using Interpolations: LinearInterpolation

β = .3

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

const rₛ = 1


function sim_particle(x₀, v₀, t_span = (BigFloat(0.), BigFloat(100.)), N = 5000)
    tt = Vector(range(t_span[1], t_span[2], N))
    # v₀ = [0., v₀...]
    # g₀ = g(x₀)
    # v₀[1] = sqrt((-1 - dot(g₀, v₀.^2))/g₀[1])

    function edo!(du, uudot, p, t)

        t, r, ϕ = uudot[1:3]
        td,rd, ϕd = uudot[4:6]

        tdd = -rₛ/r^2*td*rd/(1-rₛ/r)
        rdd = (1-rₛ/r)*(-rₛ/(2r^2) * td^2 + rₛ/(2*(r-rₛ)^2) * rd^2 + r*ϕd^2)
        ϕdd = -2rd*ϕd/r
        

        du .= [td, rd, ϕd, tdd, rdd, ϕdd]
    end

    sol = solve(ODEProblem(edo!, [x₀..., v₀...], t_span), Tsit5(), saveat=tt, abstol = 1e-10, reltol = 1e-10)

    xx = stack(sol.u, dims=1)
    t = xx[:, 1]
    x = xx[:, 2] .* cos.(xx[:, 3])
    y = xx[:, 2] .* sin.(xx[:, 3])
    
    return stack([t, x, y])
end

# x0 = [0., 10., 1.]
# v0 = [0., 0., 0.01]
# g₀ = gmc(x0)

# a =  g₀[1, 1]
# b =  2g₀[1, 2]*v0[2]
# c = g₀[2, 2]*v0[2]^2 + 2*g₀[2, 3]*v0[2]*v0[3] + g₀[3, 3]*v0[3]^2-1
# v0[1] = -b + sqrt(b^2 - 4a*c)/2a

# Λ = lorentz(β)

# x0h = Λ*x0
# x0h = [x0h[1], sqrt(x0h[2]^2 + x0h[3]^2), atan(x0h[3], x0h[2])]
# v0h = T(β, x0)* v0

# println(v0h'*diagm(g(x0h))*v0h)

# rh = sim_particle(x0h, v0h)

# println("rh -> ", size(rh))


# θ = Vector(range(0, 2π, 1000))
# # horizonte = [[t, cos.(θ), ]]
# centroh = stack([[t, 0, 0] for t in rh[:, 1]], dims=1)
# println("centro ", size(centroh))
# # println(centroh)
# centro = centroh*lorentz(-β)

# r = rh*lorentz(-β)

x0 = [BigFloat(0.), BigFloat(1.6), BigFloat(1.7)]
v0 = cartesian_to_polar(x0)*[BigFloat(0.), BigFloat(-.35), BigFloat(0.)]
g₀ = g(x0)
v0[1] = sqrt((-1-g₀[2]*v0[2]^2 - g₀[3] * v0[3]^2)/g₀[1])
x0 = cartesian_to_polar_coord(x0)
println("norm v0 ->", v0'*diagm(g₀)*v0)

rr = sim_particle(x0, v0)

rrh = rr*lorentz(-β)
x = LinearInterpolation(rrh[:, 1], rrh[:, 2])
y = LinearInterpolation(rrh[:, 1], rrh[:, 3])

tt = Vector(range(rrh[1, 1], rrh[end, 1], 20))
invγ = sqrt(1-β^2)
Plots.gr()
anim = Plots.@animate for (i, t) in enumerate(tt)
    println(i)
    ind = Int(floor(i*jump))
    Plots.plot([x(t)], [y(t)], seriestype= :scatter, xlims = (-2, 6), ylims=(-3, 6), aspect_ratio=:equal, legend=nothing)
    Plots.plot!(cos.(0:0.01:2π).*invγ .+ β .* t, sin.(0:0.01:2π))

end
# Plots.plot!(cos.(0:.1:2π), sin.(0:.1:2π))
# Plots.gui()
Plots.gif(anim, "gif1.gif", fps=5)

# Plots.plot(xx[:, 1], xx[:, 2], legend=nothing)
# Plots.plot!(xx[:, 1], 0 .*sol.t .+ 1., legend=nothing)
# Plots.plot(r[2], r[3], aspect_ratio = :equal)
# Plots.plot!(centro[2], centro[3])
# Plots.plot!(cos.(θ), sin.(θ))
# Plots.xlims!(-.75, -.25)
# Plots.ylims!(.8, .9)
# Plots.gui()