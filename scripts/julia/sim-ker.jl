using GLMakie
using DifferentialEquations: ODEProblem, solve, DP5, Tsit5
a = 0.6
Δ(r::Float64) = r^2 -r +a^2
Σ(r::Float64, θ::Float64) = r^2 +(a * cos(θ))^2

function g(xx::Vector{Float64})
    t, r, θ, ϕ = xx

    Δ = Δ(r)
    Σ = Σ(r, θ)

    return [
               (1-r/Σ),    0, 0, (r * a * (sin(θ))^2)/Σ;
                     0, -Σ/Δ, 0, 0;
                     0,    0, Σ, 0;
(r * a * (sin(θ))^2)/Σ,    0, 0,  -(r^2 + a^2 + (r*a^2 * sin(θ)^2)/Σ)*sin(θ)^2     
    ]

end

function sim_particle(x₀::Vector{Float64}, v0::{Float64}, t_span::Tuple{Float64, Float64} = (BigFloat(0.), BigFloat(100.)), N::UInt = 5000)
    tt = Vector(range(t_span[1], t_span[2], N))
    g = g(x₀)
    a = g[1, 1]
    b = 2*g[1, 4]*v0[4]
    c = -1 + g[2, 2]*v0[2, 2]^2 + g[3, 3] * v0[3]^2 + g[4, 4]*v0[4]^2
    v0[1] = (-b + sqrt(b^2 - 4a*c))/2a
    a = nothing
    b = nothing
    c = nothing

    println("V0 is positive->", v0[1]>0.)

    t, r, θ, ϕ = x0
    s = Σ(r, θ)
    d = Δ(r)
    E = g[1, 1]*v0[1] + g[1, 4]*v0[4]
    L = g[4, 1]*v0[1] + g[4, 4]*v0[4]
    C = 2*s^2*(g[1, 1]*(r^2+a^2)*v0[1] + g[2, 2] )


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


sol = solve(ODEProblem(edo!, [x₀..., v₀...], t_span), Tsit5(), saveat=tt, abstol = 1e-10, reltol = 1e-10)