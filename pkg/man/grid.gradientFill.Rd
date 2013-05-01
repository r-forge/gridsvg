\name{grid.gradientFill}
\alias{grid.gradientFill}
\alias{gradientFillGrob}
\title{
  Associate a pattern fill with a grid grob
}
\description{
  Creates a \code{gradientFilled.grob} object which is a normal grid
  grob, with a gradient fill used in place of a regular fill. Used in
  conjunction with \code{gradientFill}, to produce an SVG document
  containing graphical elements with gradient fills.
}
\usage{
grid.gradientFill(path, label = NULL, gradient = NULL,
                  alpha = 1, group = TRUE, grep = FALSE)
gradientFillGrob(x, label = NULL, gradient = NULL,
                 alpha = 1, group = TRUE)
}
\arguments{
  \item{x}{
    A grob to add a pattern fill to.
  }
  \item{path}{
    A grob path specifying a drawn grob.
  }
  \item{label}{
    A label that is associated with a definition of a gradient
    fill. This is the label used to create a gradient fill
    definition with \code{gradientFill}.
  }
  \item{gradient}{
    A \code{gradient} object, provided by the \code{linearGradient} and
    \code{radialGradient} functions. Provides the definition of a
    gradient fill that will be applied to \code{x} or \code{path}.
  }
  \item{alpha}{
    The alpha channel for transparency. A value between 0 and 1.
  }
  \item{group}{
    A logical vector that indicates whether the gradient fill
    should be applied to the overall parent group for the
    relevant SVG element, or to individual SVG elements.
  }
  \item{grep}{
    Whether the \code{path} should be treated as a regular expression.
  }
}
\details{
  If \code{label} is specified, uses a gradient that has been supplied
  to \code{gradientFill}. If \code{gradient} is specified it will be
  used as the gradient fill applied to each grob. If both are specified,
  it will attempt to define the gradient with the given label, as well
  as applying a gradient fill to the appropriate grobs.
}
\value{
  A gradientFilled.grob object (for \code{gradientFillGrob}).
}
\author{
  Simon Potter
}
\seealso{
  \code{\link{linearGradient}}, \code{\link{radialGradient}},
  \code{\link{gradientFill}}
}