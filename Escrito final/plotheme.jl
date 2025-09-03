using CairoMakie
mytheme = merge(theme_latexfonts(), Theme( Axis=(
        xgridvisible=false, ygridvisible=false, 
        xlabelsize=30, ylabelsize=30, xticklabelsize=20, yticklabelsize=20), 
        Lines=(linewidth=2,),
        Legend=(labelsize=21,)
        ))