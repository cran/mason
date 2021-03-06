% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidying.R
\name{tidy_up}
\alias{tidy_up}
\title{Convert model output to tidy tibble/dataframe.}
\usage{
tidy_up(model, output, ...)
}
\arguments{
\item{model}{The model object.}

\item{output}{Which output to choose from model.}

\item{...}{Not currently used. For later method additions.}
}
\value{
Tibble object with tidied model output. There are several output options:
\itemize{
\item default: Tibble with five columns for the x variables, components,
loadings, scores to variable correlations, and explained variance for each
component and x variable combination.
\item loadings, score_corr: Tibble with three columns for x variables,
components, and either loadings or score to variable correlations.
\item explained_var: Tibble with two columns for component and it's explained
variance.
\item scores: Tibble with one column for each component, with values for the scores
for each observation.
}
}
\description{
Currently this only tidies up PLS model objects. The main important output
objects from the PLS model are:
}
\details{
\itemize{
\item Scores: These are the individual scores calculated from the model for each
observation. Use these to look for patterns between components or between
X or Y variables.
\item Loadings: These are the combined weights in the model (including both X and
Y). Strongly correlated X variables that underlie Y will have similar
loadings.
\item Explained variance: This is the amount of variance that an individual
component explains within X. This is useful to use to see which components to
keep.
}
}
\examples{

library(pls)
data(yarn)

NIR <- yarn$NIR
density <- yarn$density
model <- plsr(density ~ NIR)
tidy_up(model)
tidy_up(model, "loadings")
tidy_up(model, "scores")
tidy_up(model, "score_cor")
tidy_up(model, "explained_var")

}
\seealso{
See this \href{https://learnche.org/pid/latent-variable-modelling/projection-to-latent-structures/interpreting-pls-scores-and-loadings}{website}
for more details on how to interpret the results of PLS.
}
