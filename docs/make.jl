using Documenter, DocumenterCitations, EntropyScaling
using DocumenterVitepress
using Literate

# for live preview
const DEV = get(ENV, "DOCS_DEV", "") == "true"

## Tutorials -- order here defines the order shown in the sidebar
tutorials = [
    "Using RES Models"       => "RES_models",
    "Fitting new models"     => "fitting",
]

## Generate tutorial markdown from Literate sources
for (_, slug) in tutorials
    Literate.markdown(
        joinpath(@__DIR__, "src", "tutorials", "$(slug).jl"),
        joinpath(@__DIR__, "src", "tutorials");
        documenter = !DEV,
    )
end

bib = CitationBibliography(joinpath(@__DIR__, "src", "refs.bib"); style=:numeric)

makedocs(
    sitename="EntropyScaling.jl",
    doctest  = !DEV,
    warnonly = DEV,
    format = DocumenterVitepress.MarkdownVitepress(
    repo = "github.com/se-schmitt/EntropyScaling.jl",
    devbranch = "main",
    devurl = "dev",
    ),
    pages = [
        #"Home" => "index.md",
        "Getting Started" => "getting_started.md",
        "Transport Properties" => "transport_properties.md",
        "Models" => [
            "Entropy Scaling Models" => "models/ES_models.md",
            "Zero-density Transport models" => "models/CE_models.md"
        ],
        "Tutorials" => [title => "tutorials/$(slug).md" for (title, slug) in tutorials],
        "References" => "references.md"
    ],
    plugins=[bib]
)

DocumenterVitepress.deploydocs(;
    repo = "github.com/se-schmitt/EntropyScaling.jl",
    target = joinpath(@__DIR__, "build"),
    devbranch = "main",
    push_preview = true,
)