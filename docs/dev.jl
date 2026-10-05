ENV["DOCS_DEV"] = "true"

const SRC  = joinpath(@__DIR__, "src")
const MAKE = joinpath(@__DIR__, "make.jl")

# Letzte Änderungszeit aller Quelldateien (ohne die von Literate erzeugten .md)
function stamp()
    t = mtime(MAKE)
    for (root, _, files) in walkdir(SRC), f in files
        p = joinpath(root, f)
        (endswith(f, ".md") && basename(root) == "tutorials") && continue
        t = max(t, mtime(p))
    end
    return t
end

let last = 0.0
    while true
        t = stamp()
        if t > last
            last = t
            try
                include(MAKE)
            catch e
                @error "Build fehlgeschlagen" exception = (e, catch_backtrace())
            end
            last = max(last, stamp())
            @info "Fertig, warte auf Änderungen ..."
        end
        sleep(1)
    end
end