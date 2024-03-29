\name{NEWS}
\title{NEWS file for the gridSVG package}
\encoding{UTF-8}

\section{Changes in version 1.7-5}{
  \itemize{
    \item Fix in \code{escapeXPath()} for \dQuote{the condition has
      length > 1} error.  Thanks to Dzimitry Markouski.
    
    \item Fixes for problems found by \code{tools::checkS3methods()}.
  }
}
\section{Changes in version 1.7-4}{
  \itemize{
    \item Fix in \code{feColorMatrix()} for \dQuote{length > 1 in
      coercion to logical} error.  Thanks to CRAN testing and Brian Ripley!
  }
}
\section{Changes in version 1.7-3}{
  \itemize{
    \item Internal implementation change to avoid assigning values
    into baseenv.
  }
}
\section{Changes in version 1.7-2}{
  \itemize{
    \item Simpler and better transformations for exported
    SVG <image> elements.

    \item Better protection against \code{NA} values in labels
    in text grobs.  Reported by Daniel Barnett.
  }
}
\section{Changes in version 1.7-1}{
  \itemize{
    \item Fix for evaluation of arguments passed to \code{pdf()}
    device within \code{gridsvg()}.

    Patch provided by Philipp Angerer.

    \item Avoid peeking at internal representation of \pkg{grid} units.
  }  
}
\section{Changes in version 1.7-0}{
  \itemize{
    \item Update for addition of \code{pathId} argument in
    \code{grid.path}.
  }
}
\section{Changes in version 1.6-1}{
  \itemize{
    \item Additional fix for \code{pch=NA}
  }
}
\section{Changes in version 1.6-0}{
  \itemize{
    \item Generation of SVG from \code{grid.export()} is now much faster
    (when you are drawing many rectangles, points, circles, or lines).
  }
}
\section{Changes in version 1.5-1}{
  \itemize{
    \item Fix to ensure that \code{r} attribute in radial gradients
    is non-negative.
    
    \item Fix for strict attribute checking now includes presentation
    attributes.
    
    \item Fix for \pkg{gtable} support when grob in table cell has
    viewport with non-centering alignment (e.g., a \pkg{ggplot2}
    plot with more than one legend).  Reported by Tauno Metsalu.

    \item Switched JSON library from \pkg{RJSONIO} to \pkg{jsonlite}.
    \pkg{gridSVG} no longer needs to compile C code as it can import
    a base64 encoding method from \pkg{jsonlite}.

    \item Bug fix to handle exporting par(lty="blank"), e.g., from
    boxplot() (converted with \pkg{gridGraphics}).  Thanks to Volker
    Sorge.

    \item Bug fix to handle pch=NA.  Thanks to Volker Sorge.
  }
}
\section{Changes in version 1.5-0}{
  \itemize{
    \item Added \code{strict} argument for \code{grid.export()}
    and \code{gridsvg()} to allow control over whether SVG attributes
    are checked for validity.

    \item Added \code{rootAttrs} argument for \code{grid.export()}
    and \code{gridsvg()} to allow control over attributes of
    top-level \code{<svg>} element.  Suggestion and original patch
    from Thell Fowler.
  }
}
\section{Changes in version 1.4-4}{
  \itemize{
    \item Fixed bug where \code{gpar(col=c(foo="red"))} would not work
    (the name \code{foo} is now stripped).  Reported by Simon Anders.

    \item Fixed bug in feColorMatrix().  The color matrix required
    transposing before export to SVG.

    \item Fixed bug in feComponentTransfer().  Was generating an
    feColorMatrix element \emph{and} was inlining transfer functions
    as attributes (rather than generating feFunc elements as children).

    \item Added support for NA values in locations and dimensions
    of graphical primitives.
  }
}
\section{Changes in version 1.4-3}{
  \itemize{
    \item Non-SVG style attributes are now \emph{removed} (with a
    warning) and this is done \emph{before} checking attributes for
    length equal to 1.

    This was in response to a problem reported by Wolfgang Huber.

    \item Fix evaluation of arguments when using the 'gridsvg' device.
    These were not being evaluated before being passed to 'grid.export'.

    Also reported by Wolfgang Huber.
  }
}
\section{Changes in version 1.4-2}{
  \itemize{
    \item Fixed export of clip grob (reported by Matthew Plourde).
    
    \item Fixed support for primitiveUnits="bbox" in filterEffect().

    \item Fix memory initialisation problem in base64 C code.

    Reported in valgrind testing by Brian Ripley.
  }
}
\section{Changes in version 1.4-1}{
  \itemize{
    \item Fixed raster export so that original raster is never
    exported at a resolution LOWER than its native resolution.
    
    \item Added forceGrob() methods so that animations, garnishing,
    hyperlinks, etc are retained if a grob is forced.
    
    \item Fix for export of downViewport(path) when the depth of the
    resulting navigation is greater than depth(path).

    The visible manifestation of this bug was that <g> elements were
    generated with an incorrect (too long/wrong depth) 'id' attribute.
  }
}
\section{Changes in version 1.4-0}{
  \itemize{
    \item Bumped R version requirement to R >= 3.1.0 because this
    version of gridSVG depends on some new exports from 'grid'

    \item Removed all nasty peeks into grid namespace (hence
    dependence on R 3.1.0).

    \item Tweaks to tests/ to make it easier to do QC checks.
  }
}

\section{Changes in version 1.3-0}{
  \itemize{
    \item Added support for rotated viewports
    (previously, rectangles, text, rasters, and clipping rects
    did not export properly, if drawn within a rotated viewport)

    Includes changes to rendering, animation, and coordinate system
    export and conversion.

    \item Fixed bug in viewportConvertWidth() and
    viewportConvertHeight() when converting from "native".

    \item Bug fix for positioning grobs with dimensions when a
    viewport's x-scale or y-scale is "flipped". (Simon)

    \item Reposition <defs> so that definitions are always available
    when used. Allows renderers like librsvg to render gridSVG images
    correctly. For consistency, pch definitions are also pushed into the
    same <defs> element. (Simon)

    \item Bug fix for 'lwd'. They are now defined as being 1/96 inches,
    which matches most graphics devices. (Simon)

    \item Only one 'gridsvg' device can now be open at once. This is
    because referenced content (like gradients, masks, etc) can have
    side effects across multiple 'gridsvg' devices. (Simon)

    \item New argument for 'grid.export()', 'progress'. When this
    argument is 'TRUE', messages will be printed to the console that
    show how far gridSVG is through processing an image. Additionally,
    progress bars are drawn to aid in estimation of progress. (Simon)

    \item New argument for 'grid.export()', 'compression'. This can take
    an integer value between 0 and 9 that describes the level of (gzip)
    compression applied to the exported image. (Simon)

    \item Added 'group', 'strict', 'grep', and 'global' arguments
    to grid.animate() (to bring it into line with grid.hyperlink()
    and grid.garnish().

    \item Now Import rather than Depend on other packages.
  }
}

\section{Changes in version 1.2-0}{
  \itemize{

    \item The main change in this version involves taking advantage of
    changes in R version 3.0.0, which introduced a \code{grid.force()}
    function. This reduces the need for special methods in this package
    to draw custom grobs.

    \item Renamed 'gridToSVG' to 'grid.export'. 'gridToSVG' is now
    deprecated and will produce a warning but will still work.
    'grid.export' should be used from now on. (Simon)

    \item Renamed 'grid.export' arguments for
    consistency. 'export.coords', 'export.mappings', and 'export.js' are
    now camelCased to 'exportCoords', 'exportMappings', 'exportJS'
    respectively. (Simon)

    \item Bumped R version dependency to R >= 3.0.0 because
    \code{gridToSVG()} now calls \code{grid.force()} before export

    \item Removed several \code{primToDev()} methods:
    \itemize{
      \item \code{primToDev.xaxis()}
      \item \code{primToDev.yaxis()}
      \item \code{grobToDev.roundrect()}
      \item \code{grobToDev.frame()}
      \item \code{grobToDev.cellGrob()}
    }

    \item Bug fix for multi-line text when cex != 1

    \item Initial implementation of pattern fills. Define pattern fills
    using 'pattern' and 'registerPatternFill' (and also
    'registerPatternFillRef' to reuse an existing definition). These can
    then be applied to grobs using 'grid.patternFill' and
    'patternFillGrob'. (Simon)

    \item Add a graphics device-like interface to gridSVG. Use 'gridsvg'
    to open a gridSVG device, and 'dev.off' to close it. (Simon)

    \item Added new 'gridSVG.newpage' function. It will clear all
    definitions of referenced content as well as calling
    'grid.newpage'. (Simon)

    \item Now allowing for a prefix to be applied to all SVG ID
    attributes. Particularly useful when including multiple gridSVG
    images in the same document as it ensures uniqueness of IDs between
    documents. This can be used by specifying the 'prefix' argument to
    'grid.export'. (Simon)

    \item New optional parameter to 'grid.export', 'addClasses'. If this
    argument is 'TRUE', then gridSVG will add an SVG class attribute to
    each grob or viewport it draws. The value of this attribute is what
    is produced by calling 'class' on the object. This is useful for
    allowing a convenient way of selecting more than one type of grob
    (e.g. the '.axis' CSS selector will select all axis grobs). (Simon)

    \item Added implementation of gradient fills for grobs. See
    'linearGradient', 'radialGradient', and 'registerGradientFill' for
    defining gradients. Use 'grid.gradientFill' and 'gradientFillGrob'
    to apply gradient fills to grobs. (Simon)

    \item Bug fix for pointsGrobs. 'size' units were unnecessarily being
    manipulated. They should now be sized more accurately. (Simon & Paul)

    \item Added support for non-rectangular clipping paths. Use
    'grid.clipPath' and 'clipPathGrob' for applying clipping paths to
    grobs. Use 'pushClipPath' for applying to the current viewport,
    which behaves similarly to 'grid.clip'. Uses an object produced by
    'clipPath' as the definition for the clipping path and is registered
    by calling 'registerClipPath'. (Simon)

    \item Added support for opacity masks. Use 'grid.mask' and
    'maskGrob' to apply opacity masks to grobs. Use 'pushMask' for
    applying to the current viewport, which behaves similarly to
    'grid.clip'. Uses a grob as the definition for an opacity
    mask. Define the mask using 'mask' and 'registerMask'. (Simon)

    \item New function 'popContext', which stops the effect of
    'pushMask' and 'pushClipPath'. (Simon)

    \item Bug fix for 'clipGrob's. Now unwinds only when a viewport is
    popped and just not any grouped content. (Simon)

    \item Added support for SVG filter effects. Create a filter effect
    by calling 'filterEffect' and adding as its children some of the
    various filter effect primitives by calling 'fe*' functions. Some of
    these filter effects are quite complicated so reading the function
    documentation and the SVG specification is required. Apply filter
    effects to grobs using 'grid.filter' and 'filterGrob'. (Simon)

    \item Bugfix for unit conversion functions. "svg" was not being
    handled correctly. (Simon)

    \item Bugfix for arrows. Definition now matches 'grid'. Now also
    handles the case when an arrow's line width is greater than its
    width/height (Firefox would not show the arrow prior to this
    fix). (Simon)

    \item Bugfix for polygons and xsplines. They should now handle the
    case where an 'id.length' is 0. (Simon)

    \item Plain SVG text can now be inserted into the image (in a
    similar manner to 'grid.element') using 'grid.textNode'. (Simon)

    \item Bugfix 'childrenOrder' is now respected for gTrees.

    \item Bugfix for colours. 0 is now valid (but transparent). (Simon)

    \item Fix for garnishing. They should now always be applied over the
    top of existing SVG attributes. (Simon)

    \item Bug fix for fill in arrow heads on xsplines (was being
    forced to transparent)

    \item Bug fix to trim identical values from start and end of
    xspline points (otherwise auto calculation of arrow orientation
    can get confused)
  }
}

\section{Changes in version 1.1-0}{
  \itemize{

    \item Added options for 'vpPath' and 'gPath' separators. This allows
    for easier manipulation in JavaScript as the separators no longer
    need to be the troublesome '::' (which require escaping with CSS
    selectors). (Simon)

    \item Exporting HTML files is now optional. (Simon)

    \item Always return a named list with the output of
    'gridToSVG()'. This is invisibly returned when an SVG file is saved
    to disk. (Simon)

    \item Added 'usePaths' option for determining whether to use vpPaths
    and gPaths SVG IDs. (Simon)

    \item Added 'uniqueNames' option for generating unique names for SVG
    IDs from grob and viewport names. This further distances ourselves
    from the original grid names. (Simon)

    \item Added 'export.mappings' option for exporting name mapping
    information. This allows us to keep track of names and how they have
    been modified by gridSVG. (Simon)

    \item Added 'gridSVGMappings' function to import mapping
    information. (Simon)

    \item Added 'getSVGMappings' function to retrieve IDs generated for
    an image from a grob or a viewport name. Also exported are CSS
    selectors and XPath expressions. These can also be retrieved by
    'getSVGMappings'. (Simon)

    \item Added new generic element interface, 'grid.element'. Allows
    any arbitrary SVG element (or tree of elements) to be inserted into
    the resulting SVG image. (Simon)

    \item When using the 'grep' argument for 'grid.hyperlink' and
    'grid.garnish', we can now apply effects to multiple grobs where
    gPaths are regular expressions. (Simon)

    \item Added a new optional argument to 'gridToSVG', called
    'annotate'. If 'TRUE', adds an SVG 'metadata' element below the root
    '<svg>' element that provides information on how 'gridToSVG' was
    called, along with metadata about gridSVG itself. Potentially useful
    for debugging. (Simon)

    \item Including support for 'clipGrob's. (Simon)

    \item Add support for 'gpar()'s 'lex' parameter. (Simon)

  }
}

\section{Changes in version 1.0-0}{
  \itemize{

    \item Initial implementation of viewport coordinate information
    exporting. (Simon)

    \item Added support for coordinate system importing and unit
    conversion. (Simon)

    \item Added support for exporting a JS file with utility functions
    present. Of note is that these include JS implementations of unit
    conversion routines. (Simon)

    \item Using viewport paths instead of viewport names for group
    elements. This causes us to refer to clipping paths and coordinate
    information based on the path. Viewport paths still have a numeric
    suffix. (Simon)

    \item Script MIME type updated to be more compatible with the SVG
    spec. (Simon)

    \item Added call to 'grid.refresh()' when running 'gridToSVG()' in
    order to avoid seeing a blank page. (Simon)

    \item Axis sub-grobs now adhere to the common gridSVG naming
    scheme. (Simon)

    \item All markup-based output is now written using the 'XML'
    package. (Simon)

    \item Added a new option to 'gridToSVG()', 'res'. This sets the
    device resolution so that we can reproduce plots regardless of the
    source device that 'gridToSVG()' grabs a grid scene from. (Simon)

    \item Added a new option to 'gridToSVG()', 'indent'. This either
    exports SVG with hierarchical indentation, or none at all. All
    output occurs in one line in the case that the 'indent' option is
    'FALSE'. (Simon)

    \item Making the XML declaration optional. This means that inserting
    SVG straight into an HTML5 document is more easily done because the
    declaration is not necessary with inline SVG. (Simon)

    \item When the filename is set to 'NULL' or '""' return the SVG
    document as a list containing the root SVG node reference,
    coordinate data (list) and JS utility functions (character
    vector). (Simon)

    \item Use 'person()' in the DESCRIPTION file. (Simon)

    \item Reimplement 'pointsGrob's as SVG '<symbol>'s, referenced by
    '<use>' elements. Many more 'pch's are now animatable and
    drawable. Furthermore, the definitions of 'pch's now matches
    R's. (Simon)

    \item Added 'commentGrob' which writes comments when exported to
    SVG. (Simon)

    \item Use data URIs for 'rasterGrob's to embed images inline in
    SVG. Allows us to truly create standalone SVG files, rather than SVG
    with a lot of referenced PNGs. Lifted C code from the 'markdown'
    package (permissive licence) to do the job. Just keeping a very
    small subset of the C code ('markdown' does a lot of cool stuff that
    we don't need). (Simon)

    \item Bug-fix for 'gpar()'s, support 'font' as an alias for
    'fontface'. In particular it affected some 'ggplot2' plots. (Simon)

    \item Adding in support for 'gtable' grobs as 'ggplot2' uses
    them. Requires borrowing code from 'gtable' to keep the package
    checker happy. (Simon)

    \item Small fix to avoid error from text justification outside the 0
    to 1 range (by clamping justifications to the 0 to 1 range).

    \item Added 'viewBox' attribute to top-level <svg> element.

    \item Adding 'show' argument to 'grid.hyperlink()'. Allows links to
    opened in another window/tab rather than the current
    window/tab. (Simon).

    \item Added new functions to support global package options, plus
    created a global option to control the separator used when
    appending a number suffix to grob names for SVG element ids.

    \item Added 'grep' argument to grid.hyperlink()
    (suggestion by Oscar Perpignan Lamigueiro).

  }
}

\section{Changes in version 0.9-4}{
  \itemize{

    \item Added dependency on R >= 2.15.0

    (plotmath location depends on 'grobAscent()')

    \item 'gridToSVG()' now copes with empty text, e.g.,
    'grid.text("")'.

    SVG elements are still produced (so that there is something in the
    SVG doc that corresponds to the original grid grob), but nothing
    should be drawn when the SVG doc is viewed.

    Reported by Gabriel Becker.

    \item 'gridToSVG()' no longer ignores 'hjust' and 'vjust' in
    'grid.rect()'.

    Reported by Gabriel Becker.

    \item Conversion of points grobs for 'pch=15:20' now sets colours
    correctly (used to be wrong if points grob did not have explicit
    'gpar(col)' setting).

    \item Improved animation of x/y/size for points grobs.

    Now works for pch=0,1,2, 5,6, 15--25

    (i.e., does not work yet on symbols that are combinations of shapes)

    \item Fixed problem with raster aspect ratio.

    \item Fixed problem with animating raster grobs when width and/or
    height are not specified.

    \item Fixed bug in animating segments grobs (used to just not work).

    \item Added support for 'roundrect' grobs.

    \item Added support for 'move.to' and 'line.to' grobs.

    \item Rounding more SVG attributes to 2dp, only a few were missed
    earlier. (Simon)

    \item Points grobs for 'pch=15:20' now check whether there is an
    explicit 'gpar(col)'. If so, the fill is set to that, otherwise this
    is retrieved from the viewport. (Simon)

  }
}

\section{Changes in version 0.9-0}{
  \itemize{

    \item Added dependency on R >= 2.13.0

    ('grid.grab(wrap=true)' only works with bug fix in r54813).

    \item Replaced partially matching arguments with full argument
    names. (Simon)

    \item Added plotmath support (outputs MathML).

    Note that positioning of MathML output is VERY unlikely to be
    accurate because there is not only the problem of font differences
    BUT ALSO the problem of a different math formula layout engine!

    \item Changed 'x11()' to 'dev.new()' in 'tests/*.R' code.

    \item Added animation support for polygon grobs and path grobs.

    \item Changed translation of rasterGrob grobs to SVG elements. They
    are now an '<image>' wrapped in two '<g>'s.

    The outer '<g>' provides a translation; the inner '<g>' provides a
    scaling; and the image is at (0, 0) and size (1, 1). This allows for
    ...

    \item Added animation support for 'rasterGrob' grobs.

    \item Added animation support for 'xsplineGrob' grobs.

    Note that closed xsplines are unlikely to animate smoothly (because
    the result is an animated '<path>' with a variable number of
    operations).

    \item Added 'group' argument for 'grid.hyperlink()'.

  }
}

\section{Changes in version 0.8-0}{
  \itemize{

    \item Started rounding all numeric values to 2 dp (in SVG output).

    \item Added 'animValue' and 'animUnit' classes to somewhat formalise
    the specification of animation values for attributes.

    \item Removed the 'id' argument from 'grid.animate()'.

    \item Added 'begin' argument to 'grid.animate()'.

    \item Added 'animation' vignette, which describes how to specify
    animation values for 'grid.animate()'.

    \item Named top-level gTree 'gridSVG' (and therefore '<g
    id="gridSVG">').

    \item Added 'inline' argument to 'grid.script()'.

    \item Added 'group' argument to 'grid.garnish()' so that attributes
    can be applied EITHER to the parent '<g>' (the default) OR to the
    individual child elements.

    \item Changed conversion of graphical parameters.

    Instead of creating a single 'style' attribute in each element, now
    create individual SVG presentation attributes, like 'fill' and
    'fill-opacity'.

    Also, ONLY record explicit 'gp' settings, rather than ALWAYS
    recording ALL current settings for ALL elements.

    \item Modified 'grid.garnish()' so that we can garnish the same
    grob multiple times (without overwriting previous garnish).

    \item Modified 'grid.animate()' so that we can animate the same grob
    multiple times (without overwriting previous animation).

    \item Added 'group' argument to 'grid.animate()' so that animation
    can apply EITHER to the individual child elements (the default) OR
    to the parent '<g>'.

    \item Added vignette on extending the 'gridSVG' package.

    'vignette("extensibility")'

    \item Added 'interpolate' argument to 'grid.animate()' (only
    currently supports 'linear' or 'discrete').

    \item Implemented animation for segments grobs.

    \item Improved recording of viewports and vpPaths, when depth is
    greater than 1 (e.g., a vpStack). Now all viewports (not just the
    last one) are recorded as '<g>' elements.

  }
}

\section{Changes in version 0.7-0}{
  \itemize{

    \item Added support for polyline grobs (Simon)

    \item Polygon grobs now respect the 'id' parameter (Simon)

    \item Semi-transparent colours can now be applied, making use of
    SVG's 'fill-opacity', 'stroke-opacity' and 'opacity'
    attributes. (Simon)

    \item xsplines can be drawn. Currently uses the '<polyline>' or
    '<path>' elements depending on whether the xspline is open or
    closed. (Simon)

    \item Lines, segments, polylines and xsplines now support the arrow
    parameter. (Simon)

    \item Grobs that produce multiple SVG elements now wrap the multiple
    elements in a '<g>' with the original grob name on the '<g>' and the
    multiple elements name-mangled with an integer suffix. (Simon)

    \item Multiline text support added. (Simon)

    \item Text with multiple labels no longer draw all labels at each
    location. (Simon)

    \item Line properties such as 'linejoin' and 'lineend' are now
    understood. (Simon)

    \item The 'gpar()' properties 'font'/'fontface' and 'fontfamily' are
    now supported. 'fontface' has a direct mapping to CSS, but
    'fontfamily' is a little bit more messy. 'fontfamily' has to specify
    fallback fonts if none are present in the browser. The 'serif',
    'sans' and 'mono' families are given a reasonable attempt. (Simon)

    \item Naming of grobs has been refactored into a function call
    'subGrobName()'. To get the base name of the grob again, use
    'baseGrobName()'. This allows an easier switch to a different naming
    scheme if necessary. (Simon)

    \item Initial support for 'frameGrob's (and 'cellGrob's). (Simon)

    \item Numerical justification of text is supported. Justification
    parameters are rounded so they belong to one of {0, 0.5, 1}. (Simon)

    \item 'gTree' support has been improved, all 'lattice' demos can now
    be drawn, along with some 'ggplot2' plots (assuming 'pch's are
    supported). (Simon)

    \item The HTML file that is produced now rounds the 'height' and
    'width' attributes to the nearest integer to avoid scrollbars
    becoming visible. (Simon)

    \item Warnings are no longer produced regarding unclosed
    connections. (Simon)

    \item 'pch's 0:25 and 32:127 are supported. (Simon)

    \item Clipping to viewports is now possible. This occurs at the
    group level so that when a viewport is pushed to, its name is now
    suffixed with the number of the viewport that has been pushed
    to. (Simon)

  }
}

\section{Changes in version 0.6-0}{
  \itemize{

    \item Updated for the fact that the R graphics engine now supports
    complex paths.

    \itemize{

      \item Removed 'grid.path()' and 'pathGrob' from this package (now
      in 'grid' package).

      \item Removed 'svgGrobify()' (the normal 'grobify()' in 'grImport'
      now handles complex paths).

      \item Tweaked passage of 'grid' pathgrob through generic device to
      SVG device.

    }

  }
}

\section{Changes in version 0.5-10}{
  \itemize{

    \item Conversion of 'gpar()' to SVG CSS now recognises 'fillrule'
    (so that pathgrobs [and polygons] can specify "nonzero" or
    "evenodd")

    \item 'svgGrobify()' passes 'object@rule' from PictureFill objects
    to 'gpar()' so that 'fill' and 'eofill' from imported images will be
    represented by appropriate paths in SVG.

    \item The current locale encoding (i.e., the encoding used to write
    the SVG file) is now recorded in the SVG file.

  }
}

\section{Changes in version 0.5-8}{

  The following changes occurred between versions 0.5-3 and 0.5-8.

  \itemize{

    \item Added 'redraw' argument to 'grid.garnish()'

    \item Improved sizing of text (especially when it is controlled via
    'cex')

    \item Correction for rotated text (SVG measures angles clock-wise)

    \item Improved recording of SVG 'style' attribute so that it handles
    vectorized settings better.

    \item Improved recording of 'lty' setting in SVG output.

    \item Forced ALL gpar settings from grid to SVG output (i.e., no
    longer have to EXPLICITLY set gpars).

    \item Added checks for XML specials when producing SVG output.

    \item Improved sizing of text (and line widths) to be responsive to
    device resolution.

    \item Added 'grid.path()' and 'pathGrob()' which can be used to draw
    polygons with holes (when producing SVG output).

    \item Added 'svgGrobify()' which uses 'pathGrob()' when converting a
    Picture from 'grImport' to grobs.

  }
}

\section{Changes in version 0.4}{
  \itemize{

    \item Updated properly for R 2.0.0

    Hyperlinks work the same as before, but Animation now works
    differently: you animate an entire grob rather than an individual
    unit.

    \item Integrated changes from Nathan Whitehouse and colleagues to
    support arbitrary SVG attributes and script chunks.

    \item SVG shape chunks now use grid grob names for the id attribute.

    If more than one chunk is produced then a 1:n suffix is
    attached. For example, 'grid.circle(r=1:4/8, name="circgrob")'
    produces four '<circle>' chunks with id's "circle1" to "circle4",
    but 'grid.rect(name="rectgrob")' produces a single '<rect>' chunk
    with id "rectgrob".

    \item Added NAMESPACE.

  }
}

\section{Changes in version 0.3}{
  \itemize{

    \item Minimal update to get version that runs with grid in R 1.9.*

  }
}

\section{Changes in version 0.2-1}{

  The following changes occurred between version 0.2 and 0.2-1.

  \itemize{

    \item Changed implementation of lpaste from recursive to loop (to
    avoid "evaluation nested too deeply" problems)

    \item Fixed up [cx|cy].time.unit for case where only one of x|y is a
    "time.unit". Used to not replicate the "normal" unit correctly.

  }
}
