% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcmc-intervals.R
\name{MCMC-intervals}
\alias{MCMC-intervals}
\alias{mcmc_intervals}
\alias{mcmc_areas}
\alias{mcmc_areas_ridges}
\alias{mcmc_intervals_data}
\alias{mcmc_areas_data}
\alias{mcmc_areas_ridges_data}
\title{Plot interval estimates from MCMC draws}
\usage{
mcmc_intervals(
  x,
  pars = character(),
  regex_pars = character(),
  transformations = list(),
  ...,
  prob = 0.5,
  prob_outer = 0.9,
  point_est = c("median", "mean", "none"),
  outer_size = 0.5,
  inner_size = 2,
  point_size = 4,
  rhat = numeric()
)

mcmc_areas(
  x,
  pars = character(),
  regex_pars = character(),
  transformations = list(),
  ...,
  area_method = c("equal area", "equal height", "scaled height"),
  prob = 0.5,
  prob_outer = 1,
  point_est = c("median", "mean", "none"),
  rhat = numeric(),
  border_size = NULL,
  bw = NULL,
  adjust = NULL,
  kernel = NULL,
  n_dens = NULL
)

mcmc_areas_ridges(
  x,
  pars = character(),
  regex_pars = character(),
  transformations = list(),
  ...,
  prob_outer = 1,
  prob = 1,
  border_size = NULL,
  bw = NULL,
  adjust = NULL,
  kernel = NULL,
  n_dens = NULL
)

mcmc_intervals_data(
  x,
  pars = character(),
  regex_pars = character(),
  transformations = list(),
  ...,
  prob = 0.5,
  prob_outer = 0.9,
  point_est = c("median", "mean", "none"),
  rhat = numeric()
)

mcmc_areas_data(
  x,
  pars = character(),
  regex_pars = character(),
  transformations = list(),
  ...,
  prob = 0.5,
  prob_outer = 1,
  point_est = c("median", "mean", "none"),
  rhat = numeric(),
  bw = NULL,
  adjust = NULL,
  kernel = NULL,
  n_dens = NULL
)

mcmc_areas_ridges_data(
  x,
  pars = character(),
  regex_pars = character(),
  transformations = list(),
  ...,
  prob_outer = 1,
  prob = 1,
  bw = NULL,
  adjust = NULL,
  kernel = NULL,
  n_dens = NULL
)
}
\arguments{
\item{x}{An object containing MCMC draws:
\itemize{
\item A 3-D array, matrix, list of matrices, or data frame. The \link{MCMC-overview}
page provides details on how to specify each these.
\item A \code{draws} object from the \pkg{posterior} package (e.g.,
\code{draws_array}, \code{draws_rvars}, etc.).
\item An object with an \code{as.array()} method that returns the same kind of 3-D
array described on the \link{MCMC-overview} page.
}}

\item{pars}{An optional character vector of parameter names. If neither
\code{pars} nor \code{regex_pars} is specified then the default is to use \emph{all}
parameters. As of version \verb{1.7.0}, \strong{bayesplot} also supports 'tidy'
parameter selection by specifying \code{pars = vars(...)}, where \code{...} is
specified the same way as in \link[dplyr:select]{dplyr::select(...)} and
similar functions. Examples of using \code{pars} in this way can be found on the
\link[=tidy-params]{Tidy parameter selection} page.}

\item{regex_pars}{An optional \link[base:grep]{regular expression} to use for
parameter selection. Can be specified instead of \code{pars} or in addition to
\code{pars}. When using \code{pars} for tidy parameter selection, the \code{regex_pars}
argument is ignored since \link[tidyselect:language]{select helpers}
perform a similar function.}

\item{transformations}{Optionally, transformations to apply to parameters
before plotting. If \code{transformations} is a function or a single string
naming a function then that function will be used to transform all
parameters. To apply transformations to particular parameters, the
\code{transformations} argument can be a named list with length equal to
the number of parameters to be transformed. Currently only univariate
transformations of scalar parameters can be specified (multivariate
transformations will be implemented in a future release). If
\code{transformations} is a list, the name of each list element should be a
parameter name and the content of each list element should be a function
(or any item to match as a function via \code{\link[=match.fun]{match.fun()}}, e.g. a
string naming a function). If a function is specified by its name as a
string (e.g. \code{"log"}), then it can be used to construct a new
parameter label for the appropriate parameter (e.g. \code{"log(sigma)"}).
If a function itself is specified
(e.g. \code{log} or \code{function(x) log(x)})
then \code{"t"} is used in the new parameter label to indicate that the
parameter is transformed (e.g. \code{"t(sigma)"}).

Note: due to partial argument matching \code{transformations} can be
abbreviated for convenience in interactive use (e.g., \code{transform}).}

\item{...}{Currently unused.}

\item{prob}{The probability mass to include in the inner interval (for
\code{mcmc_intervals()}) or in the shaded region (for \code{mcmc_areas()}). The
default is \code{0.5} (50\% interval) and \code{1} for \code{mcmc_areas_ridges()}.}

\item{prob_outer}{The probability mass to include in the outer interval. The
default is \code{0.9} for \code{mcmc_intervals()} (90\% interval) and
\code{1} for \code{mcmc_areas()} and for \code{mcmc_areas_ridges()}.}

\item{point_est}{The point estimate to show. Either \code{"median"} (the
default), \code{"mean"}, or \code{"none"}.}

\item{inner_size, outer_size}{For \code{mcmc_intervals()}, the size of
the inner and interval segments, respectively.}

\item{point_size}{For \code{mcmc_intervals()}, the size of point estimate.}

\item{rhat}{An optional numeric vector of R-hat estimates, with one element
per parameter included in \code{x}. If \code{rhat} is provided, the intervals/areas
and point estimates in the resulting plot are colored based on R-hat value.
See \code{\link[=rhat]{rhat()}} for methods for extracting R-hat estimates.}

\item{area_method}{How to constrain the areas in \code{mcmc_areas()}. The
default is \code{"equal area"}, setting the density curves to have the same
area. With \code{"equal height"}, the curves are scaled so that the highest
points across the curves are the same height. The method \code{"scaled height"} tries a compromise between to the two: the heights from
\code{"equal height"} are scaled using \code{height*sqrt(height)}}

\item{border_size}{For \code{mcmc_areas()} and \code{mcmc_areas_ridges()}, the size of
the ridgelines.}

\item{bw, adjust, kernel, n_dens}{Optional arguments passed to
\code{\link[stats:density]{stats::density()}} to override default kernel density estimation
parameters. \code{n_dens} defaults to \code{1024}.}
}
\value{
The plotting functions return a ggplot object that can be further
customized using the \strong{ggplot2} package. The functions with suffix
\verb{_data()} return the data that would have been drawn by the plotting
function.
}
\description{
Plot central (quantile-based) posterior interval estimates from MCMC draws.
See the \strong{Plot Descriptions} section, below, for details.
}
\section{Plot Descriptions}{

\describe{
\item{\code{mcmc_intervals()}}{
Plots of uncertainty intervals computed from posterior draws with all
chains merged.
}
\item{\code{mcmc_areas()}}{
Density plots computed from posterior draws with all chains merged,
with uncertainty intervals shown as shaded areas under the curves.
}
\item{\code{mcmc_areas_ridges()}}{
Density plot, as in \code{mcmc_areas()}, but drawn with overlapping
ridgelines. This plot provides a compact display of (hierarchically)
related distributions.
}
}
}

\examples{
set.seed(9262017)

# load ggplot2 to use its functions to modify our plots
library(ggplot2)

# some parameter draws to use for demonstration
x <- example_mcmc_draws(params = 6)
dim(x)
dimnames(x)

color_scheme_set("brightblue")
mcmc_intervals(x)
mcmc_intervals(x, pars = c("beta[1]", "beta[2]"))
mcmc_areas(x, regex_pars = "beta\\\\[[1-3]\\\\]",  prob = 0.8) +
 labs(
   title = "Posterior distributions",
   subtitle = "with medians and 80\% intervals"
 )

color_scheme_set("red")
p <- mcmc_areas(
   x,
   pars = c("alpha", "beta[4]"),
   prob = 2/3,
   prob_outer = 0.9,
   point_est = "mean",
   border_size = 1.5 # make the ridgelines fatter
)
plot(p)

\donttest{
# control spacing at top and bottom of plot
# see ?ggplot2::expansion
p + scale_y_discrete(
  limits = c("beta[4]", "alpha"),
  expand = expansion(add = c(1, 2))
)
p + scale_y_discrete(
  limits = c("beta[4]", "alpha"),
  expand = expansion(add = c(.1, .3))
)

# relabel parameters
p + scale_y_discrete(
  labels = c("alpha" = "param label 1",
             "beta[4]" = "param label 2")
)

# relabel parameters and define the order
p + scale_y_discrete(
  labels = c("alpha" = "param label 1",
             "beta[4]" = "param label 2"),
  limits = c("beta[4]", "alpha")
)

# color by rhat value
color_scheme_set("blue")
fake_rhat_values <- c(1, 1.07, 1.3, 1.01, 1.15, 1.005)
mcmc_intervals(x, rhat = fake_rhat_values)

# get the dataframe that is used in the plotting functions
mcmc_intervals_data(x)
mcmc_intervals_data(x, rhat = fake_rhat_values)
mcmc_areas_data(x, pars = "alpha")

color_scheme_set("gray")
p <- mcmc_areas(x, pars = c("alpha", "beta[4]"), rhat = c(1, 1.1))
p + legend_move("bottom")
p + legend_move("none") # or p + legend_none()

}

# Different area calculations
b3 <- c("beta[1]", "beta[2]", "beta[3]")

mcmc_areas(x, pars = b3, area_method = "equal area") +
  labs(
    title = "Curves have same area",
    subtitle = "A wide, uncertain interval is spread thin when areas are equal"
   )

mcmc_areas(x, pars = b3, area_method = "equal height") +
  labs(
    title = "Curves have same maximum height",
    subtitle = "Local curvature is clearer but more uncertain curves use more area"
  )

mcmc_areas(x, pars = b3, area_method = "scaled height") +
  labs(
    title = "Same maximum heights but heights scaled by square-root",
    subtitle = "Compromise: Local curvature is accentuated and less area is used"
   )

\donttest{
# apply transformations
mcmc_intervals(
  x,
  pars = c("beta[2]", "sigma"),
  transformations = list("sigma" = "log", "beta[2]" = function(x) x + 3)
)

# apply same transformation to all selected parameters
mcmc_intervals(x, regex_pars = "beta", transformations = "exp")
}

\dontrun{
# example using fitted model from rstanarm package
library(rstanarm)
fit <- stan_glm(
 mpg ~ 0 + wt + factor(cyl),
 data = mtcars,
 iter = 500,
 refresh = 0
)
x <- as.matrix(fit)

color_scheme_set("teal")
mcmc_intervals(x, point_est = "mean", prob = 0.8, prob_outer = 0.95)
mcmc_areas(x, regex_pars = "cyl", bw = "SJ",
           rhat = rhat(fit, regex_pars = "cyl"))
}

\dontrun{
# Example of hierarchically related parameters
# plotted with ridgelines
m <- shinystan::eight_schools@posterior_sample
mcmc_areas_ridges(m, pars = "mu", regex_pars = "theta", border_size = 0.75) +
  ggtitle("Treatment effect on eight schools (Rubin, 1981)")
}

}
\seealso{
Other MCMC: 
\code{\link{MCMC-combos}},
\code{\link{MCMC-diagnostics}},
\code{\link{MCMC-distributions}},
\code{\link{MCMC-nuts}},
\code{\link{MCMC-overview}},
\code{\link{MCMC-parcoord}},
\code{\link{MCMC-recover}},
\code{\link{MCMC-scatterplots}},
\code{\link{MCMC-traces}}
}
\concept{MCMC}
