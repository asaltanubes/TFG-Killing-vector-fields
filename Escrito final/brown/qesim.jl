using CairoMakie
using LaTeXStrings
using SpecialFunctions: airyai, airybi
import .Iterators
include("../plotheme.jl")

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


V = T -> -T^2/2 + T^4/4 + .5
Vdot = T -> -T + T^3

function edo(t, x)
    if x < 0
        (Vdot(t)/V(t) + 18*sqrt.(-3x)).*(1 + x) 
    else
        println("Error at t = $t, with value: $x")
        return -1000
    end

end
 
t₀ = FloatType(0.0)
tf = FloatType(1.0)

sim_points=100_000

tt = Vector(range(t₀, tf, sim_points))

u₀ = FloatType(-.999)

# p = Plots.plot()


uu = RK45(edo, tt, u₀)
R = 1
lₚ = 1

γ3 = @. ∛(R^3/(V(tt)lₚ) *(1+uu))

sqrtu = .√(-uu)
ϵ = zeros(FloatType, sim_points)
Δt = tt[2]-tt[1]
for i in 2:sim_points
    ϵ[i] = ϵ[i-1] + (sqrtu[i] + sqrtu[i-1])/2*Δt
end

# α = √3/2 * 2π/3 * [3^(1/6)+3^(-1/6)/∛3, 3^(-1/3)-3^(-2/3)/∛3]

EE = Vector(range(-5, 10, 100))


ϕh = zeros((length(EE), length(tt)))
ψh = zeros(size(ϕh))

expαϵ = exp.(6√3/lₚ .* ϵ)
progress = 1
total = prod(size(ψh))
for Ei in 1:length(EE), ti in 1:length(tt)
    global progress
    if progress/total*10000%10==0
        println("Progress -> ", floor(10000*progress/total)/100)
    end
    progress +=1
    ϕhn = 2π* airyai(-EE[Ei]/γ3[ti])
    ϕh[Ei, ti] = ϕhn
    ψh[Ei, ti] = γ3[ti]*expαϵ[ti]*ϕhn
end

println(size(EE))
println(size(tt))
println(size(ψh))


az = (70+90)*π/180
el = 30*π/180
fs = 24
lfs = 35
cg = 50

function makeplot()
    fig = Figure()
    ax = Axis3(fig[1, 1], xlabel=L"\phi", ylabel=L"E", zlabel=L"|\tilde{\Psi}|",azimuth = az,
               elevation = el,
               xreversed=true,
               yreversed=true
               )

    abspsi = abs.(ψh')
    surface!(ax,tt[1:1000:end], EE, abspsi[1:1000:end, :])
    Colorbar(fig[1, 2], limits = (minimum(abspsi), maximum(abspsi)))
    colgap!(fig.layout, 1, cg)
    resize_to_layout!(fig)
    fig
end
set_theme!(mytheme)
update_theme!(Axis3 = (xlabelsize=30, ylabelsize=30, zlabelsize=30))
save("figures/q-phi-norm.png", makeplot())


# Plots.plot(tt, 1 ./γ3)
# Plots.gui()
