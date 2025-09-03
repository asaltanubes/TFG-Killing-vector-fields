using CairoMakie
using LaTeXStrings
# using Makie.Colors

linspace(a, b, N = 1000) = Vector(range(a, b, N))

set_theme!(theme_latexfonts())

f = Figure()
# xlabel = Label(f[2, 1], L"u")
# ylabel = Label(f[1, 0], L"\dot{u}", rotation=π/2)


ax = Axis(f[1, 1], 
        xlabel=L"u", ylabel=L"\dot{u}", 
        xgridvisible=false, ygridvisible=false, 
        xlabelsize=30, ylabelsize=30, xticklabelsize=20, yticklabelsize=20)


uu = linspace(-1.1, 0)
uudot = @. (1+uu)*(-5 + 18*sqrt(-3uu))

lines!(ax, uu, uudot)
lines!(ax, uu, 0 .*uudot, color=(0, 0, 0))
save("figures/udot-u-plot.svg", f)